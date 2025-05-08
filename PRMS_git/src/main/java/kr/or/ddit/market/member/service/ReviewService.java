package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReviewDefaultVO;

public interface ReviewService {
	
	public int removeByreviewNo(String reviewNo);

	public int registerreviewNo(ReviewDefaultVO row);

	public ReviewDefaultVO retrieveByreviewNo(String reviewNo);

	public ReviewDefaultVO retrieveMyReview(String reviewNo);
	
	public List<ReviewDefaultVO> retrieveAllreview(PaginationInfo paging);
	
	public List<ReviewDefaultVO> retrieveAllreviewNonPaging();
	
	public List<ReviewDefaultVO> selectMemReviewList(String memNo);

	public int modifyByreviewNo(ReviewDefaultVO row);
	
	public int modifyReviewDelete(ReviewDefaultVO row);
}
 