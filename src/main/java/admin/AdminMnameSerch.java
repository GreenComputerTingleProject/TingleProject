package admin;

import model.AdminDAO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminMnameSerch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String mname = request.getParameter("mname");
        ArrayList<MusicDTO> musicData = new AdminDAO().mNameSerch(mname);

        for (MusicDTO dto : musicData) {
            System.out.println(dto);
        }
    }
}
