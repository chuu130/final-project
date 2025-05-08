package kr.or.ddit.main.login;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.main.mapper.EmployeeMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations="file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class MainLoginTest {

	@Autowired
	private EmployeeMapper mapper;
	
	@Test
	void test() {
		log.info("사원정보 : {}",mapper.selectEmployeeByName("emp1"));
	}

}
