package kr.or.ddit.headquarter.master.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class OnlineOrderMapperTest {

	@Autowired
	OnlineOrderMapper mapper;

	@Test
	void testSelectTotalRecord() {
		PaginationInfoOrder paging = new PaginationInfoOrder(10,5);
		paging.setPage(1);
		mapper.selectTotalRecord(paging);


	}

	@Test
	void testSelectMemOrderList() {
		PaginationInfoOrder paging = new PaginationInfoOrder(10,5);
		paging.setPage(1);
		List<MemorderDefaultVO> memOrderList = mapper.selectMemOrderList(paging);

		assertEquals(memOrderList.size(), 10);
	}

	@Test
	void testSelectMemOrderDt() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateDlvySttus() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectDlveringMemOrder() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateDlvySttusSuccess() {
		fail("Not yet implemented");
	}

}
