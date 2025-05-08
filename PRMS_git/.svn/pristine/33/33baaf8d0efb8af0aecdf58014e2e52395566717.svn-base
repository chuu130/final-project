package kr.or.ddit.market.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.market.member.mapper.ReviewStatusMapper;
import kr.or.ddit.market.member.service.ReviewStatusService;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.ReviewstatusDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class ReviewStatusController {
	
	@Autowired
	private ReviewStatusService service; // 리뷰 신고
	
	@PostMapping(value="/{prodId}/status", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody // 해당 리뷰번호 받아서 처리
	public Map<String, String> formData(
					// JSON 데이터 ReviewstatusDefaultVO로 매핑
					@RequestBody ReviewstatusDefaultVO status
					,@PathVariable String prodId // 신고후 해당상품의 경로로 이동
					,Authentication authentication
	){
	
			SecurityContext sc = SecurityContextHolder.getContext();
			MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
			String memNo = member.getRealUser().getMemNo();
			status.setReviewMem(memNo); // 신고아이디에 회원아이디 저장
			
			log.info("Received reviewNo: {}", status.getReviewNo());
		    log.info("Received reviewReportResn: {}", status.getReviewReportResn());
			
			Map<String, String> response = new HashMap<>();
		    try {
		        service.registerReviewStatNo(status); // 인서트 진행
		        response.put("status", "success"); // 성공시
		    } catch (Exception e) {
		        response.put("status", "error");
		        response.put("message", "신고 접수에 실패했습니다."); // 실패시
		    }

		    return response;
		
	}
}

