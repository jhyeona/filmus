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
public class FilmServiceTests {

	@Autowired
	private FilmService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.service);
	}
	
	@Test
	public void testShowFilmInfo() {
		log.debug("testShowFilmInfo() invoked.");
		
		this.service.showFilmInfo("299534");
	}
	
	@Test
	public void testGetFilmReactionOfUser() {
		log.debug("testGetFilmReactionOfUser() invoked.");
		
		this.service.getFilmReactionOfUser("146", "299534");
	}
	
	@Test
	public void testGetFilmReactionOfThis() {
		log.debug("testGetFilmReactionOfThis() invoked.");
		
		this.service.getFilmReactionOfThis("299534");
	}
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}
	
}//end class
