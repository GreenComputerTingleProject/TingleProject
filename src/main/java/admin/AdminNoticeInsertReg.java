package admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.AdminDAO;
import model.BoardDAO;
import model.BoardDTO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminNoticeInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminNoticeInsertReg execute실행");

        String msg = "공지사항 등록이 완료되었습니다";
        String nickname = "팅글마스터";
        int mode = 1;

        BoardDTO dto = new BoardDTO();

        dto.setTitle(request.getParameter("title"));
        dto.setKind(request.getParameter("kind"));
        dto.setContent(request.getParameter("content"));
        dto.setNickname(nickname);
        dto.setMode(mode);

        new BoardDAO().noticeInsert(dto);


                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenter?noticeKind=noticeList");




    }
}
