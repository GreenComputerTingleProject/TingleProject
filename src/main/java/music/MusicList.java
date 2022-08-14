package music;

import model.MusicDAO;
import model.MusicDTO;
import model.UserDAO;
import model.UserDTO;
import user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MusicList implements MusicService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        UserDTO userData = (UserDTO) request.getSession().getAttribute("userData");

        ArrayList<MusicDTO> musicList = new MusicDAO().music_list(userData);

        request.setAttribute("musicList", musicList);
        request.setAttribute("mainUrl", "Music/musicList.jsp");
    }
}
