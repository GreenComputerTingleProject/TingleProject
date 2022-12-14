package admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.parser.mp3.Mp3Parser;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * @author jaehyun.jung
 *
 */
public class AudioParser {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String fileLocation = "/Users/cyong9573/Downloads/노래/엠씨더맥스-01-사랑을 믿어요.mp3";

		try {

			InputStream input = new FileInputStream(new File(fileLocation));
			ContentHandler handler = new DefaultHandler();
			Metadata metadata = new Metadata();
			Parser parser = new Mp3Parser();
			ParseContext parseCtx = new ParseContext();
			parser.parse(input, handler, metadata, parseCtx);
			input.close();

			// List all metadata
			String[] metadataNames = metadata.names();

			for(String name : metadataNames){
				System.out.println(name + ": " + metadata.get(name));
			}

			// Retrieve the necessary info from metadata
			// Names - title, xmpDM:artist etc. - mentioned below may differ based
			System.out.println("----------------------------------------------");
			System.out.println("Title: " + URLEncoder.encode( metadata.get("title"), "utf-8") );
			System.out.println("Artists: " + metadata.get("xmpDM:artist"));
			System.out.println("Composer : "+metadata.get("xmpDM:composer"));
			System.out.println("Genre : "+metadata.get("xmpDM:genre"));
			System.out.println("Album : "+metadata.get("xmpDM:album"));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (TikaException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}