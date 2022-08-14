
package user;

import model.UserDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

public class UserPhoneCertification implements UserService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            String num = request.getParameter("phone_number");
            System.out.println(num);
            String checknum = new UserDAO().join_phone_outh(num);

            JSONObject jo = new JSONObject();
            jo.put("checknum", checknum);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jo);
            response.getWriter().flush();


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
