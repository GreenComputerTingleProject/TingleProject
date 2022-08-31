package admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

public class AdminMusicModifyReg implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            String msg = "수정되었습니다";
            String path = request.getRealPath("/mp3/");
            String musicFile_check = ".*[.](mp3)";
            String imgFile_check = ".*[.](jpeg|jpg|bmp|png|gif|pdf)";
            int genreNo = 0;
            AdminDAO dao = new AdminDAO();
            int size = 1024 * 1024 * 10;

            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());

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

            int nowPage = Integer.parseInt(mr.getParameter("nowPage"));
            boolean check1 = dao.fileExtension_Check(musicFile_check,mr.getFilesystemName("file_path"));
            boolean check2 = dao.fileExtension_Check(imgFile_check,mr.getFilesystemName("cover_img"));
            String serchName = mr.getParameter("serchName");
            System.out.println("serchName = "+serchName);
            System.out.println("nowpage = "+nowPage);

            if(check1 && check2){
                MusicDTO musicData = new MusicDTO();

                musicData.setId(Integer.parseInt(mr.getParameter("id")));
                musicData.setTitle(mr.getParameter("title"));
                musicData.setArtist(mr.getParameter("artist"));
                musicData.setArtist_no(Integer.parseInt(mr.getParameter("artist_no")));
                musicData.setAlbum(mr.getParameter("album"));
                musicData.setGenre(mr.getParameter("genre"));
                musicData.setGenre_no(genreNo);
                if(mr.getFilesystemName("file_path")!= null){
                    musicData.setFile_path(mr.getFilesystemName("file_path"));
                } else if(mr.getFilesystemName("file_path")==null) {
                        musicData.setFile_path(null);
                } else {
                    musicData.setFile_path(mr.getParameter("filecheck1"));
                }
                if(mr.getFilesystemName("cover_img")!= null) {
                    musicData.setCover_img(mr.getFilesystemName("cover_img"));
                    dao.findImgFile(request, mr.getFilesystemName("cover_img"));
                } else if(mr.getFilesystemName("cover_img")==null){
                    musicData.setCover_img(null);
                } else {
                    musicData.setCover_img(mr.getParameter("filecheck2"));
                }
                musicData.setLyrics(mr.getParameter("lyrics"));


                dao.musicModify(musicData);

                int id = musicData.getId();

                if(mr.getFilesystemName("file_path")!= null && mr.getFilesystemName("file_path") != mr.getParameter("filecheck1")){
                    System.out.println("음악파일경로 = " + path + mr.getParameter("filecheck1"));
                    Path overlapfile = Paths.get(path + mr.getParameter("filecheck1"));
                    Files.delete(overlapfile);
                    System.out.println("실행1");
                }

                if(mr.getFilesystemName("cover_img")!= null && mr.getFilesystemName("cover_img") != mr.getParameter("filecheck2")){
                    path = request.getRealPath("/img/");
                    System.out.println("이미지파일경로 = " + path + mr.getParameter("filecheck2"));
                    Path overlapfile = Paths.get(path + mr.getParameter("filecheck2"));
                    Files.delete(overlapfile);
                    System.out.println("실행2");
                }


                request.setAttribute("msg",msg);
                request.setAttribute("adminUrl","alert.jsp");
                request.setAttribute("goUrl","AdminMusicDetail?id="+id+"&nowPage="+nowPage+"&serchName="+serchName);
            } else {
                msg = "파일형식이 잘못되었습니다";
                request.setAttribute("msg",msg);
                request.setAttribute("adminUrl","alert.jsp");
                request.setAttribute("goUrl","AdminMusicModify?id="+mr.getParameter("id")+"&serchName="+serchName);
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}

