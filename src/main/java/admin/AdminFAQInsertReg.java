package admin;

import model.BoardDAO;
import model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminFAQInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminFAQInsertReg execute실행");

        String msg = "FAQ 등록이 완료되었습니다";
        String nickname = "팅글마스터";
        int mode = 2;

        BoardDTO dto = new BoardDTO();

        dto.setTitle(request.getParameter("title"));
        dto.setKind(request.getParameter("kind"));
        dto.setContent(request.getParameter("content"));
        dto.setNickname(nickname);
        dto.setMode(mode);

        new BoardDAO().noticeInsert(dto);


                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenterFAQ?FAQKind=FAQList");




    }
}
