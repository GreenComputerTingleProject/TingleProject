package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public BoardDAO() {
        try {
            Context init = new InitialContext();
            //192.168.20.30
            DataSource ds = (DataSource) init.lookup("java:comp/env/tingle");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<BoardDTO> board_info (int i) {
        ArrayList<BoardDTO> res = new ArrayList<BoardDTO>();

        sql = "select * from board where mode = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, i);
            rs = ptmt.executeQuery();

            while (rs.next()){
                BoardDTO dto = new BoardDTO();
                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setMode(rs.getInt("mode"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setKind(rs.getString("kind"));
                dto.setNickname(rs.getString("nickname"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setChecked(rs.getString("checked"));
                dto.setAnswer(rs.getString("answer"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public ArrayList<BoardDTO> board_inquriy (int user_id) {
        ArrayList<BoardDTO> res = new ArrayList<BoardDTO>();

        sql = "select * from board where mode = 3 and user_id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, user_id);
            rs = ptmt.executeQuery();

            while (rs.next()){
                BoardDTO dto = new BoardDTO();
                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setMode(rs.getInt("mode"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setKind(rs.getString("kind"));
                dto.setNickname(rs.getString("nickname"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setChecked(rs.getString("checked"));
                dto.setAnswer(rs.getString("answer"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public void inquriyInsert(BoardDTO dto){
        try {
            sql = "insert into board (login_id, user_id, content, title, reg_date, mode, kind, nickname, checked)"
                    + "values(?, ?, ?, ?, sysdate(), 3, ?, ?,?)";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1,dto.login_id);
            ptmt.setInt(2, dto.user_id);
            ptmt.setString(3, dto.content);
            ptmt.setString(4,dto.title);
            ptmt.setString(5, dto.kind);
            ptmt.setString(6, dto.nickname);
            ptmt.setString(7, dto.checked);

            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public BoardDTO noticeDetail(int id){
        BoardDTO dto = new BoardDTO();
        sql = "select * from board where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();

            if(rs.next()){
                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setUser_id(rs.getInt("user_id"));
                dto.setContent(rs.getString("content"));
                dto.setTitle(rs.getString("title"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setMode(rs.getInt("mode"));
                dto.setKind(rs.getString("kind"));
                dto.setNickname(rs.getString("nickname"));
                dto.setChecked(rs.getString("checked"));
                dto.setAnswer(rs.getString("answer"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return dto;
    }

    public void noticeInsert(BoardDTO dto){
        try {

            sql = "insert into board (content, title, reg_date, kind, nickname, mode)"
                    + "values(?,?,sysdate(),?,?,?)";

            ptmt = con.prepareStatement(sql);

            ptmt.setString(1,dto.content);
            ptmt.setString(2,dto.title);
            ptmt.setString(3,dto.kind);
            ptmt.setString(4,dto.nickname);
            ptmt.setInt(5,dto.mode);
            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void noticeModify(BoardDTO dto){
        sql = "update board  set title = ?, kind = ?, content = ? where id = ?";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, dto.title);
            ptmt.setString(2, dto.kind);
            ptmt.setString(3,dto.content);
            ptmt.setInt(4, dto.id);

            ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public void noticeDelete(int id){
        try {
            sql = "delete from board where id = ?";

            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public void inquiryAnswer(BoardDTO dto){
        sql = "update board  set answer = ?, checked = ? where id = ?";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, dto.answer);
            ptmt.setString(2, dto.checked);
            ptmt.setInt(3, dto.id);

            ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }

}
