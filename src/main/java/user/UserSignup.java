package user;


import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignup implements UserService {

    String msg = "회원가입 성공";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        boolean check = Boolean.parseBoolean(request.getParameter("check"));
        check = true;

        if(check) {
            UserDTO dto = new UserDTO();

            dto.setLogin_id(request.getParameter("id"));
            dto.setLogin_pw(request.getParameter("pw"));
        /*    dto.setNickname(request.getParameter("nickname"));*/

        /*    dto.setLogin_id("ohjs0293");
            dto.setLogin_pw("123456");
            dto.setNickname("오현석");
            dto.setJoin_type(1);

         */

            new UserDAO().join(dto);


        } else  {
            msg = "회원가입 실패";

        }

    //    request.setAttribute("check", check);
        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", "alert.jsp");
        request.setAttribute("goUrl", "Login/login.jsp");

    }
}
