package chart;

import model.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class ChartTop100 implements ChartService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        System.out.println("chart 실행");
        ArrayList<MusicDTO> chartList = new MusicDAO().chartList();


        JSONArray jsonArray = new JSONArray();


        try {

            for (MusicDTO ch: chartList) {
                JSONObject data = new JSONObject();
                data.put("id", ch.getId());
                data.put("cnt", ch.getCnt());
                data.put("title", ch.getTitle());
                data.put("album", ch.getAlbum());
                data.put("artist", ch.getArtist());
                data.put("cover_img", ch.getCover_img());
                data.put("file_path", ch.getFile_path());
                data.put("lyrics", ch.getLyrics());


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
