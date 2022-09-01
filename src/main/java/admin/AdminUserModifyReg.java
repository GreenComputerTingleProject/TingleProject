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
        AdminDAO dao = new AdminDAO();
        String imgFile_check = ".*[.](jpeg|jpg|bmp|png|gif|pdf)";


            String path = request.getRealPath("/img/");
        int size = 1024 * 1024 * 10;




        MultipartRequest mr = null;

            mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());



            int nowPage = Integer.parseInt(mr.getParameter("nowPage"));
            String serchName = mr.getParameter("serchName");
            boolean check = dao.fileExtension_Check(imgFile_check,mr.getFilesystemName("profile_image"));

            if(check){
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
                } else if (mr.getFilesystemName("profile_image")==null && mr.getParameter("filecheck").equals("")){
                    userData.setProfile_image(null);
                }  else {
                    userData.setProfile_image(mr.getParameter("filecheck"));
                }
                userData.setMembership(Integer.parseInt(mr.getParameter("membership")));
                userData.setPersonal_type(mr.getParameter("personal_type"));

                if(mr.getFilesystemName("profile_image")!= null
                        && !mr.getParameter("filecheck").equals("")
                        && mr.getFilesystemName("profile_image") != mr.getParameter("filecheck")
                        && !mr.getParameter("filecheck").equals("exfire_member.png")){
                    Path overlapfile = Paths.get(path + mr.getParameter("filecheck"));
                    Files.delete(overlapfile);
                }

                dao.userModify(userData);

                int id = userData.getId();

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminUserDetail?id="+id+"&nowPage="+nowPage+"&serchName="+serchName);
            } else {
                msg = "파일형식이 잘못되었습니다";
                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminUserDetail?id="+ mr.getParameter("id")+"&nowPage="+nowPage+"&serchName="+serchName);
            }


        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
