package com.filmee.myapp.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComPageDTO;
import com.filmee.myapp.domain.ComplaintVO;
import com.filmee.myapp.service.ComplaintService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/complaint/")
@Controller
public class ComplaintController
   implements InitializingBean{

   @Setter(onMethod_= @Autowired)
   private ComplaintService service;
   
   @Override
   public void afterPropertiesSet() throws Exception {
	   log.debug("afterPropertiesSet() invoked.");
	   
	   Objects .requireNonNull(service);
	   
	   log.info("\t+ service : {}", service);
	   
   }//afterPropertiesSet
     

   
   @PostMapping("register")
   public String regeister(ComplaintVO complaint,RedirectAttributes rttrs) {
	   log.debug("register({},{}) invoked", complaint,rttrs) ;
	   
	   
	   boolean isRegister = this.service.register(complaint);
		if(isRegister) {	//요청 성공일 때
			rttrs.addAttribute("result", "success");
		}//if
//     return "/complaint/register";
     return "redirect:/complaint/register";
   }//regeister
   
   
   @GetMapping("register")
   public void regeister() {
	   log.debug("register({}) invoked") ;
	   
   }//regeister

   @GetMapping("list")
	public String list(Model model) {
		log.debug("list({}) invoked.", model);
		
		List<ComplaintVO> complaint = this.service.getList();
		
		assert complaint != null;
		
		complaint.forEach(log::info);
		
		model.addAttribute("list", complaint);
		return "complaint/mgr";
	}//list


   @GetMapping("listPerPage")
	public String listPerPage(
			@ModelAttribute("cri")	// 아래의 매개변수를 model.addAttribute한 것과 같음. 이름은 cri
			ComCriteria cri,	//command object -> 자동으로 request scope에 올라간다. 이름은 criteria
			Model model
			) {
		log.debug("listPerPage({},{}) invoked.",cri, model);
		
		List<ComplaintVO> complaint = this.service.getListPerPage(cri);
		
		Objects.requireNonNull(complaint);
		complaint.forEach(log::info);
		
		ComPageDTO pageDTO = new ComPageDTO(cri,this.service.getTotal(cri));
		
		model.addAttribute("list", complaint);
		model.addAttribute("pageMaker", pageDTO);
		
		return "complaint/mgr";
	}//listPerPAge
	
	@GetMapping( "get" )
	public void get(
			@ModelAttribute("cri") ComCriteria cri,
			@RequestParam("compno") Integer compno, 
			Model model
			) {
		log.debug("get({}, {}, {}) invoked.", cri, compno, model);
		
		ComplaintVO complaint = this.service.get(compno);
		
		assert complaint != null;
		
		log.info("\t+ board : {}", complaint);
		
		model.addAttribute("complaint", complaint);
	}//get
	
	@PostMapping("remove")
	public String remove(
			@ModelAttribute("cri") ComCriteria cri,
			@RequestParam("compno") Integer compno,
			RedirectAttributes rttrs
			) {
		log.debug("remove({}, {}, {}) invoked.", cri, compno, rttrs);
		
		this.service.remove(compno);
	
		rttrs.addAttribute("currPage", cri.getCurrPage());
		rttrs.addAttribute("amount", cri.getAmount());
		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
		
		return "redirect:/complaint/mgr";
	}//remove
	

	
	
	@PostMapping("temporary")
	public String temporary(
			@ModelAttribute("cri") ComCriteria cri,
			ComplaintVO complaint,
			RedirectAttributes rttrs
			) {
		log.debug("temporary({}, {}, {}) invoked.", cri, complaint, rttrs);
		
		boolean isTemporary = this.service.temporary(complaint);
		
		if(isTemporary) {
			rttrs.addAttribute("result", "success");
		}//if
		
		rttrs.addAttribute("currPage", cri.getCurrPage());
		rttrs.addAttribute("amount", cri.getAmount());
		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());


		return "redirect:complaint/mgr";
	}
	
	@PostMapping("completion")
	public String completion(
			@ModelAttribute("cri") ComCriteria cri,
			ComplaintVO complaint,
			RedirectAttributes rttrs
			) {
		log.debug("completion({}, {}, {}) invoked.", cri, complaint, rttrs);
		
		boolean isCompletion = this.service.temporary(complaint);
		
		if(isCompletion) {
			rttrs.addAttribute("result", "success");
		}//if
		
		rttrs.addAttribute("currPage", cri.getCurrPage());
		rttrs.addAttribute("amount", cri.getAmount());
		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());


		return "redirect:/complaint/mgr";
	}
   

   




}