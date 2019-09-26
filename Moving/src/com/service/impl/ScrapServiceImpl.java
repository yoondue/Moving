package com.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.dto.Member;
import com.dto.Scrap;
import com.service.ScrapService;

public class ScrapServiceImpl implements ScrapService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public ScrapServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public List<Scrap> selectMyScrap(Member member) throws Exception {

		List<Scrap> result = null;

		try {
			result = sqlSession.selectList("ScrapMapper.selectMyScrap", member);

			if (result == null) {
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 스크랩 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("스크랩 목록 조회에 실패했습니다.");
		}

		return result;

	}

}
