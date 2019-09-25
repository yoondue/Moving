package com.helper;

import com.dto.Movie;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieHelper{
	
	public String movieSelect(String keyword) {
		
		String json = null;
		
		String clientId = "FDJL7FCtHA6PdbTjAV5d";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "nKbnQqtgYV";// 애플리케이션 클라이언트 시크릿값";
		
		try {
			String text = URLEncoder.encode(keyword, "UTF-8");
			int num = 5;
			String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&display=" + num;

			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; //xml
			BufferedReader br;
			URL url;
			HttpURLConnection con;

			url = new URL(apiURL);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			int responseCode = con.getResponseCode();

			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			StringBuffer response = new StringBuffer();
			while ((json = br.readLine()) != null) {
				response.append(json);
				// json = br.readLine();
			}
			br.close();
			json = response.toString();
//			System.out.println(json);
		} catch (Exception e) {
			System.out.println(e);
		}
	
		return json;
	}
	
	public Movie jsonParser(String json) throws ParseException {
		
		Movie movie = new Movie();
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);

		JSONArray item = (JSONArray) obj.get("items");

		//System.out.println(obj.toJSONString());
		//System.out.println(item.toJSONString());
		
		for (int i = 0; i < item.size(); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			movie.setTitle((String) tmp.get("title"));
			movie.setPubDate((String) tmp.get("pubDate"));
			movie.setImage((String) tmp.get("image"));
			
			String director = ((String) tmp.get("director")).replace("|", "");
			movie.setDirector(director);
			
			String actor = ((String) tmp.get("actor")).replace("|", ",");
			
			if(actor.length()>0) {
				actor = actor.substring(0, actor.length()-1);
			}
			
//			actor = actor.substring(0, actor.length()-1);
			movie.setActor(actor);
			
			String url = (String) tmp.get("link");
			Document doc = null;

			try {
				doc = Jsoup.connect(url)
						// .header("query", "라푼젤")
						// .header("section", "all")
						// .header("ie", "utf-8")
						.get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			Elements element = doc.select("div.story_area");
			String contents = element.select("p").text();

			Elements element2 = doc.select("p.info_spec");
			String genre = element2.select("span:first-child").text();

			Elements element3 = doc.select("p.info_spec");
			String country = element3.select("span:nth-child(2)").text();

			movie.setCountry(country);
			movie.setGenre(genre);
			movie.setContents(contents);
			
		}
		return movie;
	}
	
public List<Movie> jsonParserList(String json) throws ParseException {
		
		List<Movie> movieList = new ArrayList<Movie>();
		
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);

		JSONArray item = (JSONArray) obj.get("items");

		//System.out.println(obj.toJSONString());
		//System.out.println(item.toJSONString());
		
		for (int i = 0; i < item.size(); i++) {
			
			Movie movie = new Movie();
			
			JSONObject tmp = (JSONObject) item.get(i);
			movie.setTitle((String) tmp.get("title"));
			movie.setPubDate((String) tmp.get("pubDate"));
			movie.setImage((String) tmp.get("image"));
			
			String director = ((String) tmp.get("director")).replace("|", "");
			movie.setDirector(director);
			
			String actor = ((String) tmp.get("actor")).replace("|", ",");
			
			if(actor.length()>0) {
				actor = actor.substring(0, actor.length()-1);
			}
			
			movie.setActor(actor);
			
			String url = (String) tmp.get("link");
			Document doc = null;

			try {
				doc = Jsoup.connect(url)
						// .header("query", "라푼젤")
						// .header("section", "all")
						// .header("ie", "utf-8")
						.get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			Elements element = doc.select("div.story_area");
			String contents = element.select("p").text();

			Elements element2 = doc.select("p.info_spec");
			String genre = element2.select("span:first-child").text();

			Elements element3 = doc.select("p.info_spec");
			String country = element3.select("span:nth-child(2)").text();

			movie.setCountry(country);
			movie.setGenre(genre);
			movie.setContents(contents);
			
			movieList.add(movie);
			
		}
		return movieList;
	}
	
}
