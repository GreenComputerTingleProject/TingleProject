package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLogin implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        boolean logincheck = false;

        request.setAttribute("adminUrl", "menu/login.jsp");
        request.setAttribute("logincheck" , logincheck);

    }
}
