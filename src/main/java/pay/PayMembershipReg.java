package pay;

import model.PayDAO;
import model.PayDTO;
import model.UserDAO;
import model.UserDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayMembershipReg implements PayService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject userData = (JSONObject) request.getSession().getAttribute("userData");
        Integer user_id = (Integer) userData.get("id");
        String login_id = (String) userData.get("login_id");
        String login_pw = (String) userData.get("login_pw");

        String imp_uid = request.getParameter("imp_uid");
        Integer paid_amount = Integer.valueOf(request.getParameter("paid_amount"));

        String msg = request.getParameter("msg");

        PayDTO dto = new PayDTO();
        dto.setUser_id(user_id);
        dto.setImp_uid(imp_uid);
        dto.setPaid_amount(paid_amount);

        UserDTO u_dto = new UserDTO();
        u_dto.setLogin_id(login_id);
        u_dto.setLogin_pw(login_pw);

        new PayDAO().pay_add(dto);
        new UserDAO().upgrade_membership(user_id);
        UserDTO newUserData = new UserDAO().login(u_dto);

        JSONObject jObject = new JSONObject();

        jObject.put("id", newUserData.getId());
        jObject.put("join_type", newUserData.getJoin_type());
        jObject.put("membership", newUserData.getMembership());
        jObject.put("login_id", newUserData.getLogin_id());
        jObject.put("login_pw", newUserData.getLogin_pw());
        jObject.put("name", newUserData.getName());
        jObject.put("nickname", newUserData.getNickname());
        jObject.put("phone_number", newUserData.getPhone_number());
        jObject.put("email_address", newUserData.getEmail_address());
        jObject.put("profile_image", newUserData.getProfile_image());
        jObject.put("personal_type", newUserData.getPersonal_type());
        jObject.put("join_date", newUserData.getJoin_dateStr());

        request.getSession().setAttribute("userData", jObject);

        request.setAttribute("mainUrl", "/view/alert.jsp");
        request.setAttribute("goUrl", request.getContextPath());
        request.setAttribute("msg", msg);
    }
}
