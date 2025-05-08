package kr.or.ddit.headquarter.master.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.headquarter.common.service.AdminInvService;
import kr.or.ddit.headquarter.master.service.AdminExpService;
import kr.or.ddit.headquarter.master.service.PartProdService;
import kr.or.ddit.headquarter.master.service.WarehousingService;
import kr.or.ddit.vo.def.AdminexpDefaultVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.PartprodDefaultVO;
import kr.or.ddit.vo.def.WarehousingDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/master")
public class PartProdController {
	@Autowired
	private PartProdService service;
	@Autowired
	private WarehousingService Wservice;
	@Autowired
	private AdminInvService Invservice;
	@Autowired
	private AdminExpService adminexpService;

	@GetMapping("partprodList.do")
	public String prodList(@RequestParam(required = false, defaultValue = "1") int page
							, Model model
							, @ModelAttribute("condition") SimpleCondition simpleCondition) {
	    PaginationInfo paging = new PaginationInfo();
	    paging.setPage(page);
	    paging.setSimpleCondition(simpleCondition);

	    List<PartprodDefaultVO> list = service.selectPartProdListPaging(paging);
	    for(PartprodDefaultVO partVO : list) {
	    	if(partVO.getPartprodSe().equals("COMN05DT001")) {
	    	    partVO.setPartprodSe("강아지사료");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT002")) {
	    	    partVO.setPartprodSe("강아지간식");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT003")) {
	    	    partVO.setPartprodSe("강아지옷");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT004")) {
	    	    partVO.setPartprodSe("강아지하네스");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT005")) {
	    	    partVO.setPartprodSe("강아지목줄");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT006")) {
	    	    partVO.setPartprodSe("강아지배변패드");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT007")) {
	    	    partVO.setPartprodSe("강아지샴푸");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT008")) {
	    	    partVO.setPartprodSe("강아지장난감");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT009")) {
	    	    partVO.setPartprodSe("강아지운동기구");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT010")) {
	    	    partVO.setPartprodSe("강아지케이지");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT011")) {
	    	    partVO.setPartprodSe("고양이사료");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT012")) {
	    	    partVO.setPartprodSe("고양이간식");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT013")) {
	    	    partVO.setPartprodSe("고양이모래");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT014")) {
	    	    partVO.setPartprodSe("고양이화장실");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT015")) {
	    	    partVO.setPartprodSe("고양이스크래쳐");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT016")) {
	    	    partVO.setPartprodSe("고양이장난감");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT017")) {
	    	    partVO.setPartprodSe("고양이샴푸");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT018")) {
	    	    partVO.setPartprodSe("고양이캐리어");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT019")) {
	    	    partVO.setPartprodSe("고양이옷");
	    	} else if(partVO.getPartprodSe().equals("COMN05DT020")) {
	    	    partVO.setPartprodSe("고양이하네스");
	    	}

	    }
	    model.addAttribute("PartProdList", list);


	    PaginationRenderer renderer = new ThemeType2PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);

