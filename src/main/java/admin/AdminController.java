
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

    HashMap<String, String> nonService = new HashMap<String, String>();
    String serchName;

    public AdminController() {
        nonService.put("AdminMusicInsert", "menu/music/musicInsertForm.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nowPage = 1;
        String serchName = "";


        if(request.getParameter("nowPage")!=null) {
            System.out.println("나우페이지는 :"+request.getParameter("nowPage"));
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        if(request.getParameter("serchName") != ("")){
            serchName = request.getParameter("serchName");
        }

        request.setAttribute("nowPage", nowPage);
        request.setAttribute("serchName", serchName);

        String service = request.getRequestURI().substring((request.getContextPath() + "/admin/").length());

        try {

            if(nonService.containsKey(service)){
                request.setAttribute("adminUrl", nonService.get(service));
                System.out.println(nonService.get(service));
            } else {
                AdminService as = (AdminService)Class.forName("admin."+ service).newInstance();
                as.execute(request, response);
            }

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

