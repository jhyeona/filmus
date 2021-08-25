package com.filmee.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.service.BoardCommentService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/comment/")
@Controller
public class BoardCommentController {

	@Autowired BoardCommentService service;
//	
//	@PostMapping("new")
//	public ResponseEntity<String> create(@RequestBody BoardCommentVO comment) {
//		log.debug(">> create({}) invoked.",comment);
//		
//		log.info("\t >>BoardCommentVO : {}", comment);
//		boolean is = service.register(comment);
//		return is==true ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//	}//create
	
	@GetMapping("/get")
	public String getList(Integer bno, Model model) {
		log.debug(">> getList() invoked.");
		
		List<BoardCommentVO> list = service.getList(bno);
		model.addAttribute("get", service.getList(bno));
		
		return "comment/get";
	}//getList
	
}//end class
