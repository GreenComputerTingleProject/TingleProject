package pay;

import model.PayDTO;

import java.util.*;

public class ImportPay {

    public String getToken() {
        Map<String, Object> map = new HashMap<>();
        map.put("imp_key", "6350050142446516");
        map.put("imp_secret", "Rt9epXl7G8pGCnIEMuBx0KXrcpivQs53nuJEjDhgDn5H1gRG3TLXnsJffgcQ7pQmy4ACWesXCpnAQ4Tm");

        HttpConnectionUtils httpConnectionUtils = new HttpConnectionUtils();
        return httpConnectionUtils.postRequest("https://api.iamport.kr/users/getToken", null, map);
    }

    public String postAgain(String accessToken, PayDTO dto) {
        Map<String, Object> map = new HashMap<>();
        map.put("merchant_uid", "merchant_" + new Date().getTime());
        map.put("amount", dto.getPaid_amount());
        map.put("name", "Tingle 정기결제");
        map.put("customer_uid", dto.getCustomer_uid());

        HttpConnectionUtils httpConnectionUtils = new HttpConnectionUtils();
        return httpConnectionUtils.postRequest("https://api.iamport.kr/subscribe/payments/again", accessToken, map);
    }

    public String postSchedule(String accessToken, PayDTO dto, String name, String phone_number, String email_address) {
        ArrayList schedule = new ArrayList();
        Map<String, Object> scheduleMap = new HashMap<>();

        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.MONTH, 1);

        scheduleMap.put("merchant_uid", "merchant_" + (cal.getTimeInMillis() / 1000));
        scheduleMap.put("schedule_at", cal.getTimeInMillis() / 1000); // 지금으로부터 한달 뒤 결제
        scheduleMap.put("amount", dto.getPaid_amount());
        scheduleMap.put("name", "Tingle 정기결제");
        scheduleMap.put("buyer_name", name);
        scheduleMap.put("buyer_tel", phone_number);
        scheduleMap.put("buyer_email", email_address);
        schedule.add(scheduleMap);

        Map<String, Object> map = new HashMap<>();
        map.put("customer_uid", dto.getCustomer_uid());
        map.put("schedules", schedule);

        HttpConnectionUtils httpConnectionUtils = new HttpConnectionUtils();
        return httpConnectionUtils.postRequest("https://api.iamport.kr/subscribe/payments/schedule", accessToken, map);
    }
}
