package admin;

import model.PayDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminCalculate implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int total_amount = new PayDAO().pay_total_amount();

        request.setAttribute("total_amount", total_amount);

        request.setAttribute("adminUrl", "menu/calculate/calculate.jsp");
    }
}
