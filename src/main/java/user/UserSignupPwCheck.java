package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

public class UserSignupPwCheck implements UserService {

    boolean check = true;

    // 영문, 특수문자, 숫자 포함 8자 이상
    String regex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$";

    String msg = "비밀번호를 확인했습니다";
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String pw = request.getParameter("pw");
        String pwconfirm = request.getParameter("pwconfirm");

        if(!Pattern.matches(regex, pw)){
            msg = "비밀번호 형식이 다릅니다";
            check = false;
        }

        if(!pw.equals(pwconfirm)){
           msg = "비밀번호가 다릅니다";
           check = false;
       }


        request.setAttribute("check", check);
        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", "alert.jsp");
        request.setAttribute("goUrl", "signup.jsp");
    }
}
