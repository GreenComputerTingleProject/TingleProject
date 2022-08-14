package chart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChartController", value = "/chart/*")
public class ChartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String service = request.getRequestURI().substring((request.getContextPath() + "/chart/").length());

        try {
            ChartService cs = (ChartService) Class.forName("chart." + service).newInstance();
            cs.execute(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
