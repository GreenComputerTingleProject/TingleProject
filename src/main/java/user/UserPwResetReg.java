package user;

import model.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserPwResetReg implements UserService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "비밀번호 변경 실패";

        String login_id = request.getParameter("login_id");
        String login_pw = request.getParameter("login_pw");

        int res = new UserDAO().reset_pw(login_pw, login_id);

        if(res != 0) {
            msg = "비밀번호가 변경되었습니다.";
        }

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", "UserLogIn");
        request.setAttribute("msg", msg);
    }
}
