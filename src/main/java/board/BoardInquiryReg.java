package board;

import model.BoardDAO;
import model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInquiryReg implements BoardService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String login_id = request.getParameter("login_id");
        String nickname = request.getParameter("nickname");
        String kind = request.getParameter("kind");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String checked = request.getParameter("checked");

        BoardDTO dto = new BoardDTO();
        dto.setLogin_id(login_id);
        dto.setUser_id(user_id);
        dto.setContent(content);
        dto.setTitle(title);
        dto.setKind(kind);
        dto.setNickname(nickname);
        dto.setChecked(checked);

        new BoardDAO().inquriyInsert(dto);



    }
}
