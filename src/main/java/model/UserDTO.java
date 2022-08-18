package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDTO {
    Integer id, join_type, membership;
    String login_id, login_pw, name, nickname, phone_number, email_address, profile_image, personal_type;
    Date join_date;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH:mm:ss");

    public UserDTO() {

    }

    public UserDTO(Integer id, Integer join_type, Integer membership, String login_id, String login_pw, String name, String nickname, String phone_number, String email_address, String profile_image, String personal_type, Date join_date) {
        this.id = id;
        this.join_type = join_type;
        this.membership = membership;
        this.login_id = login_id;
        this.login_pw = login_pw;
        this.name = name;
        this.nickname = nickname;
        this.phone_number = phone_number;
        this.email_address = email_address;
        this.profile_image = profile_image;
        this.personal_type = personal_type;
        this.join_date = join_date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJoin_type() {
        return join_type;
    }

    public void setJoin_type(Integer join_type) {
        this.join_type = join_type;
    }

    public Integer getMembership() {
        return membership;
    }

    public void setMembership(Integer membership) {
        this.membership = membership;
    }

    public String getLogin_id() {
        return login_id;
    }

    public void setLogin_id(String login_id) {
        this.login_id = login_id;
    }

    public String getLogin_pw() {
        return login_pw;
    }

    public void setLogin_pw(String login_pw) {
        this.login_pw = login_pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }

    public String getProfile_image() {
        return profile_image;
    }

    public void setProfile_image(String profile_image) {
        this.profile_image = profile_image;
    }

    public String getPersonal_type() {
        return personal_type;
    }

    public void setPersonal_type(String personal_type) {
        this.personal_type = personal_type;
    }

    public Date getJoin_date() {
        return join_date;
    }

    public String getJoin_dateStr() {
        return sdf.format(join_date);
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", join_type=" + join_type +
                ", membership=" + membership +
                ", login_id='" + login_id + '\'' +
                ", login_pw='" + login_pw + '\'' +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", email_address='" + email_address + '\'' +
                ", profile_image='" + profile_image + '\'' +
                ", personal_type='" + personal_type + '\'' +
                ", join_date=" + join_date +
                ", sdf=" + sdf +
                '}';
    }
}
