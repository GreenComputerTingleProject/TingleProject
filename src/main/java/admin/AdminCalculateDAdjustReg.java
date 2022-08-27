package admin;

import model.PayDAO;
import model.PayDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class AdminCalculateDAdjustReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date month = dateFormat.parse(request.getParameter("month") + "-01");
            String firstDay = dateFormat.format(month);

            month.setMonth(month.getMonth() + 1);
            month.setDate(0);
            String lastDay = dateFormat.format(month);

            ArrayList<PayDTO> dtos = new PayDAO().calculateASC(firstDay, lastDay);

            LinkedHashMap<String, Integer> daily_adjust = new LinkedHashMap<>();

            int lDay = Integer.parseInt(lastDay.substring(8));

            for (int i = 1; i <= lDay; i++) {
                Date mon = dateFormat.parse(request.getParameter("month") + "-" + i);
                String day = dateFormat.format(mon);

                daily_adjust.put(day, 0);
            }

            daily_adjust.forEach((strKey, strValue)->{
                try {
                    for (PayDTO dto : dtos) {
                        if(dateFormat.format(dto.getReg_date()).equals(strKey)) {
                            daily_adjust.put(strKey, daily_adjust.get(strKey) + dto.getPaid_amount());
                        }
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            });

            System.out.println(daily_adjust);

            int total_amount = new PayDAO().pay_total_amount();
            HashMap<Integer, Integer> monthly_amount = new PayDAO().pay_monthly_amount();

            request.setAttribute("total_amount", total_amount);
            request.setAttribute("monthly_amount", monthly_amount);
            request.setAttribute("daily_adjust", daily_adjust);
            request.setAttribute("result", 3);
            request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
