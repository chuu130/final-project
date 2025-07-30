package kr.or.ddit.market.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.ProdService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.market.member.service.ReviewService;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class ReviewMarketController {


	@Autowired
	private ReviewService service;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private ProdService prodService;

	/**
	 * 마이페이지에서 리뷰등록 버튼을 누르면 인서트 페이지로 이동
	 * 
	 * @param prodId
	 * @param model
	 * @return
	 */
	@GetMapping("/reviewProdUI")
	public String formUI(@RequestParam("prodId") String prodId
						, Model model
						, ReviewDefaultVO reviewBoard) {
		ProdDefaultVO product = prodService.retrieveProd(prodId);
	
	    // 모델에 상품 정보 추가 가져가기
	    model.addAttribute("product", product);

		// 인서트시 경로변수에 prodId 담아간다
		model.addAttribute("prodId", prodId);
		log.info("prodId", prodId);
		return "market:/review/reviewInsert";

	}


	/**
	 * 파일 업로드 포함 리뷰 등록
	 * 
	 * @param uploadFile
	 * @param authentication
	 * @param reviewBoard
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reviewProdInsert")
	public String insertData(@RequestParam("uploadFile") MultipartFile[] uploadFile
							,@RequestParam(value = "prodId") String prodId // 상품 ID
							, Authentication authentication
							, ReviewDefaultVO reviewBoard) {

		log.info("리뷰내용 체크: {}", reviewBoard);
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
		String memNo = member.getRealUser().getMemNo();
		
		reviewBoard.setMemNo(memNo); // 회원정보 설정
	    
	    service.registerreviewNo(reviewBoard); // 실제 review 등록

		return "success";
	}
	
//	reviewBoard.setProdId(prodId); // 상품아이디 설정
//	reviewBoard.setUploadFile(uploadFile); // 업로드된 파일
	
	//아래는 조회시 사용 등록할때는 필요없다.
	//AtchfiledtVO atchfiledtVO = atchFileService.selectfileimage(atchFileId);

	
	/**
	 * 해당회원이 등록한 리뷰를 삭제
	 * 
	 * @param authentication
	 * @param reviewBoard
	 * @param redirectAttributes
	 * @return
	 */
//	@PostMapping(value="{reviewNo}/listdelete")
//	@ResponseBody // 해당 리뷰번호 받아서 처리
//	public String deleteData( // JSON 데이터 ReviewDefaultVO로 매핑
//							  @RequestBody ReviewDefaultVO reviewBoard
//							 ,@RequestParam("prodId") String prodId  // 상품 ID를 RequestParam으로 받음 
//							 ,@PathVariable String reviewNo // 신고후 해당상품의 경로로 이동
//							 ,Authentication authentication
//	 ) {
//		SecurityContext sc = SecurityContextHolder.getContext();
//		MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
//		String UserMemNo = member.getRealUser().getMemNo();// 회원로그인정보
//	    
//	    reviewBoard.setMemNo(UserMemNo);
//	    reviewBoard.setReviewNo(reviewNo);
//		
//		service.removeByreviewNo(reviewBoard.getReviewNo());// ReviewNo에 해당하는 게시물 삭제
//		
//		return "success";
//	}
//	
	
	
	/**
	 * 회원 본인의 리뷰를 삭제할 수 있다.
	 * 
	 * @param reviewBoard
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping(value="{reviewNo}/memdelete")
	@ResponseBody // 해당 리뷰번호 받아서 처리
	public String deletelistData( 
							  @RequestBody ReviewDefaultVO reviewBoard 
							 ,@PathVariable String reviewNo // 신고후 해당상품의 경로로 이동
	 ) {
	    reviewBoard.setReviewNo(reviewNo);
		service.removeByreviewNo(reviewBoard.getReviewNo());// ReviewNo에 해당하는 게시물 삭제
		
		return "success";
	}
	
	
	/**
	 * 해당회원이 등록한 리뷰 블라인드 y/n 업데이트
	 * 블라인드 기능 개발 타팀원
	 * 
	 * @param authentication
	 * @param reviewBoard
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping(value="{reviewNo}/delete")
	@ResponseBody // 해당 리뷰번호 받아서 처리
	public String deleteData( 
							 @RequestBody ReviewDefaultVO reviewBoard // JSON 데이터 ReviewDefaultVO로 매핑
//							 ,@RequestParam("prodId") String prodId  // 상품 ID를 RequestParam으로 받음 
							 ,@PathVariable("reviewNo") String reviewNo
	 ){
		// reviewNo를 reviewBoard 객체에 설정
	    reviewBoard.setReviewNo(reviewNo);
	    log.info("리뷰 넘버값 reviewNo: {}", reviewNo);
		service.modifyReviewBlind(reviewBoard); // ReviewNo에 해당하는 삭제 상태 업데이트
		
		return "success";
	}


	/**
	 * 마이페이지 나의 리뷰내역
	 * @param memNo
	 * @param model
	 * @return
	 */
	@GetMapping("{memNo}/memreview")
	public String memreview(@PathVariable String memNo
							, ReviewDefaultVO reviewBoard
							, Model model
							, @RequestParam(required = false, defaultValue = "1") int page
							, @ModelAttribute("condition") SimpleCondition simpleCondition
	    ){
		// 페이지 정보
//		PaginationInfo paging = new PaginationInfo(4,5);
//		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		
		
		// 리뷰내역 담아가기
		List<ReviewDefaultVO> memReview = service.selectMemReviewList(memNo);
		
		// 리뷰vo의 atchfile에 fileDetails 셋팅
//		for (ReviewDefaultVO revVO : memReview) {
//			revVO.setAtchfile(new AtchfileVO());
//			List<AtchfiledtVO> atList = new ArrayList<AtchfiledtVO>();
//			AtchfiledtVO atchfiledtVO = atchFileService.selectfileimage(revVO.getReviewImage()); 
//			atList.add(atchfiledtVO);
//			revVO.getAtchfile().setFileDetails(atList);
//		}
		
		// 각 리뷰에 연결된 상품 정보를 추가
//		for (ReviewDefaultVO revVO : memReview) {
			// 상품 정보 조회 (리뷰에 연결된 상품 ID로 조회)
//			ProdDefaultVO product = prodService.retrieveProd(revVO.getProdId());
//			revVO.setProdSleNm(product.getProdSleNm());
		
		model.addAttribute("memReview", memReview);
		log.info("memReview content: {}", memReview);

		// 멤버정보 담아가기;
		MemberDefaultVO memVO = memService.selectMember(memNo);
		model.addAttribute("memberVO", memVO);
		
//	}
		// 나의 리뷰내역
		return "market:member/memreview";
}
	
	
	// 페이징 정보 담아가기
//		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
//		String pagingHTML = renderer.renderPagination(paging);
//		model.addAttribute("pagingHTML", pagingHTML);

}

