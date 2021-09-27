package com.filmus.myapp.service;

import java.util.List;

import com.filmus.myapp.domain.CriteriaSearch;
import com.filmus.myapp.domain.SearchFilmGenreVO;
import com.filmus.myapp.domain.SearchFilmInfoVO;
import com.filmus.myapp.domain.SearchFilmVO;
import com.filmus.myapp.domain.SearchPeopleVO;
import com.filmus.myapp.domain.SearchUserVO;


public interface SearchService {
	
	public abstract List<SearchFilmVO> searchFilmAutoComplete(String filmTitle);
	
	public abstract List<SearchUserVO> searchUserAutoComplete(String nickname);
	
	public abstract List<SearchFilmVO> getFilmListPage(CriteriaSearch cri);
	
	public abstract List<SearchFilmInfoVO> getFilmListInfo(CriteriaSearch cri);
	
	public abstract List<SearchFilmGenreVO> getFilmListGenre(CriteriaSearch cri);
	
	public abstract List<SearchUserVO> getUserListPage(CriteriaSearch cri);
	
	public abstract int getTotalCountFilmSearch(CriteriaSearch cri);
	
	public abstract int getTotalCountUserSearch(CriteriaSearch cri);

	public abstract List<SearchPeopleVO> serachFilmsByPeopleId(String peopleId);
} //end interface