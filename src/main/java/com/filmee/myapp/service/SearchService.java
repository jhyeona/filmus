package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.SearchFilmVO;


public interface SearchService {
	
	public abstract List<SearchFilmVO> searchFilmAutoComplete(String filmTitle);

} //end interface
