package model;

public class AdminDTO {

    int id;
    String login_id, login_pw;

    public AdminDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public void setLogin_pw(String logind_pw) {
        this.login_pw = logind_pw;
    }

    @Override
    public String toString() {
        return "AdminDTO{" +
                "id=" + id +
                ", login_id='" + login_id + '\'' +
                ", logind_pw='" + login_pw + '\'' +
                '}';
    }
}
