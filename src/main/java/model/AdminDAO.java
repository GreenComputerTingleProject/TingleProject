package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

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

        public ArrayList<MusicDTO> musicList(){
            ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();
            sql = "select * from music order by id desc";

            try {
                ptmt = con.prepareStatement(sql);
                rs = ptmt.executeQuery();

                while (rs.next()){
                    MusicDTO dto = new MusicDTO();

                    dto.setId(rs.getInt("id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setArtist(rs.getString("artist"));
                    dto.setAlbum(rs.getString("album"));
                    dto.setGenre(rs.getString("genre"));
                    dto.setMood(rs.getString("mood"));
                    dto.setFile_path(rs.getString("file_path"));
                    dto.setCover_img(rs.getString("cover_img"));
                    dto.setRelease_date(rs.getDate("release_date"));
                    dto.setCnt(rs.getInt("cnt"));
                    dto.setLyrics(rs.getString("lyrics"));

                    res.add(dto);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                close();
            }
            return res;
        }

        public MusicDTO musicDetail(String id){
            MusicDTO dto = new MusicDTO();
            sql = "select * from music where id = ?";

            try {
                ptmt = con.prepareStatement(sql);
                ptmt.setString(1, id);
                rs = ptmt.executeQuery();

                if(rs.next()){
                    dto.setId(rs.getInt("id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setArtist(rs.getString("artist"));
                    dto.setAlbum(rs.getString("album"));
                    dto.setGenre(rs.getString("genre"));
                    dto.setMood(rs.getString("mood"));
                    dto.setFile_path(rs.getString("file_path"));
                    dto.setCover_img(rs.getString("cover_img"));
                    dto.setRelease_date(rs.getDate("release_date"));
                    dto.setCnt(rs.getInt("cnt"));
                    dto.setLyrics(rs.getString("lyrics"));
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                close();
            }
        return dto;
        }

        public void musicInsert(MusicDTO dto){
            try {
            sql = "insert into music (title, artist, album, genre, mood, file_path, cover_img, cnt, lyrics, release_date)"
                    + "values(?, ?, ?, ?, ?, ?, ?, 0, ?, sysdate())";

                ptmt = con.prepareStatement(sql);

                ptmt.setString(1,dto.title);
                ptmt.setString(2,dto.artist);
                ptmt.setString(3,dto.album);
                ptmt.setString(4,dto.genre);
                ptmt.setString(5,dto.mood);
                ptmt.setString(6,dto.file_path);
                ptmt.setString(7,dto.cover_img);
                ptmt.setString(8,dto.lyrics);

                ptmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                close();
            }
        }

        public void musicDelete(int id){

            sql = "delete from music where id = ?";

            try {
                ptmt = con.prepareStatement(sql);
                ptmt.setInt(1, id);
                rs = ptmt.executeQuery();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public void musicModify(MusicDTO dto){
            sql = "update music  set title = ?, artist = ?, album = ?, genre =?, mood =?, file_path = ?, cover_img = ?, lyrics = ? where id = ?";

            try {
                ptmt = con.prepareStatement(sql);

                ptmt.setString(1, dto.title);
                ptmt.setString(2, dto.artist);
                ptmt.setString(3, dto.album);
                ptmt.setString(4, dto.genre);
                ptmt.setString(5, dto.mood);
                ptmt.setString(6, dto.file_path);
                ptmt.setString(7, dto.cover_img);
                ptmt.setString(8, dto.lyrics);
                ptmt.setInt(9, dto.id);

                ptmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                close();
            }
        }


        public ArrayList<MusicDTO> mNameSerch(String mname){
            ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();


            sql = "select * from music where title like = ?";

            try {
                ptmt = con.prepareStatement(sql);
                ptmt.setString(1, mname);
                rs = ptmt.executeQuery();

                while (rs.next()){
                    MusicDTO dto = new MusicDTO();

                    dto.setId(rs.getInt("id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setArtist(rs.getString("artist"));
                    dto.setAlbum(rs.getString("album"));
                    dto.setGenre(rs.getString("genre"));
                    dto.setMood(rs.getString("mood"));
                    dto.setFile_path(rs.getString("file_path"));
                    dto.setCover_img(rs.getString("cover_img"));
                    dto.setRelease_date(rs.getDate("release_date"));
                    dto.setCnt(rs.getInt("cnt"));
                    dto.setLyrics(rs.getString("lyrics"));

                    res.add(dto);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return res;
        }

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }
}
