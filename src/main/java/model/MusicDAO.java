package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MusicDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public MusicDAO() {
        try {
            Context init = new InitialContext();
            //192.168.20.30
            DataSource ds = (DataSource) init.lookup("java:comp/env/tingle");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<MusicDTO> music_list(UserDTO dto) {
        ArrayList<MusicDTO> res = new ArrayList<>();

        try {
            sql = "select *\n" +
                    "from music as music\n" +
                    "         join library as library\n" +
                    "              on music.id = library.music_id\n" +
                    "         join user as user\n" +
                    "              on library.user_id = user.id\n" +
                    "where user_id = ?\n" +
                    "order by library.reg_date desc";

            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1, dto.id);

            rs = ptmt.executeQuery();

            while (rs.next()) {
                MusicDTO music = new MusicDTO();

                music.setId(rs.getInt("music.id"));
                music.setTitle(rs.getString("title"));
                music.setArtist(rs.getString("artist"));
                music.setAlbum(rs.getString("album"));
                music.setGenre(rs.getString("genre"));
                music.setMood(rs.getString("mood"));
                music.setFile_path(rs.getString("file_path"));
                music.setCover_img(rs.getString("cover_img"));
                music.setCnt(rs.getInt("cnt"));
                music.setLyrics(rs.getString("lyrics"));
                music.setRelease_date(rs.getTimestamp("release_date"));

                res.add(music);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<MusicDTO> chartList() {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();

        sql = "select * from music order by cnt desc limit 100 ";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setAlbum(rs.getString("album"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close();
        }


        return res;
    }

    public ArrayList<MusicDTO> genreList(int genre_no) {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();

        sql = "select * from music where genre_no = ? order by cnt desc limit 100 ";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, genre_no);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setAlbum(rs.getString("album"));
                dto.setGenre(rs.getString("genre"));
                dto.setGenre_no(rs.getInt("genre_no"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close();
        }


        return res;
    }

    public ArrayList<MusicDTO> findTitle(String title) {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();
        System.out.println("데이터베이스 조회 키워드 = :" + title );
        sql = "SELECT * FROM music WHERE title LIKE concat('%', ? , '%')";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, title);

            rs = ptmt.executeQuery();
            System.out.println("rs"+rs);
            while(rs.next()){
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setCover_img(rs.getString("cover_img"));
                dto.setArtist(rs.getString("artist"));
                dto.setAlbum(rs.getString("album"));
                dto.setGenre(rs.getString("genre"));
                dto.setGenre_no(rs.getInt("genre_no"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }
        return res;
    }

    public ArrayList<MusicDTO> findArtist(String artist) {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();
        System.out.println("데이터베이스 조회 키워드 = :" + artist );
        sql = "SELECT * FROM music WHERE artist LIKE concat('%', ? , '%')";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, artist);

            rs = ptmt.executeQuery();
            System.out.println("rs"+rs);
            while(rs.next()){
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setAritst_img(rs.getString("artist_img"));
                dto.setAlbum(rs.getString("album"));
                dto.setGenre(rs.getString("genre"));
                dto.setGenre_no(rs.getInt("genre_no"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }
        return res;
    }

    public ArrayList<MusicDTO> findAlbum(String album) {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();
        System.out.println("데이터베이스 조회 키워드 = :" + album );
        sql = "SELECT * FROM music WHERE album LIKE concat('%', ? , '%')";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, album);

            rs = ptmt.executeQuery();
            System.out.println("rs"+rs);
            while(rs.next()){
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setAritst_img(rs.getString("artist_img"));
                dto.setCover_img(rs.getString("cover_img"));
                dto.setAlbum(rs.getString("album"));
                dto.setGenre(rs.getString("genre"));
                dto.setGenre_no(rs.getInt("genre_no"));
                dto.setRelease_date(rs.getTimestamp("release_date"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }
        return res;
    }

    public ArrayList<MusicDTO> findLylics(String lylics) {
        ArrayList<MusicDTO> res = new ArrayList<MusicDTO>();
        System.out.println("데이터베이스 조회 키워드 = :" + lylics );
        sql = "SELECT * FROM music WHERE album LIKE concat('%', ? , '%')";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, lylics);

            rs = ptmt.executeQuery();
            System.out.println("rs"+rs);
            while(rs.next()){
                MusicDTO dto = new MusicDTO();
                dto.setId(rs.getInt("id"));
                dto.setCnt(rs.getInt("cnt"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setAritst_img(rs.getString("artist_img"));
                dto.setAlbum(rs.getString("album"));
                dto.setGenre(rs.getString("genre"));
                dto.setGenre_no(rs.getInt("genre_no"));
                dto.setFile_path(rs.getString("file_path"));
                res.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
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
