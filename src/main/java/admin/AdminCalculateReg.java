package admin;

import model.AdminDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminCalculateReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminCalculateReg execute() 실행");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String msg;

        try {
           Date startday = dateFormat.parse(request.getParameter("startday"));
           Date endday = dateFormat.parse(request.getParameter("endday"));
            // 날짜비교
            System.out.println(startday.before(endday));

            String sDay = String.valueOf(startday);
            String eDay = String.valueOf(endday);
            if(!startday.before(endday)){
                msg = "검색가능한 날짜 형식이 틀립니다";

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                //  request.setAttribute("adminUrl", "menu/music/userList.jsp");
                request.setAttribute("goUrl", "AdminCalculate");

            } else {
                int cnt = new AdminDAO().calculate(sDay, eDay);
                int cal = cnt * 5900;

                request.setAttribute("cal", cal);
                request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }









    }
}
