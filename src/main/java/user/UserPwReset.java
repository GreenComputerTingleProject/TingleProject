package user;

import model.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserPwReset implements UserService{

    boolean checknum = false;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String login_id = request.getParameter("login_id");
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");

        String num = new UserDAO().join_phone_outh(phone_number);


        System.out.println(num);


        request.setAttribute("checknum", checknum);
    }
}
