package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserTest implements UserService {
    // User 서비스를 테스트하기위한 더미 서비스입니다.
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String test = new UserDAO().find_pw("test", "ocy", "0103333");
        System.out.println(test);
    }
}
