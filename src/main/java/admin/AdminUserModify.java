package admin;

import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserModify implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminUserModify execute() 실행");
        String id = request.getParameter("id");
        UserDTO userData = new AdminDAO().userDetail(id);

        System.out.println(userData);

        request.setAttribute("userData", userData);
        request.setAttribute("adminUrl", "menu/user/userModifyForm.jsp");
    }
}
