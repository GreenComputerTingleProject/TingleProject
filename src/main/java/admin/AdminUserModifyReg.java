package admin;

import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "수정되었습니다";
        System.out.println(request.getParameter("membership"));
        UserDTO userData = new UserDTO();

        userData.setId(Integer.parseInt(request.getParameter("id")));
        userData.setLogin_id(request.getParameter("login_id"));
        userData.setLogin_pw(request.getParameter("login_pw"));
        userData.setName(request.getParameter("name"));
        userData.setNickname(request.getParameter("nickname"));
        userData.setPhone_number(request.getParameter("phone_number"));
        userData.setEmail_address(request.getParameter("email.address"));
        userData.setProfile_image(request.getParameter("profile_image"));
        userData.setJoin_type(Integer.parseInt(request.getParameter("join_type")));
       userData.setMembership(Integer.parseInt(request.getParameter("membership")));

        userData.setPersonal_type(request.getParameter("personal_type"));


        new AdminDAO().userModify(userData);

        int id = userData.getId();

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminUserDetail?id="+id);


    }
}
