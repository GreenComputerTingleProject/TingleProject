package music;

import model.MusicDAO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MusicSuggestion implements MusicService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<ArrayList<MusicDTO>> suggestionList = new MusicDAO().suggestionList();

        JSONArray jArray = new JSONArray();
        JSONArray jArrayToday = new JSONArray();
        JSONArray jArrayFunny = new JSONArray();

        for (MusicDTO dto :suggestionList.get(0)) {
            JSONObject jObject = new JSONObject();
            jObject.put("kind", "TODAY");
            jObject.put("id", dto.getId());
            jObject.put("title", dto.getTitle());
            jObject.put("artist", dto.getArtist());
            jObject.put("album", dto.getAlbum());
            jObject.put("genre", dto.getGenre());
            jObject.put("mood", dto.getMood());
            jObject.put("file_path", dto.getFile_path());
            jObject.put("cover_img", dto.getCover_img());
            jObject.put("cnt", dto.getCnt());
            jObject.put("lyrics", dto.getLyrics());
            jObject.put("release_date", dto.getRelease_dateStr());

            jArrayToday.add(jObject);
        }

        for (MusicDTO dto :suggestionList.get(1)) {
            JSONObject jObject = new JSONObject();
            jObject.put("kind", "FUNNY");
            jObject.put("id", dto.getId());
            jObject.put("title", dto.getTitle());
            jObject.put("artist", dto.getArtist());
            jObject.put("album", dto.getAlbum());
            jObject.put("genre", dto.getGenre());
            jObject.put("mood", dto.getMood());
            jObject.put("file_path", dto.getFile_path());
            jObject.put("cover_img", dto.getCover_img());
            jObject.put("cnt", dto.getCnt());
            jObject.put("lyrics", dto.                                                                                                                                                          getLyrics());
            jObject.put("release_date", dto.getRelease_dateStr());

            jArrayFunny.add(jObject);
        }

            jArray.add(jArrayToday);
            jArray.add(jArrayFunny);
            request.getSession().setAttribute("suggestionList", jArray);
    }
}
