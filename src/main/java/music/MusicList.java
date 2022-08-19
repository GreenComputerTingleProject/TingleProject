package music;

import model.MusicDAO;
import model.MusicDTO;
import model.UserDAO;
import model.UserDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;

public class MusicList implements MusicService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        UserDTO userData = (UserDTO) request.getSession().getAttribute("userData");

        ArrayList<MusicDTO> musicList = new MusicDAO().music_list(userData);
        JSONArray jArray = new JSONArray();

        try {
            for (MusicDTO music: musicList) {
                JSONObject jObject = new JSONObject();

                jObject.put("id", music.getId());
                jObject.put("title", music.getTitle());
                jObject.put("artist", music.getArtist());
                jObject.put("album", music.getAlbum());
                jObject.put("genre", music.getGenre());
                jObject.put("mood", music.getMood());
                jObject.put("file_path", music.getFile_path());
                jObject.put("cover_img", music.getCover_img());
                jObject.put("cnt", music.getCnt());
                jObject.put("lyrics", music.getLyrics());
                jObject.put("release_date", music.getRelease_date());

                jArray.add(jObject);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jArray);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
