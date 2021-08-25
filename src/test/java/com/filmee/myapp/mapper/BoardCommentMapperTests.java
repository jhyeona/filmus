package com.filmee.myapp.mapper;

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
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class BoardCommentMapperTests {

	@Autowired private BoardCommentMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		Objects.requireNonNull(this.mapper);
	}
	
	@Test
	public void testInsert() {
		log.debug("test() invoked.");
		BoardCommentVO comment = new BoardCommentVO(
				null, 
				171, 
				1, 
				"테스트해보았따!",
				null,
				null,
				null,
				null);
		int ok = this.mapper.insert(comment);
		log.info(">>> insert OK: {}",ok);
		
	}//testInsert
	
	@Test
	public void testRead() {
		log.debug("testRead() invoked.");
		List<BoardCommentVO> vo = this.mapper.read(171);
		vo.forEach(log::info);
	}//testRead
	
	@Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		
		int ok = this.mapper.delete(12);
		log.info(">>>OK:{}",ok);
	}//testDelete
	
	@Test
	public void testUpdate() {
		log.debug("testUpdate()invoked.");
		BoardCommentVO vo = new BoardCommentVO(
				4, 
				null, 
				null, 
				"오늘너무졸립다",
				null,
				null,
				null,
				null
				);
		log.info("OK:"+this.mapper.update(vo));
		
	}//testUpdate
	
}//end class
