package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.franchise.common.service.FiorderService;
import kr.or.ddit.franchise.common.service.InvRequestService;
import kr.or.ddit.franchise.common.service.InventoryService;
import kr.or.ddit.headquarter.common.service.AdminInvService;
import kr.or.ddit.headquarter.master.service.ReleaseService;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.FiorderDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;
import kr.or.ddit.vo.def.ReleaseDefaultVO;


/**
 * 본사총괄관리자 상품 출고
 *
 */
@Controller
@RequestMapping("/main/master")
public class ReleaseController {

	@Autowired
	private ReleaseService service;
	@Autowired
	private FiorderService Fioservice;
	@Autowired
	private InvRequestService Reqservice;
	@Autowired
	private InventoryService Invenservice;
	@Autowired
	private AdminInvService AInvService;

	/**
	 * 가맹점발주신청한 리스트 출력
	 */
	@GetMapping("/releaseList.do")
	public String ReleaseList(@RequestParam(required = false, defaultValue = "1") int page
								, Model model
								, @ModelAttribute("condition") SimpleCondition simpleCondition) {

		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<ReleaseDefaultVO> list = service.selectReleaseList(paging);
		for(ReleaseDefaultVO relVO : list) {
			if(relVO.getReleaseYn().equals("Y")) {
				relVO.setReleaseYn("출고완료");
			}else {
				relVO.setReleaseYn("출고대기중");
			}
		}
		model.addAttribute("ReleaseList", list);

		PaginationRenderer renderer = new ThemeType2PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);


		return "master:master/releaseList";
	}

	/**
	 * 가맹점주 발주 신청 -> 본사 발주 출고 -> 출고 수량 본사재고 반영 -> 가맹점주 재고 증가
	 * @param orderdetailNo 발주신청상세 번호
	 * @return
	 */
	@GetMapping("/release/{orderdetailNo}")
	public String release(@PathVariable String orderdetailNo, RedirectAttributes redirectAttributes) {
//		String yn = service.checkYn(orderdetailNo);

		// 본사출고 VO
		ReleaseDefaultVO relVO = service.selectRelease(orderdetailNo);
		int prodQy = relVO.getReleaseQy();
		String prodId = relVO.getProdId();
		// 발주신청상세 VO
		FiorderDefaultVO fioVO = Fioservice.selectFiorder(relVO.getOrderdetailNo());
		String fioprodId = fioVO.getProdId();
		// 가맹점 발주 신청 VO
		InvrequestDefaultVO reqVO = Reqservice.selectInvrequest(fioVO.getFireqId());
		String franchiseId = reqVO.getFranchiseId();

		// 가맹점 재고 관리 VO
		InventoryDefaultVO invenVO = new InventoryDefaultVO();
		invenVO.setFivQy(prodQy);
		invenVO.setFranchiseId(franchiseId);
		invenVO.setFranprodId(franchiseId+fioprodId);

		// 인벤트로 테이블에 재고PK 유무 판단
		int cnt = Invenservice.CheckPk(invenVO);
		if(cnt == 0) {
			// 인벤토리 테이블안에 해당건에 대해 재고PK가 없을 경우 재고 생성
			Invenservice.insertInventory(invenVO);
		}
		else {
			// 인벤토리 테이블안에 해당건에 대해 재고PK가 있을 경우 재고 반영
			InventoryDefaultVO inventoryVO = Invenservice.selectInvenPk(invenVO);
			inventoryVO.setFivQy(inventoryVO.getFivQy()+prodQy);
			Invenservice.updateInventory(inventoryVO);
		}
		// 출고 후 본사 재고 반영
		AdmininvDefaultVO AinvVO = AInvService.selectAdminInv(prodId);
		AinvVO.setAdmininvQy(AinvVO.getAdmininvQy() - prodQy);
		AInvService.updateAdminInv(AinvVO);

		// 가맹점발주신청 발주상태 출고완료상태 COMN04DT004로 변경
		Reqservice.updateStatus(reqVO);

		// 출고 출고상태 업데이트
		service.updaterelStatus(orderdetailNo);

		return "redirect:/main/master/releaseList.do";
	}

	@GetMapping("/{orderdetailNo}/detail")
	@ResponseBody
	public ReleaseDefaultVO detail(@PathVariable String orderdetailNo) {
		ReleaseDefaultVO relVO = service.selectReleaseDetail(orderdetailNo);
		if(relVO.getProd().getPartprodSe().equals("COMN05DT001")) {
			relVO.getProd().setPartprodSe("강아지사료");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT002")) {
    		relVO.getProd().setPartprodSe("강아지간식");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT003")) {
    	    relVO.getProd().setPartprodSe("강아지옷");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT004")) {
    	    relVO.getProd().setPartprodSe("강아지하네스");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT005")) {
    	    relVO.getProd().setPartprodSe("강아지목줄");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT006")) {
    	    relVO.getProd().setPartprodSe("강아지배변패드");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT007")) {
    	    relVO.getProd().setPartprodSe("강아지샴푸");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT008")) {
    	    relVO.getProd().setPartprodSe("강아지장난감");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT009")) {
    	    relVO.getProd().setPartprodSe("강아지운동기구");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT010")) {
    	    relVO.getProd().setPartprodSe("강아지케이지");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT011")) {
    	    relVO.getProd().setPartprodSe("고양이사료");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT012")) {
    	    relVO.getProd().setPartprodSe("고양이간식");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT013")) {
    	    relVO.getProd().setPartprodSe("고양이모래");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT014")) {
    	    relVO.getProd().setPartprodSe("고양이화장실");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT015")) {
    	    relVO.getProd().setPartprodSe("고양이스크래쳐");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT016")) {
    	    relVO.getProd().setPartprodSe("고양이장난감");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT017")) {
    	    relVO.getProd().setPartprodSe("고양이샴푸");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT018")) {
    	    relVO.getProd().setPartprodSe("고양이캐리어");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT019")) {
    	    relVO.getProd().setPartprodSe("고양이옷");
    	} else if(relVO.getProd().getPartprodSe().equals("COMN05DT020")) {
    	    relVO.getProd().setPartprodSe("고양이하네스");
    	}

		return relVO;
	}
}
