package kr.or.ddit.market.common.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.tiles.request.Request;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class CommonHeaderMenuMapperTest {

	@Autowired
	CommonHeaderMenuMapper mapper;
	@Test
	void test() {
		List<Map<String, String>> menuList = mapper.selectCommnMenuList();
		Map<String,  Map<String, Object>> topmenuList = menuList
				.stream()
				.filter((m)->m.get("LVL").equals("1"))
				.collect(Collectors.toMap(m->m.get("CMMN_CODE_ID").toString(), m->{
					Map<String, Object> newMap = new HashMap<>();
					newMap.putAll(m);
					newMap.put("children", new ArrayList<Map<String, String>>());
					return newMap;
				}));
		menuList
			.stream()
			.filter((m)->m.get("LVL").equals("2"))
			.forEach(m->{
				String parent = m.get("CMMN_PRNT_CODE");
				Map<String, Object> parentmenu = (Map) topmenuList.get(parent);
				List<Map<String,String>> children = (List) parentmenu.get("children");
				children.add(m);

			});
		topmenuList.values().stream().sorted(Comparator.comparing(m->{
			return m.get("CMMN_CODE_ID").toString();
		})).collect(Collectors.toList()).forEach(m->log.info("{}", m));
	}

}
