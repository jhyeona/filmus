package com.filmus.myapp.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmus.myapp.domain.AdminUserPageDTO;
import com.filmus.myapp.domain.Criteria;
import com.filmus.myapp.domain.FilmInfoReactionVO;
import com.filmus.myapp.domain.FilmReviewDTO;

import com.filmus.myapp.domain.ReviewCommentDTO;
import com.filmus.myapp.domain.ReviewCommentVO;
import com.filmus.myapp.domain.ReviewDTO;
import com.filmus.myapp.domain.ReviewVO;
import com.filmus.myapp.domain.UserVO;

import com.filmus.myapp.domain.FilmReviewVO;
import com.filmus.myapp.service.FilmService;
import com.filmus.myapp.service.ReviewService;

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
	@Setter(onMethod_= @Autowired)
	private ReviewService rSerice;
	
	@GetMapping("{filmId}")
	public String filmInfo(@PathVariable("filmId") String filmId,
						   @ModelAttribute("cri")Criteria cri,
						   Model model) {
		log.debug("filmInfo({}, {}) invoked.", filmId, cri);
		
		cri.setAmount(5);
		
		Map<String, Object> filmInfo = this.service.showFilmInfo(filmId);
		
		Map<String, Object> params = new HashMap<>();
		params.put("filmId", filmId);
		params.put("currPage", cri.getCurrPage());
		params.put("amount", cri.getAmount());
		params.put("pagesPerPage", cri.getPagesPerPage());
			
		List<FilmReviewVO> reviews  = this.service.getReviewList(params);

		AdminUserPageDTO pageDTO = new AdminUserPageDTO(cri,this.service.getTotal(params));
		
		model.addAttribute("filmDetail", filmInfo.get("filmDetail"));
		model.addAttribute("director", filmInfo.get("director"));
		model.addAttribute("cast", filmInfo.get("cast"));
		model.addAttribute("reviews", reviews);
		model.addAttribute("pageMaker", pageDTO);

		
		return "film/filmInfo";
	}//filmInfo

	@GetMapping({"{filmId}/review/{rno}"})
	public String getReview(@PathVariable("rno") Integer rno, @PathVariable("filmId") Integer filmId, Model model, HttpServletRequest req) {
		log.debug("getReview() invoked.");

		HttpSession session = req.getSession();
		
		ReviewVO review = this.rSerice.reviewDetail(rno, filmId);
		List<ReviewCommentVO> list = this.rSerice.rcList(rno);
		
		UserVO user = (UserVO) session.getAttribute("__LOGIN__");
		
		if(user == null) {
			model.addAttribute("likeCheck", 2);
		} else {
			int like = this.rSerice.reviewLikeCheck(rno, user.getUserId());
			
			model.addAttribute("likeCheck", like);
		} //if-else
		
		model.addAttribute("list", list);
		model.addAttribute("review", review);
		
		return "film/review";
	}//getReview
	
	
	//----------------------//
	//      Review   		//
	//----------------------//	
	@PostMapping("regReview")
	public String regReview(FilmReviewDTO dto, RedirectAttributes rttrs) {
		log.debug("regReview({}) invoked.", dto);
	
		if(this.service.registerReview(dto) == 1) {
			rttrs.addFlashAttribute("message", "review_completed");
			return "redirect:/film/"+dto.getFilmId();
		} else {
			return "/errorPage";
		}//if-else
		
	}//regReview

	@PostMapping("modReview")
	public String modReview(ReviewDTO dto) {
		log.debug("modReview({})invoked.", dto);
		
		if(this.rSerice.modReview(dto)==1) {
			return "redirect:/film/"+dto.getFilmId()+"/review/"+dto.getRno();			
		} else {
			return "/errorPage";
		}//if-else
	}//modReview
	
	@PostMapping("delReview")
	public String delReview(Integer rno, Integer filmId, RedirectAttributes rttrs) {
		log.debug("delReview({},{})invoked.", rno, filmId);
		
		if(this.rSerice.delReview(rno,filmId)==1) {
			rttrs.addFlashAttribute("message","review deleted");
			return "redirect:/film/"+filmId;			
		} else {
			return "/errorPage";
		}//if-else
	}//delReview
	
	
	//----------------------//
	//   review reply		//
	//----------------------//
	@PostMapping("newReply")
	public String newReply(ReviewCommentDTO dto, Integer filmId, Integer rno) {
		log.debug("newReply({},{},{})invoked.",dto,filmId,rno);
		
		log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>" + dto.getContent());

		if(this.rSerice.rcCreate(dto)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//newReply
	
	@PostMapping("newChildReply")
	public String newChildReply(ReviewCommentDTO dto, Integer filmId, Integer rno) {
		log.debug("newChildReply({},{},{})invoked.",dto,filmId,rno);

		if(this.rSerice.rcChildCreate(dto)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//newChildReply
	
	
	@PostMapping("delReply")
	public String delReply(Integer rcno, Integer filmId, Integer rno) {
		log.debug("delReply({},{},{})invoked.",rcno,filmId,rno);

		if(this.rSerice.rcDelete(rcno, rno)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//newReply
	
	@PostMapping("modReply")
	public String modReply(ReviewCommentDTO dto, Integer filmId, Integer rno) {
		log.debug("modReply({},{},{})invoked.",dto,filmId,rno);

		if(this.rSerice.rcModify(dto)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//newReply
	
	
	//----------------------//
	//   review like		//
	//----------------------//
	@PostMapping("reviewLike")
	public String reviewLike(Integer rno, Integer userId, Integer filmId) {
		log.debug("reviewLike({},{},{})invoked.", rno,userId,filmId);
		
		if(this.rSerice.reviewLike(rno, userId)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//reviewLike

	@PostMapping("reviewUnlike")
	public String reviewUnLike(Integer rno, Integer userId, Integer filmId) {
		log.debug("reviewLike({},{},{})invoked.", rno,userId,filmId);
		
		if(this.rSerice.reviewUnLike(rno, userId)==1) {
			return "redirect:/film/"+filmId+"/review/"+rno;
		} else {
			return "/errorPage";
		}//if-else
	}//reviewUnLike

	@ResponseBody
	@GetMapping("getFilmReaction")
	public Map<String, Object> getFilmReaction(String userId, String filmId){
		log.debug("getFilmeaction({}, {}) invokedd", userId, filmId);
		
		Map<String, Object> result = new HashMap<>();
		
		FilmInfoReactionVO filmReaction = this.service.getFilmReactionOfThis(filmId);
		result.put("favoriteCnt", filmReaction.getFavorite());
		result.put("watchedCnt", filmReaction.getWatched());
		result.put("wishToWatchCnt", filmReaction.getWishToWatch());
		
		if(userId != null) {
			List<Integer> userReaction = this.service.getFilmReactionOfUser(userId, filmId);			
			result.put("userReaction", userReaction);
		}//if
				
		return result; 
	}//getFilmReaction
	
	@ResponseBody
	@PostMapping("addReaction")
	public Integer addReaction(String userId, String filmId, Integer code) {
		log.debug("addReaction({}, {}, {}) invoked.", userId, filmId, code);	
		
		int aLine = this.service.addFilmReactionOfUser(userId, filmId, code);
		log.info("result : ", aLine);
		
		return aLine;			
	}//addReaction
	
	@ResponseBody
	@PostMapping("removeReaction")
	public Integer removeReaction(String userId, String filmId, Integer code) {
		log.debug("removeReaction({}, {}, {}) invoked.", userId, filmId, code);
		
		int aLine = this.service.removeFilmReactionOfUser(userId, filmId, code);
		log.info("result : ", aLine);
		
		return aLine;			
	}//addReaction
		
} // end class