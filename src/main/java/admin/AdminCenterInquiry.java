package admin;

import model.BoardDAO;
import model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminCenterInquiry implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String inquiryKind = request.getParameter("inquiryKind");
        System.out.println(inquiryKind);
        int id = 0;
        String msg = "";

        switch (inquiryKind) {
            case "inquiryList" :
                ArrayList<BoardDTO> inquiryList = new BoardDAO().board_info(3);

                request.setAttribute("inquiryData", inquiryList);
                request.setAttribute("adminUrl", "menu/center/inquiryList.jsp");
                break;

            case "inquiryDetail" :
                id = Integer.parseInt(request.getParameter("id"));
                BoardDTO inquiryDetail = new BoardDAO().noticeDetail(id);

                request.setAttribute("inquiryData", inquiryDetail);
                request.setAttribute("adminUrl", "menu/center/inquiryDetail.jsp");
                break;
            case "inquiryAnswer" :
                id = Integer.parseInt(request.getParameter("id"));
                msg = "답변 등록 성공";
               String answer = request.getParameter("answer");
               String checked = "답변완료";

               BoardDTO dto = new BoardDTO();
               dto.setId(id);
               dto.setAnswer(answer);
               dto.setChecked(checked);

                new BoardDAO().inquiryAnswer(dto);

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenterInquiry?inquiryKind=inquiryList");
                break;

            case "inquiryDelete" :
                msg = "삭제되었습니다";
                id = Integer.parseInt(request.getParameter("id"));
                new BoardDAO().noticeDelete(id);

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                request.setAttribute("goUrl", "AdminCenterInquiry?inquiryKind=inquiryList");
                break;
            default:
                break;

        }


    }
}
