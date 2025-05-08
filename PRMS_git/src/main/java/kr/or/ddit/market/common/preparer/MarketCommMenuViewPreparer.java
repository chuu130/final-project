package kr.or.ddit.market.common.preparer;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.market.common.mapper.CommonHeaderMenuMapper;

public class MarketCommMenuViewPreparer implements ViewPreparer {

	@Autowired
	private CommonHeaderMenuMapper menuMapper;


	@Override
	public void execute(Request req, AttributeContext atrCtx) {
		Map<String, Object> requestScope = req.getContext(Request.REQUEST_SCOPE);
		List<Map<String, String>> menuList = menuMapper.selectCommnMenuList();
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
		List<Map<String, Object>> finalList = topmenuList.values().stream().sorted(Comparator.comparing(m->{
			return m.get("CMMN_CODE_ID").toString();
		})).collect(Collectors.toList());
		requestScope.put("menuList", finalList);
	}

}
