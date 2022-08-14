package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMusicInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminMusicInsertReg execute실행");

        String msg = "음원등록이 완료되었습니다";

        MusicDTO musicData = new MusicDTO();
        musicData.setTitle(request.getParameter("title"));
        musicData.setArtist(request.getParameter("artist"));
        musicData.setAlbum(request.getParameter("album"));
        musicData.setGenre(request.getParameter("genre"));
        musicData.setMood(request.getParameter("mood"));
        musicData.setFile_path(request.getParameter("file_path"));
        musicData.setCover_img(request.getParameter("cover_img"));
        musicData.setLyrics(request.getParameter("lyrics"));

        new AdminDAO().musicInsert(musicData);

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "menu/music/alert.jsp");
      //  request.setAttribute("adminUrl", "menu/music/musicList.jsp");
        request.setAttribute("goUrl", "AdminMusicList");
    }
}
