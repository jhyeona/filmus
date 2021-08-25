package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	})
public class BoardServiceTests {
	
	@Autowired BoardService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		Objects.requireNonNull(this.service);
	}//setup
	
	
	@Test
	public void testGetList() {
		log.debug("testGetList() invoked.");
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
		cri.setAmount(20);
		List<BoardVO> list = this.service.getList(cri);
		list.forEach(log::info);
		list.clear();
		list=null;
	}//testGetList
	
	@Test
	public void testGetTotal() {
		log.debug("testGetTotal() invoked.");
		
		Criteria cri = new Criteria();
		log.info(" >>> total:{}",this.service.getTotal(cri));
	}//testGetTotal
	
	@Test
	public void testGet() {
		log.debug("testGetList() invoked.");
		
		BoardVO board = this.service.get(100);
		
		log.info("board:{}",board);
	}//testGetList
	
	@Test
	public void testRegister() {
		log.debug("testRegister() invoked.");
		
		BoardVO board = new BoardVO(				
				null, 
				null, 
				1, 
				"테스트클래스", 
				"테스트 성공",
				null,
				null, 
				null, 
				null, 
				null);
		if(this.service.register(board)) {
			log.info("board:{}",board);
		}//if
		
	}//testRegister
	
	@Test
	public void testModify() {
		log.debug("testModify() invoked.");
		BoardVO board = new BoardVO(				
				20, 
				null, 
				1, 
				"수정했습니다.", 
				"modify test success.",
				null,
				null, 
				null, 
				null, 
				null);
		if(this.service.modify(board)) {
			log.info("board:{}",board);
		}//if
	}//testModify

	@Test
	public void testRemove() {
		log.debug("testRemove() invoked.");
		
		if(this.service.remove(10)) {
			log.debug(" >> remove success <<");
		}//if
	}//testRemove


}//end class
