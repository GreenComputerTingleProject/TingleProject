package admin;

import model.AdminDAO;
import model.AdminDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginReg implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String msg = "로그인 성공";
        String adminUrl = "menu/page.jsp";
        boolean logincheck = true;

        String login_id = request.getParameter("login_id");
        String login_pw = request.getParameter("login_pw");

        AdminDTO dto = new AdminDTO();
        dto.setLogin_id(login_id);
        dto.setLogin_pw(login_pw);
        System.out.println(dto);

        AdminDTO dto2 = new AdminDAO().login(dto);

        if(dto2.getLogin_id() == null && dto2.getLogin_pw() == null){
            msg = "로그인 실패";
            adminUrl = "menu/login.jsp";
            logincheck = false;
        }

        request.getSession().setAttribute("logincheck", logincheck);

        System.out.println(dto2);
        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", adminUrl);
        request.setAttribute("admindto" , dto2);




    }
}
