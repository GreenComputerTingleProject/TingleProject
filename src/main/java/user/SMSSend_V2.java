package user;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SMSSend_V2 {

    final DefaultMessageService messageService;

    public SMSSend_V2() {
        this.messageService = NurigoApp.INSTANCE.initialize("NCSERSHMHNLVP3H8", "IZXBGIKKOOPARK6NXIAZ8NUGUQYOC9MO", "https://api.coolsms.co.kr");
    }

    /**
     * 단일 메시지 발송
     * @return
     */
    public String sendOne(String phone) {
        int authNo = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
        String certificationNumber = Integer.toString(authNo);

        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01033339573");
        message.setTo(phone);
        message.setText("[팅글] : " + certificationNumber);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return certificationNumber;
    }
}
