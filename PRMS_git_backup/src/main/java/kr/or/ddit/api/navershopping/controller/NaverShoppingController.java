package kr.or.ddit.api.navershopping.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.api.navershopping.util.NaverShopSearch;
import kr.or.ddit.vo.SearchItemVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/naver")
@RequiredArgsConstructor
public class NaverShoppingController {

	private final NaverShopSearch naverShopSearch;

	@GetMapping("shoppingform")
	public String naverShoppingUI() {
		return "market:/naver/shoppingform";
	}

	@GetMapping("shopping/list")
    public String getItems(
    		@RequestParam String searchValue
    		,@RequestParam Integer startNumber
    		,Model model
    ){

        String resultString = naverShopSearch.search(searchValue, startNumber);

        List<SearchItemVO> searchItemList = naverShopSearch.fromJSONtoItems(resultString);


        for(SearchItemVO item : searchItemList) {
        	String title = item.getTitle();
        	String title2 = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
        	String title3 = title2.replaceAll("&amp;", "&");
        	System.out.println(title3);
        }
        for(SearchItemVO item : searchItemList) {
        	System.out.println(item.getProductId());
        }
        for(SearchItemVO item : searchItemList) {
        	System.out.println(item.getImage());
        }
        for(SearchItemVO item : searchItemList) {
        	System.out.println(item.getLprice());
        }
        model.addAttribute("searchItemList", searchItemList);

        return "market:/naver/shoppingform";
    }

}
