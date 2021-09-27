package com.filmus.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.filmus.myapp.domain.FilmDetailVO;
import com.filmus.myapp.domain.FilmInfoReactionVO;
import com.filmus.myapp.domain.FilmPeopleVO;
import com.filmus.myapp.domain.FilmReviewDTO;
import com.filmus.myapp.domain.FilmReviewVO;
import com.filmus.myapp.mapper.FilmMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class FilmServiceImpl 
		implements FilmService, InitializingBean {
	
	@Setter(onMethod_=@Autowired)
	private FilmMapper mapper;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	@Transactional
	@Override
	public Map<String, Object> showFilmInfo(String filmId) {
		log.debug("showFilmInfo({}) invoked", filmId);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		//영화 정보 가져오기
		FilmDetailVO filmDetail = this.mapper.getFilmDetail(filmId);
		log.info(filmDetail);
		resultMap.put("filmDetail", filmDetail);
		
		//영화 감독, 출연진 정보 가져오기
		List<FilmPeopleVO> filmPeople = this.mapper.getFilmPeople(filmId);
		filmPeople.forEach(log::info);
		
		List<FilmPeopleVO> director = new ArrayList<>();
		List<FilmPeopleVO> cast = new ArrayList<>();
		
		filmPeople.forEach(t -> {
			if(t.getCreditOrder() != null) {
				cast.add(t);
			} else {
				director.add(t);
			}//if-else
		});
		
//		log.info("director>>>>>>>>>>>>>>>>>>>>>>>>>>");
//		director.forEach(log::info);
//		log.info("cast>>>>>>>>>>>>>>>>>>>>>>>>>>");
//		cast.forEach(log::info);
		
		filmPeople.clear();
		
		resultMap.put("director", director);
		resultMap.put("cast", cast);
		
		return resultMap;
	}//showFilmInfo
	
	@Override
	public List<FilmReviewVO> getReviewList(Map<String, Object> params) {
		log.debug("getReviewList({}) invoked.", params);
		
		return this.mapper.getReviews(params);
	}//getReviewList

	@Override
	public int getTotal(Map<String, Object> params) {
		log.debug("getTotal({}) invoked.", params);
		
		return this.mapper.getTotalCount(params);
	}//getTotal

	@Override
	public int registerReview(FilmReviewDTO dto) {
		log.debug("registerReview({}) invoked.", dto);

		return this.mapper.insertReview(dto);							
	}//registerReview

	@Override
	public List<Integer> getFilmReactionOfUser(String userId, String filmId) {
		log.debug("getFilmReactionOfUser({}, {}) invoked.", userId, filmId);
		
		return this.mapper.getFilmReactionOfUser(userId, filmId);
	}//getFilmReactionOfUser

	@Override
	public FilmInfoReactionVO getFilmReactionOfThis(String filmId) {
		log.debug("getFilmReactionOfThis ({}) invoked.", filmId);
		
		return this.mapper.getFilmReactionOfThis(filmId);
	}//getFilmReactionOfThis

	@Override
	public int addFilmReactionOfUser(String userId, String filmId, Integer code) {
		log.debug("addFilmReactionOfUser ({}, {}, {}) invoked.", userId, filmId, code);
		
		return this.mapper.InsertFilmReactionOfUser(userId, filmId, code);
	}//addFilmReactionOfUser

	@Override
	public int removeFilmReactionOfUser(String userId, String filmId, Integer code) {
		log.debug("removeFilmReactionOfUser ({}, {}, {}) invoked.", userId, filmId, code);

		return this.mapper.DeleteFilmReactionOfUser(userId, filmId, code);
	}//removeFilmReactionOfUser
	
}//end class
