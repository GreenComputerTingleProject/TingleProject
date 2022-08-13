
package admin;

import user.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "AdminController", value = "/admin/*")
public class AdminController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getContextPath());
        String service = request.getRequestURI().substring((request.getContextPath() + "/admin/").length());
        System.out.println(service);
        try {

                AdminService as = (AdminService)Class.forName("admin."+ service).newInstance();
               as.execute(request, response);


            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/template.jsp");
            dispatcher.forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

