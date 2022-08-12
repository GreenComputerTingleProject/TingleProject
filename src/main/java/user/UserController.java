
package user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "UserController", value = "/user/*")
public class UserController extends HttpServlet {

    HashMap <String, String> nonService = new HashMap<String, String>();

    UserController () {
        nonService.put("UserSignup","Login/signUpForm.jsp");
        nonService.put("UserIdFind","Login/idFindFrom.jsp");
        nonService.put("UserPwReset","Login/pwFindFrom.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getRequestURI().substring((request.getContextPath() + "/user/").length());

        try {
            if(nonService.containsKey(service)){
                request.setAttribute("mainUrl", nonService.get(service));
            } else {
                UserService us = (UserService)Class.forName("user."+ service).newInstance();
                us.execute(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/template.jsp");
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

