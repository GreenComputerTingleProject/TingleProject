package user;

import model.UserDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.regex.Pattern;

public class UserSignupIdCheck extends HttpServlet implements UserService {


    boolean check = true;
    String msg = "사용 가능한 아이디 입니다";
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String login_id = request.getParameter("login_id");

        int check_validation = new UserDAO().join_validation(login_id);

        if(check_validation > 0){
            msg = "중복된 아이디입니다";
            check = false;
        }

        try {
        JSONObject jo = new JSONObject();
            jo.put("check", check);
            jo.put("msg", URLEncoder.encode(msg, "UTF-8"));

        String data = jo.toJSONString();
        System.out.println(data);

        response.getWriter().append(data);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }



    }
}
