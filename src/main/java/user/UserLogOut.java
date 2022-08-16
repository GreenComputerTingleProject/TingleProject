package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLogOut implements UserService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.getSession().invalidate();

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", request.getContextPath());
        request.setAttribute("msg", "로그아웃 되었습니다");
    }
}
