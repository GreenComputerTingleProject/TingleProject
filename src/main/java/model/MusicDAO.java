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

            while(rs.next()) {
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

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try {ptmt.close();} catch (SQLException e) {}
        if(con!=null) try {con.close();} catch (SQLException e) {}
    }
}
