package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginCheckReg implements UserService {



    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        boolean check = true;
        String msg = "로그인 되었습니다";

         UserDTO dto = new UserDTO();
         dto.setLogin_id((String)request.getAttribute("login_id"));
         dto.setLogin_pw((String)request.getAttribute("login_pw"));
       // dto.setLogin_id("test");
       // dto.setLogin_pw("123");

        UserDTO userdata = new UserDAO().login(dto);

         if(userdata.getLogin_id() == null || userdata.getLogin_pw() == null ){
             msg = "로그인 실패";
             check = false;
         } else {
             HttpSession session = null;
             session.setAttribute("userdata", userdata);

         }

        /*
        로그인 체크

         1 입력받은 id를 데이터베이스에 있는 id들과 비교
          1_1 데이터베이스에 동일한 아이디가 있을시 통과
          1_2 데이터베이스에 동일한 아이디가 없을시 check = false, msg = 아이디가 잘못되었습니다

         2 입력받은 pw를 데이터베이스 id란에 있는 pw와 비교
          2_1 비밀번호가 동일하다면 통과
          2_2 비밀번호가 다를시 check = false, msg = 비밀번호가 잘못되었습니다
        */

       // System.out.println(check);

        request.setAttribute("mainUrl", "alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("check", check);


    }
}