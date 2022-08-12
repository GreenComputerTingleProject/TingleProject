package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIdFind implements UserService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");

        String login_id =  new UserDAO().find_id(name, phone_number);

        if(login_id.equals(null)){
            String msg = "아이디를 찾을 수 없습니다";
        } else {
            request.setAttribute("login_id", login_id);
        }







    }
}
