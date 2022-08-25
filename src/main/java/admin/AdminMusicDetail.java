package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMusicDetail implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        MusicDTO musicData = new AdminDAO().musicDetail(id);

        request.setAttribute("musicData", musicData);
        request.setAttribute("adminUrl", "menu/music/musicDetail.jsp");
    }
}