		return "master:/master/partprodList";
	}

	@GetMapping("/warehousing/{prodId}")
	public String warehousing(@PathVariable String prodId, Model model) {
		model.addAttribute("prodId", prodId);
		return "master:/master/warehousing";
	}

	@PostMapping("/partprodinup")
	@ResponseBody
	public Map<String, String> inup(@RequestParam String prodId, @RequestParam int warQy) {
	    Map<String, String> response = new HashMap<>();

	    WarehousingDefaultVO warVO = new WarehousingDefaultVO();
	    warVO.setProdId(prodId);
	    warVO.setWarQy(warQy);
	    int cnt = Wservice.insertWarehousing(warVO);

	    PartprodDefaultVO partprod = service.selectPartProd(prodId);

	    if (cnt > 0) {
	        AdmininvDefaultVO invVO = Invservice.selectAdminInv(prodId);
	        int cnt2 = Invservice.CheckAdminIv(prodId);

	        if (cnt2 == 1) {
	            invVO.setAdmininvQy(invVO.getAdmininvQy() + warQy);
	            int cnt3 = Invservice.updateAdminInv(invVO);
	            log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★{}", cnt3);
	            if(cnt3 > 0) {
	            	log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★{}", cnt3);
	            	AdminexpDefaultVO adexpVO = new AdminexpDefaultVO();
	            	adexpVO.setHqId("HEAD1");
	            	adexpVO.setComnCodeId("COMN11DT013");
	            	adexpVO.setAdminexpNm("상품입고비");
	            	adexpVO.setAdminexpCn(invVO.getPartprod().getPartprodNm()+"("+warQy+"개)" );
	            	adexpVO.setAdminexpAmount(invVO.getPartprod().getPartprodPc() * warQy);
	            	adminexpService.insertAdminexp(adexpVO);
	            }
	        } else {
	            AdmininvDefaultVO inv = new AdmininvDefaultVO();
	            inv.setProdId(prodId);
	            inv.setAdmininvQy(warQy);
	            inv.setAdmininvNm(partprod.getPartprodNm());
	            int cnt4 = Invservice.insertAdminInv(inv);
	            if(cnt4 > 0) {
	            	AdminexpDefaultVO adexpVO = new AdminexpDefaultVO();
	            	adexpVO.setHqId("HEAD1");
	            	adexpVO.setComnCodeId("COMN11DT013");
	            	adexpVO.setAdminexpNm("상품입고비");
	            	adexpVO.setAdminexpCn("상품입고비 지출");
	            	adexpVO.setAdminexpAmount(invVO.getPartprod().getPartprodPc() * warQy);
	            	adminexpService.insertAdminexp(adexpVO);
	            }
	        }
	    }

	    // JSON 형식으로 응답
	    response.put("status", "success");
	    return response;
	}


	@GetMapping("/{prodId}/wardetail")
	@ResponseBody
	public PartprodDefaultVO detail(@PathVariable String prodId) {
		PartprodDefaultVO partVO = service.selectPartProd(prodId);
		if(partVO.getPartprodSe().equals("COMN05DT001")) {
    	    partVO.setPartprodSe("강아지사료");
    	} else if(partVO.getPartprodSe().equals("COMN05DT002")) {
    	    partVO.setPartprodSe("강아지간식");
    	} else if(partVO.getPartprodSe().equals("COMN05DT003")) {
    	    partVO.setPartprodSe("강아지옷");
    	} else if(partVO.getPartprodSe().equals("COMN05DT004")) {
    	    partVO.setPartprodSe("강아지하네스");
    	} else if(partVO.getPartprodSe().equals("COMN05DT005")) {
    	    partVO.setPartprodSe("강아지목줄");
    	} else if(partVO.getPartprodSe().equals("COMN05DT006")) {
    	    partVO.setPartprodSe("강아지배변패드");
    	} else if(partVO.getPartprodSe().equals("COMN05DT007")) {
    	    partVO.setPartprodSe("강아지샴푸");
    	} else if(partVO.getPartprodSe().equals("COMN05DT008")) {
    	    partVO.setPartprodSe("강아지장난감");
    	} else if(partVO.getPartprodSe().equals("COMN05DT009")) {
    	    partVO.setPartprodSe("강아지운동기구");
    	} else if(partVO.getPartprodSe().equals("COMN05DT010")) {
    	    partVO.setPartprodSe("강아지케이지");
    	} else if(partVO.getPartprodSe().equals("COMN05DT011")) {
    	    partVO.setPartprodSe("고양이사료");
    	} else if(partVO.getPartprodSe().equals("COMN05DT012")) {
    	    partVO.setPartprodSe("고양이간식");
    	} else if(partVO.getPartprodSe().equals("COMN05DT013")) {
    	    partVO.setPartprodSe("고양이모래");
    	} else if(partVO.getPartprodSe().equals("COMN05DT014")) {
    	    partVO.setPartprodSe("고양이화장실");
    	} else if(partVO.getPartprodSe().equals("COMN05DT015")) {
    	    partVO.setPartprodSe("고양이스크래쳐");
    	} else if(partVO.getPartprodSe().equals("COMN05DT016")) {
    	    partVO.setPartprodSe("고양이장난감");
    	} else if(partVO.getPartprodSe().equals("COMN05DT017")) {
    	    partVO.setPartprodSe("고양이샴푸");
    	} else if(partVO.getPartprodSe().equals("COMN05DT018")) {
    	    partVO.setPartprodSe("고양이캐리어");
    	} else if(partVO.getPartprodSe().equals("COMN05DT019")) {
    	    partVO.setPartprodSe("고양이옷");
    	} else if(partVO.getPartprodSe().equals("COMN05DT020")) {
    	    partVO.setPartprodSe("고양이하네스");
    	}

		return partVO;
	}

}
