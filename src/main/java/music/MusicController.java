package music;

import user.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "MusicController", value = "/music/*")
public class MusicController extends HttpServlet {

    HashMap <String, String> nonService = new HashMap<String, String>();

    public MusicController() {
//        nonService.put("UserSignup","Login/signUpForm.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getRequestURI().substring((request.getContextPath() + "/music/").length());

        try {
            if(nonService.containsKey(service)){
                request.setAttribute("mainUrl", nonService.get(service));
            } else {
                MusicService ms = (MusicService)Class.forName("music."+ service).newInstance();
                ms.execute(request, response);
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

