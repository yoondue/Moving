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
	
	// 키워드와 결과 개수를 입력받아서 json으로 결과 받기
	public String movieSelect(String keyword, int result) {
		
		String json = null;
		
		String clientId = "FDJL7FCtHA6PdbTjAV5d";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "nKbnQqtgYV";// 애플리케이션 클라이언트 시크릿값";
		
		try {
			String text = URLEncoder.encode(keyword, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&display=" + result;

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
	
	// 하나의 영화 정보 조회
	public Movie jsonParser(String json) throws ParseException {
		
		Movie movie = new Movie();
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);

		JSONArray item = (JSONArray) obj.get("items");

		for (int i = 0; i < item.size(); i++) {
			JSONObject tmp = (JSONObject) item.get(i);

			// 영화 제목의 <b>태그 제거
			String title = (String) tmp.get("title");
			title = title.replace("<b>", "").replace("</b>", "");
			movie.setTitle(title);
			
			movie.setPubDate((String) tmp.get("pubDate"));
			
			String director = ((String) tmp.get("director")).replace("|", "");
			movie.setDirector(director);
			
			String actor = ((String) tmp.get("actor")).replace("|", ", ");
			
			if(actor.length()>0) {
				actor = actor.substring(0, actor.length()-1);
			}
			
			movie.setActor(actor);
			
			String url = (String) tmp.get("link");
			Document doc = null;

			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			Elements element = doc.select("div.story_area");
			String contents = element.select("p").text();

//			Elements element2 = doc.select("p.info_spec");
			Elements element2 = doc.select("dl.info_spec .step1").next();
			String genre = element2.select("span:first-child").text();

//			Elements element3 = doc.select("p.info_spec");
			Elements element3 = doc.select("dl.info_spec .step1").next();
			String country = element3.select("span:nth-child(2)").text();
			
			Elements element4 = doc.select(".mv_info_area");
			String image = element4.select(".poster a img").attr("src");
			
			if(image.equals("")) {
				
				image = "/Moving/images/movie1.jpg";
			}

			movie.setCountry(country);
			movie.setGenre(genre);
			movie.setContents(contents);
			movie.setImage(image);
			
		}
		return movie;
	}
	
	// list로 된 영화 정보 조회
	public List<Movie> jsonParserList(String json) throws ParseException {
		
		List<Movie> movieList = new ArrayList<Movie>();
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);

		JSONArray item = (JSONArray) obj.get("items");

		for (int i = 0; i < item.size(); i++) {
			
			Movie movie = new Movie();
			
			JSONObject tmp = (JSONObject) item.get(i);
			
			// 영화 제목의 <b>태그 제거
			String title = (String) tmp.get("title");
			title = title.replace("<b>", "").replace("</b>", "");
			movie.setTitle(title);
			
			movie.setPubDate((String) tmp.get("pubDate"));
			
			String director = ((String) tmp.get("director")).replace("|", "");
			movie.setDirector(director);
			
			String actor = ((String) tmp.get("actor")).replace("|", ", ");
			
			if(actor.length()>0) {
				actor = actor.substring(0, actor.length()-1);
			}
			
			movie.setActor(actor);
			
			String url = (String) tmp.get("link");
			Document doc = null;

			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			Elements element = doc.select("div.story_area");
			String contents = element.select("p").text();

//			Elements element2 = doc.select("p.info_spec");
//			String genre = element2.select("span:first-child").text();
//
//			Elements element3 = doc.select("p.info_spec");
//			String country = element3.select("span:nth-child(2)").text();
			
			Elements element2 = doc.select("dl.info_spec .step1").next();
			String genre = element2.select("span:first-child").text();
			
			Elements element3 = doc.select("dl.info_spec .step1").next();
			String country = element3.select("span:nth-child(2)").text();
			
			Elements element4 = doc.select(".mv_info_area");
			String image = element4.select(".poster a img").attr("src");
			
			if(image.equals("")) {
				
				image = "/Moving/images/movie1.jpg";
			}

			movie.setCountry(country);
			movie.setGenre(genre);
			movie.setContents(contents);
			movie.setImage(image);
			
			movieList.add(movie);
			
		}
		return movieList;
	}
	
//	public List<Movie> searchGenre(String genre){
//		
//		List<Movie> movieList = new ArrayList<Movie>();
//		
//		String url = "https://movie.naver.com/movie/sdb/browsing/bmovie.nhn?genre=" + genre;
//		
//		
//		
//		for(int i=0; i<20; i++) {
//			
//			Movie movie = new Movie();
//			
//			Document doc1 = null;
//			Document doc2 = null;
//			
//			try {
//				doc1 = Jsoup.connect(url)
//						// .header("query", "라푼젤")
//						// .header("section", "all")
//						// .header("ie", "utf-8")
//						.get();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			Elements element1 = doc1.select(".directory_list");
//			String movieUrl = element1.select("li:eq("+i+") a:first").attr("href");
//			
//			System.out.println(movieUrl);
//			
//			// 영화 상세페이지로 이동
//			try {
//				doc2 = Jsoup.connect(movieUrl)
//						// .header("query", "라푼젤")
//						// .header("section", "all")
//						// .header("ie", "utf-8")
//						.get();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			Elements posterEl = doc2.select(".poster");
//			String poster = posterEl.select("a img").attr("src");
//			
//			Elements titleEl = doc2.select(".mv_info_area");
//			String title = titleEl.select("h3 a").text();
//			
//		}
//		
//		return movieList;
//	}
	
	
}
