package kr.or.ddit.market.common.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.headquarter.master.mapper.ReviewMapper;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class ReviewMapperTest {
	
	@Autowired
	ReviewMapper mapper;

	@Test
	void testSelectReviewList() {
		mapper.selectReviewList();
	}

	@Test
	void testSelectByPrimaryKey() {
		mapper.selectByPrimaryKey("1");
	}

}
