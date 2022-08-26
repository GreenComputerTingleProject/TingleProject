package admin;

import model.AdminDAO;
import model.BoardDAO;
import model.BoardDTO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminCenter implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminCenter execute() 실행");
        String noticeKind = request.getParameter("noticeKind");
        int id = 0;
        String msg = "";

        switch (noticeKind){
            case "noticeList" :
                ArrayList<BoardDTO> noticeList = new BoardDAO().board_info(1);
                request.setAttribute("noticeData", noticeList);
                request.setAttribute("adminUrl", "menu/center/noticeList.jsp");
                break;
            case "noticeDetail" :
                id = Integer.parseInt(request.getParameter("id"));
                BoardDTO noticeDetail = new BoardDAO().noticeDetail(id);

                request.setAttribute("noticeData", noticeDetail);
                request.setAttribute("adminUrl", "menu/center/noticeDetail.jsp");
                break;
            case "noticeInsert" :
                request.setAttribute("adminUrl", "menu/center/noticeInsertForm.jsp");
                break;
            case "noticeDelete" :
                msg = "삭제되었습니다";
                id = Integer.parseInt(request.getParameter("id"));
                new BoardDAO().noticeDelete(id);

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenter?noticeKind=noticeList");
                break;
            case "noticeModify" :
                System.out.println("AdminMusicModify execute() 실행");
                id = Integer.parseInt(request.getParameter("id"));
                BoardDTO noticeModifyData = new BoardDAO().noticeDetail(id);

                request.setAttribute("noticeData", noticeModifyData);
                request.setAttribute("adminUrl", "menu/center/noticeModifyForm.jsp");
                break;

            default:
                break;
        }



    }
}
