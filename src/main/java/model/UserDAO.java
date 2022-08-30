package model;

/*import user.SMSSend;*/

import user.SMSSend;
import user.SMSSend_V2;
import user.SMSSend_V3;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public UserDAO() {
        try {
            Context init = new InitialContext();
            //192.168.20.30
            DataSource ds = (DataSource) init.lookup("java:comp/env/tingle");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 회원가입
    public void join(UserDTO dto) {
        try {
            sql = "insert into user (login_id, login_pw, name, nickname, phone_number, email_address, profile_image, " +
                    "join_type, join_date, membership, personal_type) " +
                    "values(?, ?, ?, ?, ?, ?, ?, 1, sysdate(), 1, ?)";

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.login_id);
            ptmt.setString(2, dto.login_pw);
            ptmt.setString(3, dto.name);
            ptmt.setString(4, dto.nickname);
            ptmt.setString(5, dto.phone_number);
            ptmt.setString(6, dto.email_address);
            ptmt.setString(7, dto.profile_image);
            ptmt.setString(8, dto.personal_type);

            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    // 회원가입 ID 중복확인
    // return 0이면 중복 ID 없음 --> safe
    public int join_validation(String login_id) {

        int res = 0;
        try {
            sql = "select id from user where login_id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, login_id);

            rs =  ptmt.executeQuery();

            if(rs.next()) {
                res = rs.getInt("id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    // 회원가입 전화번호 인증
    // phone_number는 반드시 01012345678 형태로 입력되어야 합니다.
    // return은 인증번호. front단에서 res와 사용자가 입력한 번호가 일치하는지 확인시키면됨
    public String join_phone_outh(String phone_number) {

//       String res = new SMSSend(phone_number).send();
       String res = new SMSSend_V3().sendSMS(phone_number);

       return res;
    }

    // 로그인
    // return한 UserDTO를 session에 담아주세요
    public UserDTO login(UserDTO dto) {
        UserDTO res = new UserDTO();

        try {
            sql = "select * from user where login_id = ? and login_pw = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, dto.login_id);
            ptmt.setString(2, dto.login_pw);

            rs = ptmt.executeQuery();

            if(rs.next()) {
                res.setId(rs.getInt("id"));
                res.setJoin_type(rs.getInt("join_type"));
                res.setMembership(rs.getInt("membership"));
                res.setLogin_id(rs.getString("login_id"));
                res.setLogin_pw(rs.getString("login_pw"));
                res.setName(rs.getString("name"));
                res.setNickname(rs.getString("nickname"));
                res.setPhone_number(rs.getString("phone_number"));
                res.setEmail_address(rs.getString("email_address"));
                res.setProfile_image(rs.getString("profile_image"));
                res.setPersonal_type(rs.getString("personal_type"));
                res.setJoin_date(rs.getTimestamp("join_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    // 아이디 찾기
    // 해당 메소드 호출 전에 전화번호 인증 스텝을 진행해주세요
    // name과 phone_number를 받아서 login_id를 반환한다
    // return이 null인 경우 "아이디 없음"
    public String find_id(String name, String phone_number) {
        String login_id = null;

        try {
            sql = "select login_id from user where name = ? and phone_number = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, name);
            ptmt.setString(2, phone_number);

            rs = ptmt.executeQuery();

            if(rs.next()) {
                login_id = rs.getString("login_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return login_id;
    }

    // 비밀번호 재설정
    // 해당 메소드 호출 전에 전화번호 인증 스텝을 진행해주세요
    // id와 변경할 pw를 받아서  해당 id의 암호를 재설정합니다.
    // return이 0이면 재설정 실패. 0이 아니면 성공입니다.
    public int reset_pw(String login_pw, String login_id) {
        try {
            sql = "update user set login_pw = ? where login_id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, login_pw);
            ptmt.setString(2, login_id);

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public int update_info(UserDTO dto) {
        try {
            sql = "update user set nickname = ?, phone_number = ?, email_address = ?, profile_image = ?, personal_type = ? where id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, dto.getNickname());
            ptmt.setString(2, dto.getPhone_number());
            ptmt.setString(3, dto.getEmail_address());
            ptmt.setString(4, dto.getProfile_image());
            ptmt.setString(5, dto.getPersonal_type());
            ptmt.setInt(6, dto.getId());

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public int upgrade_membership(int user_id) {
        try {
            sql = "update user set membership = membership + 1 where id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1, user_id);

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public int downgrade_membership(int user_id) {
        try {
            sql = "update user set membership = membership - 1 where id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1, user_id);

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }
}
