package music;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MusicService {

    void execute(HttpServletRequest request, HttpServletResponse response);
}
