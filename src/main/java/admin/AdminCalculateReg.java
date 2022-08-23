package admin;

import model.AdminDAO;
import model.PayDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdminCalculateReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminCalculateReg execute() 실행");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String msg;
        String sDay = request.getParameter("startday");
        String eDay = request.getParameter("endday");

        try {
           Date startday = dateFormat.parse(request.getParameter("startday"));
           Date endday = dateFormat.parse(request.getParameter("endday"));
            // 날짜비교



            if(!startday.before(endday)){
                msg = "검색가능한 날짜 형식이 틀립니다";

                request.setAttribute("msg", msg);
                request.setAttribute("adminUrl", "alert.jsp");
                //  request.setAttribute("adminUrl", "menu/music/userList.jsp");
                request.setAttribute("goUrl", "AdminCalculate");

            } else {
                System.out.println("서비스 sday = " + sDay);
                System.out.println("서비스 eday = " + eDay);
                ArrayList<PayDTO> dto = new AdminDAO().calculate(sDay, eDay);
                int period_income = 0;
                for (PayDTO pay : dto) {
                    period_income += pay.getPaid_amount();
                }



                request.setAttribute("period_income", period_income);
                request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }









    }
}
