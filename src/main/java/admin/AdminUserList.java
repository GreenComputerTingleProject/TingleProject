package admin;

import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUserList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminUserList execute() 실행");
        ArrayList<UserDTO> userData = new AdminDAO().userList();


        request.setAttribute("userData", userData);
        request.setAttribute("adminUrl", "menu/user/userList.jsp");
    }
}
