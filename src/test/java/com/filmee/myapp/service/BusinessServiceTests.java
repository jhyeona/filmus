package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.After;
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
public class BusinessServiceTests {
	
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
	

    @After
    public void tearDown() {
       log.debug("tearDown() invoked.");

    } // tearDown

	
}//end class
