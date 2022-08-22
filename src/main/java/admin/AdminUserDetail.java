package admin;

import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserDetail implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String id = (String)request.getParameter("id");

        UserDTO userData = new AdminDAO().userDetail(id);

        request.setAttribute("userData", userData);
        request.setAttribute("adminUrl", "menu/user/userDetail.jsp");
    }
}
