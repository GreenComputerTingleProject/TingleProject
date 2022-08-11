package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIdFind implements UserService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        UserDTO dto = new UserDTO();

        dto.setLogin_id(request.getParameter("id"));
        dto.setPhone_number(request.getParameter("phone_number"));

        UserDTO dtoIdchk = new UserDAO(dto).idchk();






    }
}
