package admin;

import model.AdminDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminSerchArtist implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {

            int artist_no = 0;

            String artist = request.getParameter("artist");
            System.out.println(artist);
         //    artist_no = new AdminDAO().max_artistNum();
             artist_no = new AdminDAO().serch_artist(artist);

        JSONObject jObject = new JSONObject();

        jObject.put("artist_no",artist_no);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(jObject);
        response.getWriter().flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
