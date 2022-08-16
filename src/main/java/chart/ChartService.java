package chart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ChartService {

    void execute(HttpServletRequest request, HttpServletResponse response);
}
