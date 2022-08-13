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

        System.out.println("MusicList 접근 성공!");

        UserDTO dto = new UserDTO();
        dto.setId(1);

        ArrayList<MusicDTO> musicList = new MusicDAO().music_list(dto);

        request.setAttribute("musicList", musicList);
        request.setAttribute("mainUrl", "Music/musicList.jsp");
    }
}
