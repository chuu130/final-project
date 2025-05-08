package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.market.member.mapper.ReviewStatusMapper;
import kr.or.ddit.vo.def.ReviewstatusDefaultVO;

@Service
public class ReviewStatusServiceImpl implements ReviewStatusService {
	
	@Autowired
	private ReviewStatusMapper mapper;
	

	/**
	 * 리뷰번호와 신고회원에 따른 신고 등록처리
	 */
	@Override
	public int registerReviewStatNo(ReviewstatusDefaultVO row) {
		
		 // 신고가 이미 존재하는지 확인
        Map<String, Object> param = new HashMap<>();
        param.put("reviewNo", row.getReviewNo());
        param.put("reviewMem", row.getReviewMem());
        
        Integer count = mapper.checkReviewExist(param);
        if (count != null && count > 0) {
            // 이미 신고한 경우 해당 리뷰의 총 신고 횟수를 반환
            return mapper.getReportCount(param);
        } else {
            // 새로운 신고 기록 추가
            mapper.insertReviewStatNo(row);

            // 해당 리뷰 번호에 대한 총 신고 카운트를 증가
            mapper.incrementReportCount(param);
        }

        // 최종 리뷰에 대한 총 신고 횟수를 반환
        return mapper.getReportCount(param);
	}

	@Override
	public List<ReviewstatusDefaultVO> retrieveAllreviewStat() {
		return mapper.selectAllreviewStat();
	}

	@Override
	public int modifyReviewStatNo(ReviewstatusDefaultVO row) {
		return mapper.updateReviewStatNo(row);
	}

	@Override
	public int removeReviewStatNo(String reviewReport) {
		return mapper.deleteReviewStatNo(reviewReport);
	}

	@Override
	public ReviewstatusDefaultVO retrieveReviewNo(String reviewNo) {
		return mapper.selectReviewNo(reviewNo);
	}

	@Override
	public ReviewstatusDefaultVO retrieveReviewStatNo(String reviewReport) {
		return mapper.selectReviewNo(reviewReport);
	}
	


}
