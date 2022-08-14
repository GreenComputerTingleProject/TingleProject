package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminCalculate implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        System.out.println("AdminPage execute() 실행");

        request.setAttribute("adminUrl", "menu/calculate.jsp");
    }
}
