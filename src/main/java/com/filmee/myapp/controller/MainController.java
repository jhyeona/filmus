package com.filmee.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/main")
@Controller
public class MainController {

	@GetMapping("")
	public void main() {
		log.debug("main() invoked.");
		
	}
}
