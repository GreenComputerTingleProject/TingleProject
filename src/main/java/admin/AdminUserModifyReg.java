package admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class AdminUserModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
        String msg = "수정되었습니다";


      //  String path = "C:\\Users\\82108\\TingleProject\\src\\main\\webapp\\img\\";
            String path = request.getRealPath("/img/");
        int size = 1024 * 1024 * 10;

        MultipartRequest mr = null;

            mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());


        UserDTO userData = new UserDTO();

        userData.setId(Integer.parseInt(mr.getParameter("id")));
        userData.setLogin_id(mr.getParameter("login_id"));
        userData.setLogin_pw(mr.getParameter("login_pw"));
        userData.setName(mr.getParameter("name"));
        userData.setNickname(mr.getParameter("nickname"));
        userData.setPhone_number(mr.getParameter("phone_number"));
        userData.setEmail_address(mr.getParameter("email.address"));
        if(mr.getFilesystemName("profile_image")!= null){
            userData.setProfile_image(mr.getFilesystemName("profile_image"));
        } else {
            userData.setProfile_image(mr.getParameter("filecheck"));
        }
        userData.setJoin_type(Integer.parseInt(mr.getParameter("join_type")));
       userData.setMembership(Integer.parseInt(mr.getParameter("membership")));
        userData.setPersonal_type(mr.getParameter("personal_type"));

            if(mr.getFilesystemName("profile_image")!= null && mr.getFilesystemName("profile_image") != mr.getParameter("filecheck")){
                Path overlapfile = Paths.get(path + mr.getParameter("filecheck"));
                Files.delete(overlapfile);
            }

        new AdminDAO().userModify(userData);

        int id = userData.getId();

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminUserDetail?id="+id);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
