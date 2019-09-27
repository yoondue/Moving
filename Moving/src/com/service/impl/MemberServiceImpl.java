package com.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.dto.Member;
import com.service.MemberService;

public class MemberServiceImpl implements MemberService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;

	/** MyBatis */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public MemberServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	// View member list
	@Override
	public List<Member> selectMemberList() throws Exception {
		List<Member> result = null;

		try {
			result = sqlSession.selectList("MemberMapper.selectMemberList", null);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("조회된 회원 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원 목록 조회에 실패했습니다.");
		}

		return result;
	}

	// Email Duplicate Check
	@Override
	public void selectMemberIdCheck(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectMemberIdCheck", member);

			if (result > 0) { // ID already exists
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 아이디입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사 실패!");
		}

	}

	// Nickname Duplicate Check
	@Override
	public void selectMemberNicknameCheck(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectMemberNicknameCheck", member);

			if (result > 0) { // Nickname already exists
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 닉네임입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("닉네임 중복검사 실패!");
		}

	}

	// Join - Save member info
	@Override
	public void insertMember(Member member) throws Exception {
		// Calling Email & Nickname Duplicate Check Method
		selectMemberIdCheck(member);
		selectMemberNicknameCheck(member);

		// Save join data
		try {
			int result = sqlSession.insert("MemberMapper.insertMember", member);
			if (result == 0) { // If input value is null
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo", member);

			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("아이디 또는 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패하였습니다.");
		}

		return result;
	}

	@Override
	public void updateMemberPassword(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMemberPassword", member);

			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("가입된 이메일이 아닙니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override
	public void selectMemberPasswordCount(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.selectMemberPasswordCount", member);

			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("잘못된 비밀번호입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 검사에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override
	public void deleteMember(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.deleteMember", member);

			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 탈퇴한 회원입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원 탈퇴에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}

	}
}
