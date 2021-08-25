package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

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
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	@Autowired private BoardMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		assertNotNull(this.mapper);
		log.info("mapper:{}",mapper);
	}//setup

	@Test
	public void testGetList() {
		log.debug("testGetList() invoked.");
		Criteria cri = new Criteria();
		List<BoardVO> board = this.mapper.getList(cri);
		board.forEach(log::info);
	}//testGetList
	
	@Test
	public void testSelect() {
		log.debug("testSelect() invoked.");
		
		BoardVO board = this.mapper.select(10);
		log.info("select: {}",board);
	}//testSelect
	
	@Test
	public void testInsertSelectKey() {
		log.debug("testInsertSelectKey() invoked.");
		
		BoardVO vo = new BoardVO(
				null, 
				null, 
				1, 
				"테스트클래스", 
				"테스트 성공",
				null,
				null, 
				null, 
				null, 
				null
				
				);
		int affectedLines = this.mapper.insertSelectKey(vo);
		log.info("success: {}", affectedLines);
		log.info("insert:{}",vo);
	}//testInsertSelectKey
	
	@Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");

		BoardVO vo = new BoardVO(
				14, 
				null, 
				1, 
				"업데이트 테스트", 
				"테스트 성공",
				null,
				null, 
				null, 
				null, 
				null
				
				);
		
		int al = this.mapper.update(vo);
		log.info("success:{}",al);
		log.info("update:{}",vo);
	}//testUpdate
	
	@Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		
		if(this.mapper.delete(12)==1) {
			log.info(">> delete Success. <<");
		};
	}//testDelete
	
	@Test
	public void testGetTotalCount() {
		log.debug("testGetTotalCount() invoked.");
		
		Criteria cri = new Criteria();
		int total = this.mapper.getTotalCount(cri);
		
		log.info(">>>total: {}",total);
	}//testGetTotalCount
	
}//end class
