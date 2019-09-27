package com.service;

import java.util.List;

import com.dto.Member;
import com.dto.Movie;

public interface MovieService {
	
	public List<Movie> selectGenreOne(Movie movie) throws Exception;
	
	public List<Movie> selectGenreTwo(Movie movie) throws Exception;
	
	public List<Movie> selectGenreThree(Movie movie) throws Exception;
	
	public List<Movie> selectMovieAsGenre(Member member) throws Exception;
	
}
