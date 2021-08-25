package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.BoardCommentVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class BoardCommentServiceTests {

	@Autowired private BoardCommentService service;
	
	@Before
	public void setup() {
		log.debug(">> setup() invoked.");
		Objects.requireNonNull(this.service);
	}//setup
	
	@Test
	public void testGetList() {
		log.debug(">> testGetList() invoked.");
		List<BoardCommentVO> list = this.service.getList(171);
		list.forEach(log::info);
	}//testGetList
	
	@Test
	public void testRegister() {
		log.debug(">> testRegister() invoked.");
		
		BoardCommentVO comment = new BoardCommentVO(null, 170, 1, "내가 쓴 댓글이다", null, null, null, null);
		if(this.service.register(comment)) {
			log.info(" >> register success ");
		}//if
	}//testRegister
	
	@Test
	public void testModify() {
		log.debug(">> testModify() invoked.");
		
		BoardCommentVO comment = new BoardCommentVO(14, null, 	1, "잘 보고 갑니당", null, null, null, null);
		this.service.modify(comment);
	}//testModify
	
	@Test
	public void testRemove() {
		log.debug(">> testRemove() invoked.");
		
		if(this.service.remove(14)) {
			log.debug(">> remove success");
		}//if
	}//testRemove
	
}//end class
