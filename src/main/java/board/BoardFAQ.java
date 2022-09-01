package board;

import model.BoardDAO;
import model.BoardDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class BoardFAQ implements BoardService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {

            ArrayList<BoardDTO> FAQ_data = new BoardDAO().board_info(2);
            int num = 1;

            JSONArray jsonArray = new JSONArray();

            for (BoardDTO dto: FAQ_data) {
                JSONObject data = new JSONObject();
                data.put("id", num);
                data.put("content", dto.getContent());
                data.put("title", dto.getTitle());
                data.put("kind", dto.getKind());
                data.put("nickname", dto.getNickname());

                jsonArray.add(data);
                num++;
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jsonArray);
            response.getWriter().flush();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
