package com.filmus.myapp.service;

import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.filmus.myapp.domain.ReviewCommentDTO;
import com.filmus.myapp.domain.ReviewDTO;

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
public class ReviewServiceTests {
	
	@Autowired private ReviewService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.service);
	}//setup
	
	@Test
	public void testReviewDetail() {
		log.debug("testReviewDetail() invoked.");
		
		this.service.reviewDetail(63,299534);
	}//testReviewDetail
	
	@Test
	public void testModReview() {
		log.debug("testModReview() invoked.");
		
		ReviewDTO dto = new ReviewDTO();
		dto.setContent("업데이트");
		dto.setRate(5.0);
		dto.setRno(62);
		
		this.service.modReview(dto);
	}//testReviewDetail
	
	@Test
	public void testDelReview() {
		log.debug("testDelReview() invoked.");
		
		this.service.delReview(101, 337404);
	}//testReviewDetail
	
	@Test
	public void testRCC() {
		log.debug("testRCC() invoked.");
		
		ReviewCommentDTO dto = new ReviewCommentDTO();
		dto.setContent("TEST COMMENT");
		dto.setWriter(146);
		dto.setRno(123);
		dto.setParentRcno(21);
		
		this.service.rcCreate(dto);
	}//testReviewDetail
	
	@Test
	public void testRCR() {
		log.debug("testRCC() invoked.");
		
		this.service.rcList(123);
	}//testReviewDetail
	
	@Test
	public void testRCU() {
		log.debug("testRCC() invoked.");
		
		ReviewCommentDTO dto = new ReviewCommentDTO();
		dto.setContent("TEST COMMENT22");
		dto.setRcno(8);
		
		this.service.rcModify(dto);
	}//testReviewDetail
	
	@Test
	public void testRCD() {
		log.debug("testRCC() invoked.");
		
		this.service.rcDelete(11,123);
	}//testReviewDetail	
	
	@Test
	public void testReviewLike() {
		log.debug("testRCC() invoked.");
		
		this.service.reviewLike(123, 101);
	}//testReviewDetail
	
	@Test
	public void testReviewUnLike() {
		log.debug("testRCC() invoked.");
		
		this.service.reviewUnLike(123, 101);
	}//testReviewDetail
	
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//tearDown
	

}//end class
