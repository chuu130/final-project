package kr.or.ddit.market.nonmember.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.util.ArrayList;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 회원가입 진행 테스트코드
 * @author jbk
 *
 */
@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Transactional
class MemberMapperTest {

	@Autowired
	MemberMapper mapper;

	MemberDefaultVO member;
	MemberaddressDefaultVO memberAddress;

	@BeforeEach
	void beforeEach() {
		// 신규회원정보 입력
		member = new MemberDefaultVO();
		memberAddress = new MemberaddressDefaultVO();

		member.setMemId("test1");
		member.setMemPassword("java");
		member.setMemNm("테스트1");
		member.setMemImage(null);
		member.setMemTelno("010-1122-3344");
		member.setMemBirthdy(LocalDate.now());
		member.setMemEmail("test1@naver.com");

		// 회원배송지 입력
		memberAddress.setMemZip("04170");
		memberAddress.setMemAdres1("서울특별시 마포구 도화동");
		memberAddress.setMemAdres2("109동 304호");
	}

	@Test
	void testInsertMember() {
		assertEquals(1, mapper.insertMember(member));
	}

	@Test
	void testInsertMemberAddress() {
		memberAddress.setMemNo("M000000001");
		assertEquals(1, mapper.insertMemberAddress(memberAddress));
	}

}
