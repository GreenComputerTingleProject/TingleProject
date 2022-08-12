/*
package user;

import model.UserDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserPhoneCertification implements UserService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
        String num = request.getParameter("phone_number");

        String checknum = new UserDAO().join_phone_outh(num);

        JSONObject jo = new JSONObject();
        jo.put("checknum", checknum);

        String data = jo.toJSONString();

        response.getWriter().append(data);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
*/
