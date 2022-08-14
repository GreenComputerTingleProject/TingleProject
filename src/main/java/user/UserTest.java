package user;

import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserTest implements UserService {
    // User 서비스를 테스트하기위한 더미 서비스입니다.
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int res = new UserDAO().reset_pw("1111", "test");
        System.out.println(res);
    }
}
