package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminMusicList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int nowPage = (int)request.getAttribute("nowPage");
        String serchName = (String)request.getAttribute("serchName");
        System.out.println(nowPage);
        int limit = 5, pageLimit = 4;

        int first = (nowPage-1)*limit;
        String db = "music";
        int total = new AdminDAO().total(db);
        int totalPage = total/limit;

        if(total%limit!=0) {
            totalPage++;
        }

        int firstPage = (nowPage-1)/pageLimit * pageLimit + 1;
        int endPage = firstPage + pageLimit -1;

        if(endPage > totalPage) {
            endPage = totalPage;
        }


        System.out.println("AdminMusic execute() 실행");
        ArrayList<MusicDTO> musicData = new AdminDAO().musicList(first, limit);


        request.setAttribute("first", first);
        request.setAttribute("firstPage", firstPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("totalPage", totalPage);

        request.setAttribute("musicData", musicData);
        request.setAttribute("adminUrl", "menu/music/musicList.jsp");
    }
}
