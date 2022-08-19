package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MusicDTO {
    Integer id, cnt, genre_no;
    String title, artist, album, genre, mood, file_path, cover_img, aritst_img, lyrics;
    Date release_date;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH:mm:ss");

    @Override
    public String toString() {
        return "MusicDTO{" +
                "id=" + id +
                ", cnt=" + cnt +
                ", genre_no=" + genre_no +
                ", title='" + title + '\'' +
                ", artist='" + artist + '\'' +
                ", aritst_img='" + aritst_img + '\'' +
                ", album='" + album + '\'' +
                ", genre='" + genre + '\'' +
                ", mood='" + mood + '\'' +
                ", file_path='" + file_path + '\'' +
                ", cover_img='" + cover_img + '\'' +
                ", lyrics='" + lyrics + '\'' +
                ", release_date=" + release_date +
                ", sdf=" + sdf +
                '}';
    }

    public MusicDTO() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    public Integer getGenre_no() {
        return genre_no;
    }

    public void setGenre_no(Integer genre_no) {
        this.genre_no = genre_no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getMood() {
        return mood;
    }

    public void setMood(String mood) {
        this.mood = mood;
    }

    public String getFile_path() {
        return file_path;
    }

    public void setFile_path(String file_path) {
        this.file_path = file_path;
    }

    public String getCover_img() {
        return cover_img;
    }

    public void setCover_img(String cover_img) {
        this.cover_img = cover_img;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    public SimpleDateFormat getSdf() {
        return sdf;
    }

    public void setSdf(SimpleDateFormat sdf) {
        this.sdf = sdf;
    }

    public String getAritst_img() {
        return aritst_img;
    }

    public void setAritst_img(String aritst_img) {
        this.aritst_img = aritst_img;
    }

    public MusicDTO(Integer id, Integer cnt, Integer genre_no, String title, String artist, String album, String genre, String mood, String file_path, String cover_img, String aritst_img, String lyrics, Date release_date, SimpleDateFormat sdf) {
        this.id = id;
        this.cnt = cnt;
        this.genre_no = genre_no;
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.genre = genre;
        this.mood = mood;
        this.file_path = file_path;
        this.cover_img = cover_img;
        this.aritst_img = aritst_img;
        this.lyrics = lyrics;
        this.release_date = release_date;
        this.sdf = sdf;
    }
}
