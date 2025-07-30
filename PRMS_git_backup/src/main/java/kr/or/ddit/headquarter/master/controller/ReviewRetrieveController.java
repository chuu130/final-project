package kr.or.ddit.headquarter.master.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.ProdDetailService;
import kr.or.ddit.market.common.service.ProdService;
import kr.or.ddit.market.member.service.ReviewService;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;

@Controller
@RequestMapping("/main/master")
public class ReviewRetrieveController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private AtchFileService atchFileService;
	
	@Autowired
	private ProdService prodService;

	
	/**
	 * 본사 관리자용 리뷰확인
	 * @param model
	 * @return
	 */
	@GetMapping("/reviewmasterList")
	public String list(Model model
					,@RequestParam(required = false, defaultValue = "1") int page
//					, @RequestParam("prodId") String prodId // 상품 ID
					, ReviewDefaultVO reviewBoard
					, Authentication authentication
					, @ModelAttribute("condition") SimpleCondition simpleCondition
	){
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		// 리뷰리스트에서 전체 리뷰정보를 가져온다.
		List<ReviewDefaultVO> reviewProdList = service.retrieveAllreview(paging);
		
		model.addAttribute("reviewProdList", reviewProdList);
		
		//리뷰이미지 아이디를 이용해 (atchid) 해당 리뷰에대한 사진 파일을 가져온다.
//		for (ReviewDefaultVO revVO : reviewProdList) {
//			revVO.setAtchfile(new AtchfileVO());
//			List<AtchfiledtVO> atList = new ArrayList<AtchfiledtVO>();
//			AtchfiledtVO atchfiledtVO = atchFileService.selectfileimage(revVO.getReviewImage()); 
//			atList.add(atchfiledtVO);
//			revVO.getAtchfile().setFileDetails(atList);
//		}
//		
		  // 각 리뷰에 연결된 상품 정보를 추가
	    for (ReviewDefaultVO revVO : reviewProdList) {
	        // 상품 정보 조회 (리뷰에 연결된 상품 ID로 조회)
	        ProdDefaultVO product = prodService.retrieveProd(revVO.getProdId());
	        revVO.setProdSleNm(product.getProdSleNm());
		
	}
		
		// 페이지 랜더링
		PaginationRenderer renderer = new ThemeType2PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
	    return "master:review/reviewList";
	}

	
	@GetMapping("/{reviewNo}/reviewdetail")
	public String detail(@PathVariable String reviewNo
						,Model model) {
		ReviewDefaultVO review = service.retrieveByreviewNo(reviewNo);
		
//		review.setAtchfile(new AtchfileVO());
		
//	    List<AtchfiledtVO> atList = new ArrayList<>();
	    // 리뷰에 연결된 이미지 파일을 가져옴
//	    AtchfiledtVO atchfiledtVO = atchFileService.selectfileimage(review.getReviewImage());
//	    atList.add(atchfiledtVO);
	    
	    // 리뷰에 파일 정보를 설정
//	    review.getAtchfile().setFileDetails(atList);
		
		
		// 각 리뷰에 연결된 상품 정보를 추가
//		for (ReviewDefaultVO revVO : review) {
			// 상품 정보 조회 (리뷰에 연결된 상품 ID로 조회)
//			ProdDefaultVO product = prodService.retrieveProd(revVO.getProdId());
//			revVO.setProdSleNm(product.getProdSleNm());
//		}
		
		model.addAttribute("review", review);
		
		
		return "master:review/reviewMasterDetail";
		
		}
	
	/**
	 * 해당회원이 등록한 리뷰를 관리자가 삭제할 수 있다.
	 * 
	 * @param authentication
	 * @param reviewBoard
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping(value="{reviewNo}/listdelete")
	@ResponseBody // 해당 리뷰번호 받아서 처리
	public String deletelistData( 
							  @RequestBody ReviewDefaultVO reviewBoard // JSON 데이터 ReviewDefaultVO로 매핑
//							 ,@RequestParam("prodId") String prodId  // 상품 ID를 RequestParam으로 받음 
							 ,@PathVariable String reviewNo // 신고후 해당상품의 경로로 이동
	 ) {
	    reviewBoard.setReviewNo(reviewNo);
		service.removeByreviewNo(reviewBoard.getReviewNo());// ReviewNo에 해당하는 게시물 삭제
		
		return "success";
	}
	

}