package user;

import model.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserPwReset implements UserService{



    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "비밀번호 변경 실패";

        String login_id = request.getParameter("login_id");
        String login_pw = request.getParameter("login_pw");
        boolean check = Boolean.parseBoolean(request.getParameter("check"));

        if(check){
            new UserDAO().reset_pw(login_pw, login_id);
        } else {
            msg = "비밀번호 변경 성공";
        }

        request.setAttribute("msg", msg);

    }
}
