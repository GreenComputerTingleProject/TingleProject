package music;

import model.MusicDAO;
import model.MusicDTO;
import model.UserDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MusicAddLibrary implements MusicService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject userData = (JSONObject) request.getSession().getAttribute("userData");
        Integer user_id = (Integer) userData.get("id");
        String[] music_idList = request.getParameterValues("music_id");

        for (String music_id : music_idList) {
            new MusicDAO().library_add(user_id, Integer.parseInt(music_id));
        }
    }
}
