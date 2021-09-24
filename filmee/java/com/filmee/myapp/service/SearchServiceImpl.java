package com.filmee.myapp.service;


import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.mapper.SearchMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper mapper;

	@Override
	public List<SearchFilmVO> searchFilmAutoComplete(String filmTitle) {
		log.debug("searchFilmAutoComplete({}) invoked.", filmTitle);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getFilmList(filmTitle);
	} //searchFilmAutoComplete

} //end class
