package chart;

import model.MusicDAO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class PlayCount implements ChartService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));

        MusicDAO dao = new MusicDAO();
        dao.addCnt(id);


    }
}
