package model;

import user.SMSSend;

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
                    "values(?, ?, ?, ?, ?, ?, ?, ?, sysdate(), 1, ?)";

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.login_id);
            ptmt.setString(2, dto.login_pw);
            ptmt.setString(3, dto.name);
            ptmt.setString(4, dto.nickname);
            ptmt.setString(5, dto.phone_number);
            ptmt.setString(6, dto.email_address);
            ptmt.setString(7, dto.profile_image);
            ptmt.setInt(8, dto.join_type);
            ptmt.setString(9, dto.personal_type);

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
        try {
            sql = "select id from user where login_id = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, login_id);

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    // 회원가입 전화번호 인증
    // return은 인증번호. front단에서 res와 사용자가 입력한 번호가 일치하는지 확인시키면됨
    public String join_phone_outh(String phone_number) {

        String res = new SMSSend(phone_number).send();

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

    public String find_pw(String login_id, String name, String phone_number) {
        String login_pw = null;

        try {
            sql = "select login_pw from user where login_id = ? and name = ? and phone_number = ?";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, login_id);
            ptmt.setString(2, name);
            ptmt.setString(3, phone_number);

            rs = ptmt.executeQuery();

            if(rs.next()) {
                login_pw = rs.getString("login_pw");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return login_pw;
    }

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }
}
