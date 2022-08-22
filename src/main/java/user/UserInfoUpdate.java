package user;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.UserDAO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserInfoUpdate implements UserService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "회원정보 변경 실패";
//        String path = request.getContextPath() + "/img/";
        String path = request.getRealPath("/img");

        int size = 1024 * 1024 * 10;

        try {
            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy()
            );

            UserDTO dto = new UserDTO();
            dto.setId(Integer.valueOf(mr.getParameter("id")));
            dto.setNickname(mr.getParameter("nickname"));
            dto.setPhone_number(mr.getParameter("phone"));
            dto.setEmail_address(mr.getParameter("email"));
            dto.setProfile_image(mr.getFilesystemName("image"));
            dto.setPersonal_type(mr.getParameter("personal_type"));

            int res = new UserDAO().update_info(dto);

            if(res != 0) {
                msg = "회원정보 변경 성공";
            }

            request.setAttribute("mainUrl", "/view/alert.jsp");
            request.setAttribute("goUrl", request.getContextPath());
            request.setAttribute("msg", msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
