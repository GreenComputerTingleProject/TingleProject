package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminMusicList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        System.out.println("AdminMusic execute() 실행");
        ArrayList<MusicDTO> musicData = new AdminDAO().musicList();


        request.setAttribute("musicData", musicData);
        request.setAttribute("adminUrl", "menu/music/musicList.jsp");
    }
}
