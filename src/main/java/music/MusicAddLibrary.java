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
        String music_idList = request.getParameter("music_id");

        String[] mList = music_idList.split(",");

        for (String music_id : mList) {
//            System.out.println(music_id);
            new MusicDAO().library_add(user_id, Integer.parseInt(music_id));
        }
    }
}
