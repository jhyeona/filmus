package com.filmee.myapp.controller;

import java.io.File; 
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Objects;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.FileVO;
import com.filmee.myapp.domain.PageDTO;
import com.filmee.myapp.service.BoardService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board/")
@Controller
public class BoardController {

	@Autowired private BoardService service;
	
	@GetMapping("list")
	public String list(@ModelAttribute("cri")Criteria cri, Model model) {
		log.debug("list({},{}) invoked.",cri,model);
		Objects.requireNonNull(service);
		
		List<BoardVO> list = this.service.getList(cri);
		PageDTO page = new PageDTO(cri, this.service.getTotal(cri));
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",page);
		return "board/list";
	}//list
	
	
	@GetMapping({"get","modify"})
	public void get(
			@ModelAttribute("cri") Criteria cri, 
			@RequestParam("bno") Integer bno, 
			Model model
		) {
		log.debug("get({},{},{})invoked.",cri,bno,model);
		Objects.requireNonNull(service);
		
		BoardVO board = this.service.get(bno);
		log.info("\t+ board:{}",board);
		model.addAttribute("board",board);
	}//get
	
	
	@PostMapping("modify")
	public String modify(@ModelAttribute("cri")Criteria cri,BoardVO board, RedirectAttributes rttrs) {
		log.debug(" >>> modify({},{},{}) invoked.",cri,board,rttrs);
		Objects.requireNonNull(service);
		
		boolean isModified = this.service.modify(board);

		if(isModified) {
			log.info(">> if> ismodified");
			rttrs.addAttribute("result","modified");
		}//if
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
		
		return "redirect:/board/list";
	}//modify
	
	
	@GetMapping("register")
	public void register(@ModelAttribute("cri")Criteria cri) {
		log.debug("GetMapping register({}) invoked.",cri);
	}//register
	
	@PostMapping(path = "register", consumes = {"multipart/form-data"})
	public String register(@ModelAttribute("cri")Criteria cri,  BoardVO board, RedirectAttributes rttrs,
			@RequestPart MultipartFile files) throws IllegalStateException, IOException {
		log.debug("asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfas");
		log.debug("register({},{},{}) invoked",board,rttrs,files);
		Objects.requireNonNull(service); 
		log.info(">> requireNonNull");
		FileVO file = new FileVO();
		
		if(files.isEmpty()) {
			
			this.service.register(board);
			log.info(">> done if >> register");

		} else {
			String fileName=files.getOriginalFilename();
			String fileNameExtension=FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl="C:/Temp/upload";
			String mimeType=files.getContentType();
			
			do {
	            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
	            destinationFile = new File(fileUrl+ destinationFileName);
			} while (destinationFile.exists());
			
			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);
			
			this.service.register(board);
			file.setBno(272);
			file.setFname(fileName);
			file.setUuid(destinationFileName);
			file.setPath(fileUrl);
			file.setMime(mimeType);
			
			this.service.fileInsert(file);
		}//if-else

		rttrs.addAttribute("result",board.getBno());
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
		rttrs.addAttribute("file", file.getFno());

		return "redirect:/board/list";
	}//register
	
	@PostMapping("remove")
	public String remove(
			@ModelAttribute("cri")Criteria cri,
			@RequestParam("bno") Integer bno, 
			RedirectAttributes rttrs) {
		log.debug("remove({},{},{}) invoked.",cri,bno,rttrs);
		
		if(this.service.remove(bno)) {
			rttrs.addAttribute("result","removed");
		}//if
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
		
		return "redirect:/board/list";
	}//remove

	
	
}//end class
