package model;

import admin.AdminMusicInsertReg;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Pattern;

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

        public void musicDelete(HttpServletRequest request, int id){
            try {
            sql = "select * from music where id = ?";
            String path;
            Path overlapfile;
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();

            if(rs.next()){
                if(rs.getString("file_path") != null){
                    path = request.getRealPath("/mp3/");
                    overlapfile = Paths.get(path + rs.getString("file_path") );
                    Files.delete(overlapfile);
                }
                if(rs.getString("cover_img") != null){
                    path = request.getRealPath("/img/");
                    overlapfile = Paths.get(path + rs.getString("cover_img") );
                    Files.delete(overlapfile);
                }
            }

            sql = "delete from library where music_id = ?";
                ptmt = con.prepareStatement(sql);
                ptmt.setInt(1, id);
                rs = ptmt.executeQuery();

            sql = "delete from music where id = ?";


                ptmt = con.prepareStatement(sql);
                ptmt.setInt(1, id);
                rs = ptmt.executeQuery();
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                close();
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
            System.out.println("데이터베이스 조회 키워드 = :" + mname);
            sql = "SELECT * FROM music WHERE title LIKE  concat('%', ? , '%')";

            try {
                ptmt = con.prepareStatement(sql);
                ptmt.setString(1, mname);
                rs = ptmt.executeQuery();

                System.out.println(sql);
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

                    System.out.println("추가완료");

                    res.add(dto);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            finally {
                close();
            }
            return res;
        }

        public boolean fileExtension_Check(String pattern, String filename){
            boolean res = true;

            if(filename != null){
                res = Pattern.matches(pattern,filename);
            }

            return res;
        }

        public void findImgFile(HttpServletRequest request, String filename) {
        if(filename != null){
            String pp = ".*[.](jpeg|jpg|bmp|png|gif|pdf)";
            Path mpath = Paths.get(request.getRealPath("/mp3/") + filename);
            Path ipath = Paths.get(request.getRealPath("/img/") + filename);
            if (Pattern.matches(pp, filename)) {
                try {
                    Files.move(mpath, ipath, StandardCopyOption.ATOMIC_MOVE);
                    System.out.println("이미지파일로 이동성공");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } else {
                System.out.println("이미지파일로 이동실패");

            }
        }
    }

    public ArrayList<UserDTO> userList(){
        ArrayList<UserDTO> res = new  ArrayList<UserDTO>();
        sql = "select * from user order by id desc";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while (rs.next()){
                UserDTO dto = new UserDTO();

                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setLogin_pw(rs.getString("login_pw"));
                dto.setName(rs.getString("name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPhone_number(rs.getString("phone_number"));
                dto.setEmail_address(rs.getString("email_address"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setJoin_type(rs.getInt("join_type"));
                dto.setJoin_date(rs.getDate("join_date"));
                dto.setMembership(rs.getInt("membership"));
                dto.setPersonal_type(rs.getString("personal_type"));

                res.add(dto);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public UserDTO userDetail(String id){
        UserDTO dto = new UserDTO();
        sql = "select * from user where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, id);
            rs = ptmt.executeQuery();

            if(rs.next()){
                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setLogin_pw(rs.getString("login_pw"));
                dto.setName(rs.getString("name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPhone_number(rs.getString("phone_number"));
                dto.setEmail_address(rs.getString("email_address"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setJoin_type(rs.getInt("join_type"));
                dto.setJoin_date(rs.getDate("join_date"));
                dto.setMembership(rs.getInt("membership"));
                dto.setPersonal_type(rs.getString("personal_type"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return dto;
    }

    public String userDelete(HttpServletRequest request , int id){

        String profile_image = "exfire_member.png";
        String msg;
        String membership = "3";
        try {

        sql = "select * from user where id = ?";

        ptmt = con.prepareStatement(sql);
        ptmt.setInt(1, id);
        rs = ptmt.executeQuery();


        if(rs.next() && !rs.getString("profile_image").equals(profile_image)  && (!rs.getString("membership").equals( "3"))){
           String path = request.getRealPath("/img/");
           msg = "탈퇴되었습니다";
           Path overlapfile = Paths.get(path + rs.getString("profile_image") );
           Files.delete(overlapfile);

            sql = "update user set membership = ?, profile_image = ? where id = ?";

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, membership);
            ptmt.setString(2, profile_image);
            ptmt.setInt(3, id);

            ptmt.executeUpdate();

        } else {
          msg = "이미 탈퇴한 회원입니다";
        }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        finally {
            close();
        }
        return msg;
    }
    public void userModify(UserDTO dto){
        sql = "update user  set login_id = ?, login_pw = ?, name = ?, nickname =?, phone_number =?, email_address = ?, profile_image = ?, join_type = ?,"
               + "membership = ?, personal_type = ? where id = ?";

        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setString(1, dto.login_id);
            ptmt.setString(2, dto.login_pw);
            ptmt.setString(3, dto.name);
            ptmt.setString(4, dto.nickname);
            ptmt.setString(5, dto.phone_number);
            ptmt.setString(6, dto.email_address);
            ptmt.setString(7, dto.profile_image);
            ptmt.setInt(8, dto.join_type);
            ptmt.setInt(9, dto.membership);
            ptmt.setString(10, dto.personal_type);
            ptmt.setInt(11, dto.id);

            ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public ArrayList<UserDTO> uNameSerch(String uname){
        ArrayList<UserDTO> res = new ArrayList<UserDTO>();
        System.out.println("데이터베이스 조회 키워드 = :" + uname);
        sql = "SELECT * FROM user WHERE name LIKE concat('%', ? , '%')";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, uname);
            rs = ptmt.executeQuery();

            System.out.println(sql);
            while (rs.next()){
                UserDTO dto = new UserDTO();

                dto.setId(rs.getInt("id"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setLogin_pw(rs.getString("login_pw"));
                dto.setName(rs.getString("name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPhone_number(rs.getString("phone_number"));
                dto.setEmail_address(rs.getString("email_address"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setJoin_type(rs.getInt("join_type"));
                dto.setJoin_date(rs.getDate("join_date"));
                dto.setMembership(rs.getInt("membership"));
                dto.setPersonal_type(rs.getString("personal_type"));

                System.out.println("추가완료");

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }  finally {
            close();
        }
        return res;
    }

    public ArrayList<PayDTO> calculate(String sDay, String eDay){
        ArrayList<PayDTO> res = new ArrayList<PayDTO>();

        sql = "select * from pay where reg_date BETWEEN ? AND ?";

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

