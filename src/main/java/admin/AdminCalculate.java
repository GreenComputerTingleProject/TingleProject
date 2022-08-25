package admin;

import model.PayDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public class AdminCalculate implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int total_amount = new PayDAO().pay_total_amount();
        HashMap<Integer, Integer> monthly_amount = new PayDAO().pay_monthly_amount();

        request.setAttribute("total_amount", total_amount);
        request.setAttribute("monthly_amount", monthly_amount);
        request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
    }
}
