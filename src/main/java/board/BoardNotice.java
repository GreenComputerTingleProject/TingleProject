package board;

import model.BoardDAO;
import model.BoardDTO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class BoardNotice implements BoardService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {

        ArrayList<BoardDTO> notice_data = new BoardDAO().board_info(1);
        int num = 1;

        JSONArray jsonArray = new JSONArray();

        for (BoardDTO dto: notice_data) {
            JSONObject data = new JSONObject();
            data.put("id", num);
            data.put("mode", dto.getMode());
            data.put("content", dto.getContent());
            data.put("title", dto.getTitle());
            data.put("kind", dto.getKind());
            data.put("nickname", dto.getNickname());
            data.put("reg_date", dto.getReg_dateStr());

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
