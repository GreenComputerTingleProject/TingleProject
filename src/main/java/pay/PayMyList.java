package pay;

import model.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class PayMyList implements PayService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject userData = (JSONObject) request.getSession().getAttribute("userData");

        ArrayList<PayDTO> dtos = new PayDAO().pay_my_list((Integer) userData.get("id"));

        JSONArray jArray = new JSONArray();

        try {
            for (PayDTO dto : dtos) {
                JSONObject jObject = new JSONObject();

                jObject.put("id", dto.getId());
                jObject.put("user_id", dto.getUser_id());
                jObject.put("imp_uid", dto.getImp_uid());
                jObject.put("paid_amount", dto.getPaid_amount());
                jObject.put("reg_date", dto.getReg_dateStr());

                jArray.add(jObject);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jArray);
            response.getWriter().flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
