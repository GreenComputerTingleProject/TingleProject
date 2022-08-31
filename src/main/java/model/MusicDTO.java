package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MusicDTO {
    Integer id, cnt, genre_no, artist_no;
    String title, artist, album, genre, file_path, cover_img, lyrics, artist_img, release_date2;
    Date release_date;

    public String getRelease_date2() {
        return release_date2;
    }

    public void setRelease_date2(String release_date2) {
        this.release_date2 = release_date2;
    }

    public Integer getArtist_no() {
        return artist_no;
    }

    public void setArtist_no(Integer artist_no) {
        this.artist_no = artist_no;
    }

    public Integer getGenre_no() {
        return genre_no;
    }

    public void setGenre_no(Integer genre_no) {this.genre_no = genre_no;}

    public String getArtist_img() {
        return artist_img;
    }

    public void setArtist_img(String artist_img) {
        this.artist_img = artist_img;
    }

    public SimpleDateFormat getSdf() {
        return sdf;
    }

    public void setSdf(SimpleDateFormat sdf) {
        this.sdf = sdf;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

    public MusicDTO() {

    }

    public MusicDTO(Integer id, Integer cnt, String title, String artist, String album, String genre, String file_path, String cover_img, String lyrics, Date release_date) {
        this.id = id;
        this.cnt = cnt;
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.genre = genre;
        this.file_path = file_path;
        this.cover_img = cover_img;
        this.lyrics = lyrics;
        this.release_date = release_date;
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

    public String getRelease_dateStr() {
        return sdf.format(release_date);
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    @Override
    public String toString() {
        return "MusicDTO{" +
                "id=" + id +
                ", cnt=" + cnt +
                ", genre_no=" + genre_no +
                ", artist_no=" + artist_no +
                ", title='" + title + '\'' +
                ", artist='" + artist + '\'' +
                ", album='" + album + '\'' +
                ", genre='" + genre + '\'' +
                ", file_path='" + file_path + '\'' +
                ", cover_img='" + cover_img + '\'' +
                ", lyrics='" + lyrics + '\'' +
                ", artist_img='" + artist_img + '\'' +
                ", release_date=" + release_date +
                ", sdf=" + sdf +
                '}';
    }
}
