package User;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignup implements UserService {


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("UserSignup execute");

        int size = 1024* 1024 * 10;

        String path = request.getRealPath("/imgs");


        try {
            MultipartRequest mr = new MultipartRequest(
              request,
              path,
              size,
              "UTF-8",
              new DefaultFileRenamePolicy());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    /*    UserDTO dto = new UserDTO();

        dto.setId(mr.getParmeter("id"));
        dto.setId(mr.getParmeter("pw"));
        dto.setId(mr.getParmeter("nickname"));

        new UserDAO().signup(dto);
        */





    }
}
