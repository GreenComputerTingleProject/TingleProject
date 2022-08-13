package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public AdminDAO() {
        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/tingle");
            con = ds.getConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

        public AdminDTO login(AdminDTO dto) {
            AdminDTO res = new AdminDTO();

            try {
                sql = "select * from admin where login_id = ? and login_pw = ?";

                ptmt = con.prepareStatement(sql);

                ptmt.setString(1, dto.login_id);
                ptmt.setString(2, dto.login_pw);

                rs = ptmt.executeQuery();

                if(rs.next()) {
                    res.setId(rs.getInt("id"));
                    res.setLogin_id(rs.getString("login_id"));
                    res.setLogin_pw(rs.getString("login_pw"));
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
