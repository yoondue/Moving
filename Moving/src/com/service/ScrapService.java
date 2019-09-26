package com.service;

import java.util.List;

import com.dto.Member;
import com.dto.Scrap;

public interface ScrapService {

	public List<Scrap> selectMyScrap(Member member) throws Exception;

}
