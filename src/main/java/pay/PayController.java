
package pay;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "PayController", value = "/pay/*")
public class PayController extends HttpServlet {

    HashMap <String, String> nonService = new HashMap<String, String>();

    public PayController() {
        nonService.put("PayMembership","/view/pay/membership_V2.jsp");
        nonService.put("PayMembershipCancel","/view/pay/membership_cancel.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getRequestURI().substring((request.getContextPath() + "/pay/").length());

        try {
            if(nonService.containsKey(service)){
                request.setAttribute("mainUrl", nonService.get(service));
            } else {
                PayService ps = (PayService)Class.forName("pay."+ service).newInstance();
                ps.execute(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher((String) request.getAttribute("mainUrl"));
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

