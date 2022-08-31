package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMusicModify implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminMusicModify execute() 실행");
        String id = request.getParameter("id");
        String serchName = request.getParameter("serchName");
        MusicDTO musicData = new AdminDAO().musicDetail(id);

        System.out.println(musicData);

        request.setAttribute("serchName", serchName);
        request.setAttribute("musicData", musicData);
        request.setAttribute("adminUrl", "menu/music/musicModifyForm.jsp");
    }
}
