package user;


import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class UserSignupReg implements UserService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String msg = "회원가입 성공";
        String login_id = request.getParameter("login_id");
        String pw = request.getParameter("login_pw");
        String name = request.getParameter("name");
        String nickName = request.getParameter("nickName");
        String phone_number = request.getParameter("tel");

        UserDTO dto = new UserDTO();

        dto.setLogin_id(login_id);
        dto.setLogin_pw(pw);
        dto.setName(name);
        dto.setNickname(nickName);
        dto.setPhone_number(phone_number);

        new UserDAO().join(dto);

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", "UserLogIn");
        request.setAttribute("msg", msg);
    }
}
