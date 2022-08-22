package find;

import model.MusicDAO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class FindResult implements FindService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String findInput = request.getParameter("find-input");
        System.out.println("받아온 데이타: "+findInput);

        ArrayList<MusicDTO> findTitle = new MusicDAO().findTitle(findInput);
        ArrayList<MusicDTO> findArtist = new MusicDAO().findArtist(findInput);
        ArrayList<MusicDTO> findAlbum = new MusicDAO().findAlbum(findInput);
        ArrayList<MusicDTO> findLyrics = new MusicDAO().findLyrics(findInput);

        System.out.println("chartFind  타이틀 실행이얏  "+findTitle);
        System.out.println("chartFind 아티스트 실행이얏 "+findArtist);
        System.out.println("chartFind 앨범 실행이얏 "+findAlbum);


        //전체 어레이
        JSONArray jsonArray = new JSONArray();

        //결과별 어레이
        JSONArray titleArray = new JSONArray();
        JSONArray artistArray = new JSONArray();
        JSONArray albumArray = new JSONArray();
        JSONArray lyricsArray = new JSONArray();


        try {

            for (MusicDTO ft : findTitle) {
                JSONObject dataTitle = new JSONObject();
                dataTitle.put("t_id", ft.getId());
                dataTitle.put("t_cnt", ft.getCnt());
                dataTitle.put("t_title", ft.getTitle());
                dataTitle.put("t_album", ft.getAlbum());
                dataTitle.put("t_artistImg", ft.getAritst_img());
                dataTitle.put("t_coverImg", ft.getCover_img());
                dataTitle.put("t_artist", ft.getArtist());
                dataTitle.put("t_genre", ft.getGenre());
                dataTitle.put("t_genre_no", ft.getGenre_no());
                dataTitle.put("t_file_path", ft.getFile_path());
                titleArray.add(dataTitle);
            }



            for (MusicDTO fa : findArtist) {
                JSONObject dataArtist = new JSONObject();
                dataArtist.put("a_id", fa.getId());
                dataArtist.put("a_cnt", fa.getCnt());
                dataArtist.put("a_title", fa.getTitle());
                dataArtist.put("a_album", fa.getAlbum());
                dataArtist.put("a_artist", fa.getArtist());
                dataArtist.put("a_artistImg", fa.getAritst_img());
                dataArtist.put("a_coverImg", fa.getCover_img());
                dataArtist.put("a_genre", fa.getGenre());
                dataArtist.put("a_genre_no", fa.getGenre_no());
                dataArtist.put("a_file_path", fa.getFile_path());
                artistArray.add(dataArtist);
            }

            for (MusicDTO fa : findAlbum) {
                JSONObject dataAlbum = new JSONObject();
                dataAlbum.put("b_id", fa.getId());
                dataAlbum.put("b_cnt", fa.getCnt());
                dataAlbum.put("b_title", fa.getTitle());
                dataAlbum.put("b_album", fa.getAlbum());
                dataAlbum.put("b_artist", fa.getArtist());
                dataAlbum.put("b_artistImg", fa.getAritst_img());
                dataAlbum.put("b_coverImg", fa.getCover_img());
                dataAlbum.put("b_genre", fa.getGenre());
                dataAlbum.put("b_genre_no", fa.getGenre_no());
                dataAlbum.put("b_file_path", fa.getFile_path());
                dataAlbum.put("b_release_date", fa.getRelease_date());
                albumArray.add(dataAlbum);
            }

            for (MusicDTO fl : findLyrics) {
                JSONObject dataLyrics = new JSONObject();
                dataLyrics.put("l_id", fl.getId());
                dataLyrics.put("l_cnt", fl.getCnt());
                dataLyrics.put("l_title", fl.getTitle());
                dataLyrics.put("l_album", fl.getAlbum());
                dataLyrics.put("l_artist", fl.getArtist());
                dataLyrics.put("l_artistImg", fl.getAritst_img());
                dataLyrics.put("l_coverImg", fl.getCover_img());
                dataLyrics.put("l_lyrics",fl.getLyrics());
                dataLyrics.put("l_genre", fl.getGenre());
                dataLyrics.put("l_genre_no", fl.getGenre_no());
                dataLyrics.put("l_file_path", fl.getFile_path());
                dataLyrics.put("l_release_date", fl.getRelease_date());

                lyricsArray.add(dataLyrics);
            }



            jsonArray.add(titleArray);
            jsonArray.add(artistArray);
            jsonArray.add(albumArray);
            jsonArray.add(lyricsArray);




        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(jsonArray);
        System.out.println("jsonArray: " + jsonArray);
        response.getWriter().flush();

        } catch (IOException e) {
            e.printStackTrace();
        }




    }
}