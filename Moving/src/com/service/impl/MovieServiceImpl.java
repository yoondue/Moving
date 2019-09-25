package com.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.dto.Movie;
import com.service.MovieService;

public class MovieServiceImpl implements MovieService{
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public MovieServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public List<Movie> selectGenreOne(Movie movie) throws Exception {
		
		List<Movie> result = null;
		
		try {
			result = sqlSession.selectList("MovieMapper.selectGenreOne", movie);
			
			if (result == null) {
				throw new NullPointerException();
			}
			
		}catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 영화 목록이 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("영화 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Movie> selectGenreTwo(Movie movie) throws Exception {

		List<Movie> result = null;
		
		try {
			result = sqlSession.selectList("MovieMapper.selectGenreTwo", movie);
			
			if (result == null) {
				throw new NullPointerException();
			}
			
		}catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 영화 목록이 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("영화 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Movie> selectGenreThree(Movie movie) throws Exception {

		List<Movie> result = null;
		
		try {
			result = sqlSession.selectList("MovieMapper.selectGenreThree", movie);
			
			if (result == null) {
				throw new NullPointerException();
			}
			
		}catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 영화 목록이 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("영화 목록 조회에 실패했습니다.");
		}
		
		return result;
	}
}
