package kr.or.ddit.market.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.market.member.service.centerQnaMarketService;

@Controller
@RequestMapping("/market/member")
public class CenterQnamergeController {

    @Autowired
    private centerQnaMarketService centerService;

    @Autowired
    private QnaService answerService;
    
//    나중에 합친거 ui 보여줄때 사용 /방식바꿈
//    @GetMapping("/centerMarketList")
//    public String formUI() {
//    	
//    	return "market:/center/centerMarketList";
//    }
    
    	
   
//    @GetMapping(value = "/centerMarketList", produces = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseBody  
//    public List<CenterDefaultVO> centerformData() {
//        List<CenterDefaultVO> centerQnaList = centerService.retrieveAllCenterBoard();
//        List<QnaanswerDefaultVO> answerList = answerService.retrieveAllQnaBoard();
//        
//        Map<String, List<?>> responseData = new HashMap<>();
//        responseData.put("centerQnaList", centerQnaList);
//        responseData.put("answerList", answerList);
//	      List<CenterDefaultVO> centerList = centerService.retrieveAllMergeBoard();
//	    	
//	      return centerList;
//    }
	
    
    // 데이터 교차로 병합
//    private List<Object> mergeData(List<CenterDefaultVO> centerData, List<QnaanswerDefaultVO> answerData) {    
//        List<Object> mergedData = new ArrayList<>();
//        int centerIndex = 0;
//        int answerIndex = 0;
//
//        while (centerIndex < centerData.size() || answerIndex < answerData.size()) {
//            if (centerIndex < centerData.size()) {
//                mergedData.add(centerData.get(centerIndex++));
//            }
//            if (answerIndex < answerData.size()) {
//                mergedData.add(answerData.get(answerIndex++));
//            }
//        }
//
//        return mergedData;
//    }
}