package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class AdminMusicModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "수정되었습니다";
        MusicDTO musicData = new MusicDTO();

        musicData.setId(Integer.parseInt(request.getParameter("id")));
        musicData.setTitle(request.getParameter("title"));
        musicData.setArtist(request.getParameter("artist"));
        musicData.setAlbum(request.getParameter("album"));
        musicData.setGenre(request.getParameter("genre"));
        musicData.setMood(request.getParameter("mood"));
        musicData.setFile_path(request.getParameter("file_path"));
        musicData.setCover_img(request.getParameter("cover_img"));
        musicData.setLyrics(request.getParameter("lyrics"));


        new AdminDAO().musicModify(musicData);

        int id = musicData.getId();

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "menu/music/alert.jsp");
        request.setAttribute("goUrl", "AdminMusicDetail?id="+id);


    }
}
