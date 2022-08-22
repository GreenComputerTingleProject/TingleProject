package user;

import model.UserDAO;
import model.UserDTO;
import music.MusicList_V2;
import music.MusicSuggestion;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginReg implements UserService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String goUrl = request.getContextPath();
        boolean check = true;
        String msg = "로그인 되었습니다";

        UserDTO dto = new UserDTO();
        dto.setLogin_id(request.getParameter("login_id"));
        dto.setLogin_pw(request.getParameter("login_pw"));

        UserDTO userData = new UserDAO().login(dto);

        System.out.println(userData);

        if(userData.getId() == null){
            goUrl = "UserLogIn";
            check = false;
            msg = "로그인 실패";
        } else {
            JSONObject jObject = new JSONObject();

            jObject.put("id", userData.getId());
            jObject.put("join_type", userData.getJoin_type());
            jObject.put("membership", userData.getMembership());
            jObject.put("login_id", userData.getLogin_id());
            jObject.put("login_pw", userData.getLogin_pw());
            jObject.put("name", userData.getName());
            jObject.put("nickname", userData.getNickname());
            jObject.put("phone_number", userData.getPhone_number());
            jObject.put("email_address", userData.getEmail_address());
            jObject.put("profile_image", userData.getProfile_image());
            jObject.put("personal_type", userData.getPersonal_type());
            jObject.put("join_date", userData.getJoin_dateStr());

            request.getSession().setAttribute("userData", jObject);
//            new MusicList_V2().execute(request, response);
            new MusicSuggestion().execute(request, response);
        }

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", goUrl);
        request.setAttribute("check", check);
        request.setAttribute("msg", msg);
    }
}
