package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.parser.ParseException;

import com.dto.Movie;
import com.helper.MovieHelper;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MovieHelper helper = new MovieHelper();
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();
		
		
		String json = helper.movieSelect("");
		
		try {
//			movie = helper.jsonParser(json);
			movieList = helper.jsonParserList(json);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		System.out.println("제목 : " + movie.getTitle());
//		System.out.println("연도 : " + movie.getPubDate());
//		System.out.println("장르 : " + movie.getGenre());
//		System.out.println("이미지 : " + movie.getImage());
//		System.out.println("감독 : " + movie.getDirector());
//		System.out.println("배우 : " + movie.getActor());
//		System.out.println("국가 : " + movie.getCountry());
//		System.out.println("줄거리 : " + movie.getContents());
		
		for(int i=0; i<movieList.size(); i++) {
			System.out.println("제목 : " + movieList.get(i).getTitle());
			System.out.println("연도 : " + movieList.get(i).getPubDate());
			System.out.println("장르 : " + movieList.get(i).getGenre());
			System.out.println("이미지 : " + movieList.get(i).getImage());
			System.out.println("감독 : " + movieList.get(i).getDirector());
			System.out.println("배우 : " + movieList.get(i).getActor());
			System.out.println("국가 : " + movieList.get(i).getCountry());
			System.out.println("줄거리 : " + movieList.get(i).getContents());
			System.out.println();
		}
	}

}
