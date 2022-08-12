package user;


import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignupReg implements UserService {




    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("mainUrl", "Login/signUpForm.jsp");
    }
}
