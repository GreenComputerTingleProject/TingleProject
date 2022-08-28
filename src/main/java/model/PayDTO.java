package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PayDTO {

    int id, user_id, paid_amount;
    String imp_uid, customer_uid, merchant_uid;
    Date reg_date;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH:mm:ss");

    public PayDTO() {

    }

    public PayDTO(int id, int user_id, int paid_amount, String imp_uid, String customer_uid, String merchant_uid, Date reg_date, SimpleDateFormat sdf) {
        this.id = id;
        this.user_id = user_id;
        this.paid_amount = paid_amount;
        this.imp_uid = imp_uid;
        this.customer_uid = customer_uid;
        this.merchant_uid = merchant_uid;
        this.reg_date = reg_date;
        this.sdf = sdf;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPaid_amount() {
        return paid_amount;
    }

    public void setPaid_amount(int paid_amount) {
        this.paid_amount = paid_amount;
    }

    public String getImp_uid() {
        return imp_uid;
    }

    public void setImp_uid(String imp_uid) {
        this.imp_uid = imp_uid;
    }

    public String getCustomer_uid() {
        return customer_uid;
    }

    public void setCustomer_uid(String customer_uid) {
        this.customer_uid = customer_uid;
    }

    public String getMerchant_uid() {
        return merchant_uid;
    }

    public void setMerchant_uid(String merchant_uid) {
        this.merchant_uid = merchant_uid;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public String getReg_dateStr() {
        return sdf.format(reg_date);
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "PayDTO{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", paid_amount=" + paid_amount +
                ", imp_uid='" + imp_uid + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
