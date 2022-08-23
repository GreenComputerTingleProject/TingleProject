package chart;

import model.MusicDAO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class ChartRock implements ChartService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


            System.out.println("chart 실행");

            ArrayList<MusicDTO> genreList = new MusicDAO().genreList(2);
            System.out.println("chart 실행"+genreList);
            JSONArray jsonArray = new JSONArray();

        try {



            for (MusicDTO ch: genreList) {
                JSONObject data = new JSONObject();
                data.put("id", ch.getId());
                data.put("cnt", ch.getCnt());
                data.put("title", ch.getTitle());
                data.put("album", ch.getAlbum());
                data.put("artist", ch.getArtist());
                data.put("cover_img", ch.getCover_img());
                data.put("genre", ch.getGenre());
                data.put("genre_no", ch.getGenre());
                data.put("file_path", ch.getFile_path());


                jsonArray.add(data);
                System.out.println(data);
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jsonArray);
            response.getWriter().flush();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
