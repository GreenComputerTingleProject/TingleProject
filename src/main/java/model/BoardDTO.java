package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDTO {

    Integer id, mode, user_id;
    String title, content, kind, nickname, login_id, checked, answer;
    Date reg_date;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

    public BoardDTO () {

    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getLogin_id() {
        return login_id;
    }

    public void setLogin_id(String login_id) {
        this.login_id = login_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
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
        return "BoardDTO{" +
                "id=" + id +
                ", mode=" + mode +
                ", user_id=" + user_id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", kind='" + kind + '\'' +
                ", nickname='" + nickname + '\'' +
                ", login_id='" + login_id + '\'' +
                ", reg_date=" + reg_date +
                ", sdf=" + sdf +
                '}';
    }
}
