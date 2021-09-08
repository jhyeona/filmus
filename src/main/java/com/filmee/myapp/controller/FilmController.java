package com.filmee.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewVO;
import com.filmee.myapp.service.FilmService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/film/")
@Controller
public class FilmController {
	 
	@Setter(onMethod_= @Autowired)
	private FilmService service;
	

//	@GetMapping("info")
//	public String getFilmInfo(@RequestParam("filmid") Integer film_id, Model model) {
	@GetMapping("/{filmid}")
	public String getFilmInfo(@PathVariable("filmid") Integer film_id, Model model) {
		log.debug("getFilmInfo({}, {}) invoked.", film_id, model);
		
		FilmVO filmVO = this.service.getFilmInfo(film_id);
		List<FilmPeopleVO> filmPeopleVOList = this.service.getFilmPeople(film_id);
		List<FilmGenreVO> filmGenreVOList = this.service.getGenre(film_id);
		
		assert filmVO != null;
		assert filmPeopleVOList != null;
		assert filmGenreVOList != null;
		
		// 일단 막아둠
//		log.info("\t+ filmVO: {}", filmVO);
//		filmPeopleVOList.forEach(log::info);
//		filmGenreVOList.forEach(log::info);
		
		
		model.addAttribute("filmVO", filmVO);
		model.addAttribute("filmPeopleVOList", filmPeopleVOList);
		model.addAttribute("filmGenreVOList", filmGenreVOList);
	
	
		return "film"; 
	} // getFilmInfo 
	

	//----------------------------------------------------//
	
//	@GetMapping({"/review/{rno}", "modify" })  // modify는 get 성공한뒤에 생각할거.....
	@GetMapping("/review/{rno}")
	public String getReview(
			@PathVariable("rno") Integer rno,
			@ModelAttribute("cri") CriteriaFilmReview cri,
			Model model
		) {
		log.debug("readReview({}, {}) invoked.", rno, model);
		
		
		ReviewFilmUserVO reviewVO = this.service.get(rno);
		
		assert reviewVO != null;
		log.info("\t+ reviewVO: {}", reviewVO);
				
		model.addAttribute("reviewVO", reviewVO);

		 
		return "review/get"; 
	} // getReview
//	https://letterboxd.com/writer/film/filmid/	첫번째 리뷰 URL
//	https://letterboxd.com/writer/film/filmid/1/  같은 영화에 리뷰를 또쓰면 이 URL
// film/filmid/rno 이렇게 할까.. 
	
	@PostMapping("/review/register/{filmid}")
	public String register(
			@PathVariable("filmid") Integer film_id,
			@ModelAttribute("cri") CriteriaFilmReview cri,
			ReviewVO review,
			RedirectAttributes rttrs
		) {
		log.debug("register({}, {}, {}, {}) invoked.", film_id,cri, review, rttrs);
		
		this.service.register(review);
		 
		rttrs.addFlashAttribute("result", review.getRno());
			
		rttrs.addAttribute("currPage", cri.getCurrPage());
		rttrs.addAttribute("amount", cri.getAmount());
		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
	
		return "review/register";
//		return "redirect:/film/{filmid}";    // 리뷰쓴 영화의 상세페이지나, 마이페이지의 리뷰페이지로 redirect
	} // registerReview
	
//	@GetMapping("/review/register/{filmid}")
//	public void register(@PathVariable("filmid") Integer film_id, @ModelAttribute("cri") Criteria cri) {	// Method overloading
//		log.debug("register({}, {}) invoked.",film_id,  cri);
//		
//	} // register

//	@GetMapping("list")
//	public void getReviewList(Integer film_id, Model model) {
//		log.debug("list({}) invoked.", model);
//		
//		List<ReviewVO> reviewList = this.service.getList(film_id);
//		
//		Objects.requireNonNull(reviewList);
//		reviewList.forEach(log::info);
//		
//		model.addAttribute("reviewList", reviewList);
//	} // getReviewList
//
//	@PostMapping("remove")
//	public String remove(
//			@ModelAttribute("cri") Criteria cri,
//			@RequestParam("rno") Integer rno,
//			RedirectAttributes rttrs
//		) {
//		log.debug("remove({}, {}) invoked.", rno, rttrs);
//		
//		int removedReview = this.service.remove(rno);
//		if(removedReview == 1) {	// 삭제성공 일 때
//			rttrs.addFlashAttribute("result", "success");
//		} // if
//
//		rttrs.addAttribute("currPage", cri.getCurrPage());
//		rttrs.addAttribute("amount", cri.getAmount());
//		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
//		
//		return "마이페이지-리뷰url";
//	} // remove
//	
//	@PostMapping("modify")
//	public String modify(
//			@ModelAttribute("cri") Criteria cri,
//			ReviewVO review,
//			RedirectAttributes rttrs) {
//		log.debug("modifyReview({}, {}) invoked.", review, rttrs);
//		
//		int modifiedReview = this.service.modify(review);
//		
//		if(modifiedReview == 1) {
//			rttrs.addFlashAttribute("result", "success");
//		} // if
//		
//		rttrs.addAttribute("currPage", cri.getCurrPage());
//		rttrs.addAttribute("amount", cri.getAmount());
//		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
//		
//		return "redirect:/film/modify";
//	} //modify
//	
//	@GetMapping("listPerPage")
//	public String listPerPage(
//			@ModelAttribute("cri")
//			Criteria cri,
//			Model model
//		) {
//		log.debug("listPerPage({}) invoked.", model);
//		
//		List<ReviewVO> reviewList = this.service.getListWithPaging(cri);
//		
//		Objects.requireNonNull(reviewList);
//		reviewList.forEach(log::info);
//		
//		PageDTO pageDTO = new PageDTO(cri, this.service.getTotalCount(cri));
//		
//		model.addAttribute("reviewList", reviewList);
//		model.addAttribute("pageMaker", pageDTO);
//		
//		return "film/list";
//	} // listPerPage

} // end class
