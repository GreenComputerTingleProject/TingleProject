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

        String serchName = request.getParameter("serchName");
        System.out.println("검색어는 :" + serchName);
        int nowPage = (int)request.getAttribute("nowPage");
        System.out.println(nowPage);
        int limit = 5, pageLimit = 4;

        int first = (nowPage-1)*limit;

        int total = new AdminDAO().serchUTotal(serchName);
        int totalPage = total/limit;

        if(total%limit!=0) {
            totalPage++;
        }

        int firstPage = (nowPage-1)/pageLimit * pageLimit + 1;
        int endPage = firstPage + pageLimit -1;

        if(endPage > totalPage) {
            endPage = totalPage;
        }


        System.out.println("검색어는 :" + serchName);
        ArrayList<UserDTO> userData = new AdminDAO().uNameSerch(serchName, first, limit);

        request.setAttribute("first", first);
        request.setAttribute("firstPage", firstPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("totalPage", totalPage);

        request.setAttribute("userData", userData);
        request.setAttribute("adminUrl", "menu/user/userList.jsp");
    }
}
