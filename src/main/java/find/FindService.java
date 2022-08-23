package find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FindService {

    void execute(HttpServletRequest request, HttpServletResponse response);
}
