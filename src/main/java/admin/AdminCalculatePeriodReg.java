package admin;

import model.AdminDAO;
import model.PayDAO;
import model.PayDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class AdminCalculatePeriodReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

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
                System.out.println("서비스 sday= " + sDay);
                System.out.println("서비스 eday= " + eDay);

                ArrayList<PayDTO> dto = new PayDAO().calculate(sDay, eDay);

                int period_income = 0;

                for (PayDTO pay : dto) {
                    period_income += pay.getPaid_amount();
                }

                int total_amount = new PayDAO().pay_total_amount();
                HashMap<Integer, Integer> monthly_amount = new PayDAO().pay_monthly_amount();

                request.setAttribute("sDay", sDay);
                request.setAttribute("eDay", eDay);
                request.setAttribute("total_amount", total_amount);
                request.setAttribute("monthly_amount", monthly_amount);
                request.setAttribute("period_income", period_income);
                request.setAttribute("calculate_pay", dto);
                request.setAttribute("result", 2);
                request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
            }
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
