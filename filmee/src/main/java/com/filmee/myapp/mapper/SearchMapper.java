package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.SearchFilmVO;


public interface SearchMapper {
	
	public abstract List<SearchFilmVO> getFilmList(String filmTitle);

} //end interface
