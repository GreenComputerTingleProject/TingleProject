package admin;

import model.BoardDAO;
import model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeModifyReg implements AdminService{


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "수정이 완료되었습니다";


        BoardDTO dto = new BoardDTO();
        dto.setId(Integer.parseInt( request.getParameter("id")));
        dto.setTitle(request.getParameter("title"));
        dto.setKind(request.getParameter("kind"));
        dto.setContent(request.getParameter("content"));

        new BoardDAO().noticeModify(dto);


        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminCenter?noticeKind=noticeList");

    }
}
