package user;

import model.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class UserIdFindReg implements UserService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String msg = "아이디를 찾을 수 없습니다";

        String name = request.getParameter("name");
        String phone_number = request.getParameter("tel");

        String login_id = new UserDAO().find_id(name, phone_number);

        if (login_id != null) {
            request.setAttribute("login_id", login_id);
            msg = "당신의 ID는 " + login_id + " 입니다.";
        }

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", "UserLogIn");
        request.setAttribute("msg", msg);
    }
}
