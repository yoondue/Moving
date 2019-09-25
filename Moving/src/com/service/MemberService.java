package com.service;

import java.util.List;

import com.dto.Member;

public interface MemberService {

	public List<Member> selectMemberList() throws Exception;

	
	// Email Duplicate Check
	// An exception occurs if the data is duplicate
	public void selectMemberIdCheck(Member member) throws Exception;
	
	// Nickname Duplicate Check
	public void selectMemberNicknameCheck(Member member) throws Exception;
	
	// JoinPage's Join: save member info
	public void insertMember(Member member) throws Exception;
	
	// LoginPage's login
	public Member selectLoginInfo(Member member) throws Exception;

}
