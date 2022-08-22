package admin;

import model.AdminDAO;
import model.MusicDTO;
import model.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUnameSerch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String uname = request.getParameter("uname");
        System.out.println("검색어는 :" + uname);
        ArrayList<UserDTO> userData = new AdminDAO().uNameSerch(uname);

        request.setAttribute("userData", userData);
        request.setAttribute("adminUrl", "menu/user/userList.jsp");
    }
}
