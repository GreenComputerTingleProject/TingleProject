package admin;

import model.AdminDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMusicDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminMusicDelete execute실행");

        String msg = "삭제되었습니다";

        int id = Integer.parseInt(request.getParameter("id"));

        new AdminDAO().musicDelete(id);

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "menu/music/alert.jsp");
        request.setAttribute("goUrl", "AdminMusicList");

    }
}
