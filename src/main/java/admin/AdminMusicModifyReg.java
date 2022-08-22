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
            String path = "C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\mp3";
            AdminDAO dao = new AdminDAO();
            int size = 1024 * 1024 * 10;

            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());

            System.out.println(mr.getParameter("filecheck1"));
            System.out.println(mr.getParameter("filecheck2"));

            MusicDTO musicData = new MusicDTO();

            musicData.setId(Integer.parseInt(mr.getParameter("id")));
            musicData.setTitle(mr.getParameter("title"));
            musicData.setArtist(mr.getParameter("artist"));
            musicData.setAlbum(mr.getParameter("album"));
            musicData.setGenre(mr.getParameter("genre"));
            musicData.setMood(mr.getParameter("mood"));
            if(mr.getFilesystemName("file_path")!= null){
                musicData.setFile_path(mr.getFilesystemName("file_path"));
            } else {
                musicData.setFile_path(mr.getParameter("filecheck1"));
            }
            if(mr.getFilesystemName("cover_img")!= null){
                musicData.setCover_img(mr.getFilesystemName("cover_img"));
                dao.findImgFile(mr.getFilesystemName("cover_img"));
            } else {
                musicData.setCover_img(mr.getParameter("filecheck2"));
            }
            musicData.setLyrics(mr.getParameter("lyrics"));


            dao.musicModify(musicData);

            int id = musicData.getId();


            if(mr.getFilesystemName("file_path")!= null && mr.getFilesystemName("file_path") != mr.getParameter("filecheck1")){
                Path overlapfile = Paths.get("C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\mp3\\"+mr.getParameter("filecheck1"));
                Files.delete(overlapfile);
                System.out.println("실행1");
            }

            if(mr.getFilesystemName("cover_img")!= null && mr.getFilesystemName("cover_img") != mr.getParameter("filecheck2")){
                Path overlapfile = Paths.get("C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\img\\"+mr.getParameter("filecheck2"));
                Files.delete(overlapfile);
                System.out.println("실행2");
            }


        request.setAttribute("msg",msg);
        request.setAttribute("adminUrl","menu/music/alert.jsp");
        request.setAttribute("goUrl","AdminMusicDetail?id="+id);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}

