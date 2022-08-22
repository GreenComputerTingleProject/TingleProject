package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PayDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public PayDAO() {
        try {
            Context init = new InitialContext();
            //192.168.20.30
            DataSource ds = (DataSource) init.lookup("java:comp/env/tingle");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int pay_add(PayDTO dto) {

        try {
            sql = "insert into pay ( user_id, imp_uid, paid_amount, reg_date ) values( ?, ?, ?, sysdate() )";

            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1, dto.getUser_id());
            ptmt.setString(2, dto.getImp_uid());
            ptmt.setInt(3, dto.getPaid_amount());

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
