package pay;

import com.google.gson.Gson;
import lombok.Data;

public class RequestSubPayment {

    public String requestSubPay(String payToken) {

        String token = payToken;
        Gson str = new Gson();
        token = token.substring(token.indexOf("response") + 10);
        token = token.substring(0, token.length() - 1);

        GetTokenVO vo = str.fromJson(token, GetTokenVO.class);

        String access_token = vo.getAccess_token();
        System.out.println(access_token);

        return access_token;
    }

    @Data
    public class GetTokenVO {

        private String access_token;
        private long now;
        private long expired_at;
    }
}
