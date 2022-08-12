package user;


import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignupReg implements UserService {

    String msg = "회원가입 성공";



    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        boolean check1 = Boolean.parseBoolean(request.getParameter("check1"));
        boolean check2 = Boolean.parseBoolean(request.getParameter("check2"));
        String login_id = request.getParameter("login_id");
        String pw = request.getParameter("login_pw");
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");

        if(check1 && check2 ) {
            UserDTO dto = new UserDTO();

            dto.setLogin_id(login_id);
            dto.setLogin_pw(pw);
            dto.setName(name);
            dto.setPhone_number(phone_number);

        /*    dto.setLogin_id("ohjs0293");
            dto.setLogin_pw("123456");
            dto.setNickname("오현석");
            dto.setJoin_type(1);

         */

            new UserDAO().join(dto);

            request.setAttribute("msg", msg);
            request.setAttribute("mainUrl", "alert.jsp");
            request.setAttribute("goUrl", "signup.jsp");
        } else  {
            msg = "회원가입 실패";

        }

    //    request.setAttribute("check", check);
        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", "alert.jsp");
        request.setAttribute("goUrl", "login.jsp");

    }
}
