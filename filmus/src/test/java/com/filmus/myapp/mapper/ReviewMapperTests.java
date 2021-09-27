package com.filmus.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class ReviewMapperTests {
	
	@Autowired private ReviewMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.mapper);
	}//setup
	
	@Test
	public void testReviewDetail() {
		log.debug("testReviewDetail() invoked.");
		
		this.mapper.reviewDetail(63, 299534);
	}//testReviewDetail
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//tearDown
	

}//end class
