package com.filmee.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.service.SearchService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/search/")
@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	
	@GetMapping("header")
	public void header() {
		;;
	} //header
	
	@PostMapping("searchFilmAutoComplete")
	@ResponseBody
	public List<SearchFilmVO> searchFilmAutoComplete(String filmTitle) {
		log.debug("searchFilmAutoComplete({}) invoked.", filmTitle);
		
		List<SearchFilmVO> listFilm = this.service.searchFilmAutoComplete(filmTitle);
		
		return listFilm;
	} //searchFilmAutoComplete

} //end class
