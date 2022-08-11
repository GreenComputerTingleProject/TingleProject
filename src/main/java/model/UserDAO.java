package model;

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

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }
}
