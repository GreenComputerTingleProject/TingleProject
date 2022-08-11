package User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

public class UserSignupIdCheck implements UserService {

    boolean check = true;

    // 영문으로 시작하며 _제외한 특수문자 불가
    // 영문, 숫자, '_'으로만 이루어진 5~12자 이하 형식
    String regex = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$";
    String msg = "사용 가능한 아이디 입니다";
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        if(!Pattern.matches(regex, id)){
            msg = "아이디 형식이 다릅니다";
            check = false;
        }

        /* if (!userid.equals(new UserDAO().아이디조회메소드()) {
            msg = "중복된 아이디입니다";
            check = false;
        } */


        request.setAttribute("check", check);
        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", "alert.jsp");
        request.setAttribute("goUrl", "signup.jsp");
    }
}
