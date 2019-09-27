package com.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.dto.Member;
import com.dto.Movie;
import com.dto.Review;
import com.service.ReviewService;

public class ReviewServiceImpl implements ReviewService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;

	/** MyBatis */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public ReviewServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	// 리뷰 전체 목록 조회
	@Override
	public List<Review> selectReviewList() throws Exception { 

		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectReviewList", null);

			if (result == null) {
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 리뷰 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Review> selectMyReview(Member member) throws Exception {
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectMyReview", member);

			if (result == null) {
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 리뷰 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 목록 조회에 실패했습니다.");
		}

		return result;
	}

	// 영화별 리뷰 조회
	@Override
	public List<Review> selectMovieReviewList(Movie movie) throws Exception {
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectMovieReviewList", movie);

			if (result == null) {
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 리뷰 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Review selectReviewGrade(Movie movie) throws Exception {

		Review result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectReviewGrade", movie);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 리뷰 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 목록 조회에 실패했습니다.");
		}

		return result;
	}

	// 리뷰 쓰기
	@Override
	public void insertReview(Review review) throws Exception {

		try {
			int result = sqlSession.insert("ReviewMapper.insertReview", review);
			if (result == 0) { // If input value is null
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 리뷰가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 작성에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}

	}

}
