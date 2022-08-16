package music;

import model.MusicDAO;
import model.MusicDTO;
import model.UserDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MusicList_V2 implements MusicService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject userData = (JSONObject) request.getSession().getAttribute("userData");

        ArrayList<MusicDTO> musicList = new MusicDAO().music_list((Integer) userData.get("id"));

        JSONArray jArray = new JSONArray();

        try {
            for (MusicDTO music : musicList) {
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
                jObject.put("release_date", music.getRelease_dateStr());

                jArray.add(jObject);
            }
            System.out.println(jArray);
            request.getSession().setAttribute("musicList", jArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
