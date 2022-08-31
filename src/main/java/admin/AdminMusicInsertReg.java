package admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

public class AdminMusicInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminMusicInsertReg execute실행");

        String msg = "음원등록이 완료되었습니다";
//        String path = "C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\mp3";
        String path = request.getRealPath("/mp3/");

        AdminDAO dao = new AdminDAO();


        int size = 1024*1024*100;
        int genreNo = 0;
        String musicFile_check = ".*[.](mp3)";
        String imgFile_check = ".*[.](jpeg|jpg|bmp|png|gif|pdf)";

        try {
            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());






           boolean check1 = dao.fileExtension_Check(musicFile_check,mr.getFilesystemName("file_path"));
           boolean check2 = dao.fileExtension_Check(imgFile_check,mr.getFilesystemName("cover_img"));
           String genre = mr.getParameter("genre");

           switch (genre){
               case "발라드":
                   genreNo = 1;
                   break;
               case "락":
                   genreNo = 2;
                   break;
               case "힙합":
                   genreNo = 3;
                   break;
               case "댄스":
                   genreNo = 4;
                   break;
               case "재즈":
                   genreNo = 5;
                   break;
               case "클래식":
                   genreNo = 6;
                   break;
               case "팝":
                   genreNo = 7;
                   break;
           }

            if(check1 && check2) {
                MusicDTO musicData = new MusicDTO();
                musicData.setTitle(mr.getParameter("title"));
                musicData.setArtist(mr.getParameter("artist"));
                musicData.setArtist_no(Integer.parseInt(mr.getParameter("artist_no")));
                musicData.setAlbum(mr.getParameter("album"));
                musicData.setGenre(mr.getParameter("genre"));
                musicData.setFile_path(mr.getFilesystemName("file_path"));
                musicData.setCover_img(mr.getFilesystemName("cover_img"));
                // 이미지파일은 img 폴더로 넣기
                dao.findImgFile(request, mr.getFilesystemName("cover_img"));
                musicData.setGenre_no(genreNo);
                musicData.setRelease_date2(mr.getParameter("release_date"));
                musicData.setLyrics(mr.getParameter("lyrics"));

                dao.musicInsert(musicData);

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminMusicList");
            } else {
                msg = "파일형식이 잘못되었습니다";
                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminMusicInsert");
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
