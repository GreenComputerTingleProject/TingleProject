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
import java.util.LinkedHashMap;

public class AdminCalculateDailyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd");

        try {
            Date month = dateFormat.parse(request.getParameter("month") + "-01");
            String firstDay = dateFormat.format(month);

            month.setMonth(month.getMonth() + 1);
            month.setDate(0);
            String lastDay = dateFormat.format(month);

            ArrayList<PayDTO> dtos = new PayDAO().calculateASC(firstDay, lastDay);

            LinkedHashMap<String, ArrayList<PayDTO>> daily_amount = new LinkedHashMap<>();

            for (PayDTO dto : dtos) {
                daily_amount.put(dateFormat.format(dto.getReg_date()), new ArrayList<>());
            }

            daily_amount.forEach((strKey, strValue)->{
                try {
                    for (PayDTO dto : dtos) {
                        if(dateFormat.format(dto.getReg_date()).equals(strKey)) {
                            strValue.add(dto);
                        }
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            });

//            System.out.println(daily_amount);

            int total_amount = new PayDAO().pay_total_amount();
            HashMap<Integer, Integer> monthly_amount = new PayDAO().pay_monthly_amount();

            request.setAttribute("total_amount", total_amount);
            request.setAttribute("monthly_amount", monthly_amount);
            request.setAttribute("daily_amount", daily_amount);
            request.setAttribute("result", 1);
            request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
