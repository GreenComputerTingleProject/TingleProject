package admin;

import model.AdminDAO;
import model.BoardDAO;
import model.BoardDTO;
import model.MusicDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminCenterFAQ implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminCenterFAQ execute() 실행");
        String FAQKind = request.getParameter("FAQKind");
        int id = 0;
        String msg = "";

        switch (FAQKind){
            case "FAQList" :
                ArrayList<BoardDTO> FAQList = new BoardDAO().board_info(2);
                request.setAttribute("FAQData", FAQList);
                request.setAttribute("adminUrl", "menu/center/FAQList.jsp");
                break;
            case "FAQDetail" :
                id = Integer.parseInt(request.getParameter("id"));
                BoardDTO FAQDetail = new BoardDAO().noticeDetail(id);

                request.setAttribute("FAQData", FAQDetail);
                request.setAttribute("adminUrl", "menu/center/FAQDetail.jsp");
                break;
            case "FAQInsert" :
                request.setAttribute("adminUrl", "menu/center/FAQInsertForm.jsp");
                break;
            case "FAQDelete" :
                msg = "삭제되었습니다";
                id = Integer.parseInt(request.getParameter("id"));
                new BoardDAO().noticeDelete(id);

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenterFAQ?FAQKind=FAQList");
                break;
            case "FAQModify" :
                System.out.println("AdminMusicModify execute() 실행");
                id = Integer.parseInt(request.getParameter("id"));
                BoardDTO FAQModifyData = new BoardDAO().noticeDetail(id);

                request.setAttribute("FAQData", FAQModifyData);
                request.setAttribute("adminUrl", "menu/center/FAQModifyForm.jsp");
                break;

            default:
                break;
        }



    }
}
