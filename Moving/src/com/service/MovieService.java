package com.service;

import java.util.List;

import com.dto.Movie;

public interface MovieService {
	
	public List<Movie> selectGenre(Movie movie) throws Exception;
}
