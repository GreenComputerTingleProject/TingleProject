/*
package chart;

import nonView_p.NonViewService;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.net.URLEncoder;

public class FileDown implements ChartService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("FileDown 진입");

        String path = request.getRealPath("fff");
        // 인텔리제이는 이거 사실 필요없음. 이클립스가 가상경로 쓰기때문에 path를 하드코딩한거임
        path = "/Users/cyong9573/IntelliJ-workspace/mvcProj/src/main/webapp/fff";

        String upfile = request.getParameter("upfile");

        try {
            FileInputStream fis = new FileInputStream(path + "/" + upfile);

            response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(upfile, "UTF-8"));

            ServletOutputStream sos = response.getOutputStream();

            byte[] buf = new byte[1024];

            while (fis.available() > 0) {
                int len = fis.read(buf);
                sos.write(buf, 0, len);
            }

            sos.close();
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
*/
