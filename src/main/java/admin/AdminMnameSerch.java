package admin;

import model.AdminDAO;
import model.MusicDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

public class AdminMnameSerch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String mname = request.getParameter("mname");
        System.out.println("검색어는 :" + mname);
        ArrayList<MusicDTO> musicData = new AdminDAO().mNameSerch(mname);

        request.setAttribute("musicData", musicData);
        request.setAttribute("adminUrl", "menu/music/musicList.jsp");
    }
}
