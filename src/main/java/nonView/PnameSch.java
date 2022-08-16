package nonView;

import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

public class PnameSch implements NonViewService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String pname = request.getParameter("pname");
        System.out.println("PnameSch 진입:" + pname);

        try {
            String data = "[" +
                    "{\"name\":\"김중회\", \"tel\":\"010-3333-1111\", \"age\":24}]";
            String ttt = URLEncoder.encode(data, "UTF-8");

            JSONObject data2 = new JSONObject();
            data2.put("name", URLEncoder.encode("송찬욱", "UTF-8"));
            data2.put("tel", "010-1234-5678");
            data2.put("age", 21);

            ttt = data2.toJSONString();
            System.out.println(ttt);
            response.getWriter().append(ttt);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
