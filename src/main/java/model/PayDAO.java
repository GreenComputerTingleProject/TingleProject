package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

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
            sql = "insert into pay ( user_id, imp_uid, customer_uid, paid_amount, reg_date ) values( ?, ?, ?, ?, sysdate() )";

            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1, dto.getUser_id());
            ptmt.setString(2, dto.getImp_uid());
            ptmt.setString(3, dto.getCustomer_uid());
            ptmt.setInt(4, dto.getPaid_amount());

            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public int pay_total_amount() {
        int res = 0;

        try {
            sql = "select paid_amount from pay";

            ptmt = con.prepareStatement(sql);
            rs =  ptmt.executeQuery();

            while(rs.next()) {
                res += rs.getInt("paid_amount");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public HashMap<Integer, Integer> pay_monthly_amount() {
        HashMap<Integer, Integer> monthly_list = new HashMap<>();

        for (int i = 1; i <= 12; i++) {
            monthly_list.put(i, 0);
        }

        try {
            sql = "select paid_amount, reg_date from pay";

            ptmt = con.prepareStatement(sql);
            rs =  ptmt.executeQuery();

            while(rs.next()) {
                int month = rs.getTimestamp("reg_date").getMonth() + 1;
                monthly_list.put(month, (monthly_list.get(month)) + rs.getInt("paid_amount"));
            }

            System.out.println(monthly_list);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return monthly_list;
    }

    public ArrayList<PayDTO> pay_my_list(int user_id){
        ArrayList<PayDTO> res = new ArrayList<PayDTO>();

        sql = "select * from pay where user_id = ? order by reg_date desc";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, user_id);
            rs = ptmt.executeQuery();

            while (rs.next()){
                PayDTO dto = new PayDTO();

                dto.setId(rs.getInt("id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setImp_uid(rs.getString("imp_uid"));
                dto.setPaid_amount(rs.getInt("paid_amount"));
                dto.setReg_date(rs.getTimestamp("reg_date"));

                res.add(dto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<PayDTO> calculate(String sDay, String eDay){
        ArrayList<PayDTO> res = new ArrayList<PayDTO>();

        sql = "select * from pay where reg_date BETWEEN ? AND ? order by reg_date desc";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, sDay);
            ptmt.setString(2, eDay);
            rs = ptmt.executeQuery();

            while (rs.next()){
                PayDTO dto = new PayDTO();

                dto.setId(rs.getInt("id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setImp_uid(rs.getString("imp_uid"));
                dto.setPaid_amount(rs.getInt("paid_amount"));
                dto.setReg_date(rs.getTimestamp("reg_date"));

                res.add(dto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public ArrayList<PayDTO> calculateASC(String sDay, String eDay){
        ArrayList<PayDTO> res = new ArrayList<PayDTO>();

        sql = "select * from pay where reg_date BETWEEN ? AND ? order by reg_date asc";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, sDay);
            ptmt.setString(2, eDay);
            rs = ptmt.executeQuery();

            while (rs.next()){
                PayDTO dto = new PayDTO();

                dto.setId(rs.getInt("id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setImp_uid(rs.getString("imp_uid"));
                dto.setPaid_amount(rs.getInt("paid_amount"));
                dto.setReg_date(rs.getTimestamp("reg_date"));

                res.add(dto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
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
