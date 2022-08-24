package admin;

import model.AdminDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminUserDelete execute실행");



        int id = Integer.parseInt(request.getParameter("id"));

        String msg =  new AdminDAO().userDelete(request,id);

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminUserList");

    }
}
