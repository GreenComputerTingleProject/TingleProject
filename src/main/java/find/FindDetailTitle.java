package find;

import model.MusicDAO;
import model.MusicDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class FindDetailTitle implements FindService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String artist = request.getParameter("artist");
        String album = request.getParameter("album");
        System.out.println(title+"받아온 데이타: "+album+"받아온 데이타: "+artist);



        ArrayList<MusicDTO> findArtist = new MusicDAO().findDetailTitle(title,artist,album);

        System.out.println("chartFind 아티스트 실행이얏 "+findArtist);



        //전체 어레이
        JSONArray jsonArray = new JSONArray();




      try {


            for (MusicDTO fa : findArtist) {
                JSONObject dataArtist = new JSONObject();
                dataArtist.put("id", fa.getId());
                dataArtist.put("cnt", fa.getCnt());
                dataArtist.put("title", fa.getTitle());
                dataArtist.put("album", fa.getAlbum());
                dataArtist.put("artist", fa.getArtist());
                dataArtist.put("artist_img", fa.getArtist_img());
                dataArtist.put("cover_img", fa.getCover_img());
                dataArtist.put("genre", fa.getGenre());
                dataArtist.put("genre_no", fa.getGenre_no());
                dataArtist.put("file_path", fa.getFile_path());
                dataArtist.put("release_date", fa.getRelease_dateStr());
                dataArtist.put("lyrics", fa.getLyrics());
                jsonArray.add(dataArtist);
            }

//            for (MusicDTO fa : findAlbum) {
//                JSONObject dataAlbum = new JSONObject();
//                dataAlbum.put("id", fa.getId());
//                dataAlbum.put("cnt", fa.getCnt());
//                dataAlbum.put("title", fa.getTitle());
//                dataAlbum.put("album", fa.getAlbum());
//                dataAlbum.put("artist", fa.getArtist());
//                dataAlbum.put("artist_img", fa.getArtist_img());
//                dataAlbum.put("cover_img", fa.getCover_img());
//                dataAlbum.put("genre", fa.getGenre());
//                dataAlbum.put("genre_no", fa.getGenre_no());
//                dataAlbum.put("file_path", fa.getFile_path());
//                dataAlbum.put("release_date", fa.getRelease_dateStr());
//                dataAlbum.put("lyrics", fa.getLyrics());
//                albumArray.add(dataAlbum);
//            }

//            for (MusicDTO fl : findLyrics) {
//                JSONObject dataLyrics = new JSONObject();
//                dataLyrics.put("id", fl.getId());
//                dataLyrics.put("cnt", fl.getCnt());
//                dataLyrics.put("title", fl.getTitle());
//                dataLyrics.put("album", fl.getAlbum());
//                dataLyrics.put("artist", fl.getArtist());
//                dataLyrics.put("artist_img", fl.getArtist_img());
//                dataLyrics.put("cover_img", fl.getCover_img());
//                dataLyrics.put("lyrics",fl.getLyrics());
//                dataLyrics.put("genre", fl.getGenre());
//                dataLyrics.put("genre_no", fl.getGenre_no());
//                dataLyrics.put("file_path", fl.getFile_path());
//                dataLyrics.put("release_date", fl.getRelease_dateStr());
//
//                lyricsArray.add(dataLyrics);
//            }



          //  jsonArray.add(titleArray);
          //  jsonArray.add(artistArray);
         //   jsonArray.add(albumArray);
//            jsonArray.add(lyricsArray);




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