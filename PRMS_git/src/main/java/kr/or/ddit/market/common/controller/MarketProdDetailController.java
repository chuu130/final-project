package kr.or.ddit.market.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.cfg.context.ReturnValueConstraintMappingContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.ProdDetailService;
import kr.or.ddit.market.member.service.MemberCartService;
import kr.or.ddit.market.member.service.MemberWishListService;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.MemberWishListVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CartDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 본사재고에 있는 마켓상품의 상세정보를 가져오는 컨트롤러
 * @author jbk
 *
 */
@Slf4j
@Controller
@RequestMapping("/market/prodDetail")
public class MarketProdDetailController {

	@Autowired
	private ProdDetailService prodDetailService;
	
	@Autowired
	private AtchFileService atchService;
	
	@Autowired
	private MemberWishListService wishService;
	
	@Autowired
	private MemberCartService memCartservice;


	/**
	 * 본사재고에 있는 마켓상품의 상세정보를 가져온 후, 상세페이지 화면으로 이동하는 메소드
	 * @param prodId
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@GetMapping("{prodId}")
	public String marketProdDetailUI(
			@PathVariable String prodId
			, Model model
			, Authentication authentication
	) throws Exception {
		// 서비스에서 {본사재고, 상품정보} 정보를 가져온다.
		AdmininvDefaultVO adminvProd = prodDetailService.retrieveProd(prodId);

		// 서비스에서 비슷한 상품정보 리스트를 가져온다.
		ProdDefaultVO detailProd = adminvProd.getProd();
		List<ProdDefaultVO> similarProdList = prodDetailService.retrieveSimilarProdList(detailProd);
		
		// 서비스에서 해당 상품의 리뷰정보를 가져온다.
		List<ReviewDefaultVO> reviewList = prodDetailService.retrieveReviewList(detailProd.getProdId());

		// sql association/collection 맵핑에 해당하는 기능, 프로그램적으로 담기 (reviewvo값 비동기로 데이터를 받아와 model에 담을수 없음)
		// 해당상품의 정보를 리뷰 vo에 담는다
		// 리뷰vo에 새로운 atchfile객체 생성
		// atchfiledt 대한 정보를 담을 리스트를 만든다
		// 리뷰정보중 해당번호의 ReviewImage(atchfileid)정보를 atchfiledt에 담는다
		// 디테일 파일정보를 atList에 담는다
		// 리뷰vo의 atchfile에 fileDetails 셋팅
		for (ReviewDefaultVO revVO : reviewList) {
			revVO.setAtchfile(new AtchfileVO());
			List<AtchfiledtVO> atList = new ArrayList<AtchfiledtVO>();
			AtchfiledtVO atchfiledtVO = atchService.selectfileimage(revVO.getReviewImage()); 
			atList.add(atchfiledtVO);
			revVO.getAtchfile().setFileDetails(atList);
		}
		
		 SecurityContext sc = SecurityContextHolder.getContext();
		     if(sc.getAuthentication().getAuthorities().toString().equalsIgnoreCase("[ROLE_USER]")) {
		     MemberVOWrapper member = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());
		     String memNo = member.getRealUser().getMemNo();
		     model.addAttribute("memNo",memNo);
		
		     List<MemberWishListVO> wishList = wishService.selectMemberWishList(memNo);
		     MemberWishListVO checkWishProd = wishService.checkProdWishList(memNo, prodId);
		     
		     String check = "";
		     
		     if(checkWishProd == null) {
		    	 check = "false";
		     }else {
		    	 check = "true";
		     }
			model.addAttribute("wishList",wishList);
			model.addAttribute("check", check);
		
	     }

		// 스코프에 담는다.
		model.addAttribute("adminvProd",adminvProd);
		model.addAttribute("similarProdList",similarProdList);
		model.addAttribute("reviewList",reviewList);
		
		// 상품상세페이지로 이동한다.
		return "market:/market/marketProdDetail";
	}

	/**
	 * 장바구니에 상품을 추가하는 메소드
	 * @param newCart
	 * @param model
	 */
	@PostMapping("addCart")
	public void addCartProcess(
			@RequestBody CartDefaultVO newCart
			,Model model
	) {
		
		ServiceResult serviceResult = prodDetailService.addCart(newCart);
		model.addAttribute("serviceResult",serviceResult);
		
		
	}
	
	@PostMapping("addCartCnt")
	@ResponseBody
	public int addCartCnt() {
		SecurityContext sc = SecurityContextHolder.getContext();
	     MemberVOWrapper member = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());
	     String memNo = member.getRealUser().getMemNo();
	     
	     int cnt = memCartservice.selectCartCount(memNo);
	     
	     return cnt;
		
	}
	
	@PostMapping("cartListUpdate")
	@ResponseBody
	public List<CartVO> cartListUpdate() {
		SecurityContext sc = SecurityContextHolder.getContext();
	     MemberVOWrapper member = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());
	     String memNo = member.getRealUser().getMemNo();
	     
	     List<CartVO> cartList = memCartservice.selectCartList(memNo);
	     
	     return cartList;
		
	}

}
