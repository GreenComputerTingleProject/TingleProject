package admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminMusicInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminMusicInsertReg execute실행");

        String msg = "음원등록이 완료되었습니다";
        String path = "C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\mp3";

        AdminDAO dao = new AdminDAO();

        int size = 1024*1024*10;

        try {
            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());

        MusicDTO musicData = new MusicDTO();
        musicData.setTitle(mr.getParameter("title"));
        musicData.setArtist(mr.getParameter("artist"));
        musicData.setAlbum(mr.getParameter("album"));
        musicData.setGenre(mr.getParameter("genre"));
        musicData.setMood(mr.getParameter("mood"));
        musicData.setFile_path(mr.getFilesystemName("file_path"));
        musicData.setCover_img(mr.getFilesystemName("cover_img"));
        // 이미지파일은 img 폴더로 넣기
        dao.findImgFile(mr.getFilesystemName("cover_img"));
        musicData.setLyrics(mr.getParameter("lyrics"));

        dao.musicInsert(musicData);

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
      //  request.setAttribute("adminUrl", "menu/music/userList.jsp");
        request.setAttribute("goUrl", "AdminMusicList");

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
