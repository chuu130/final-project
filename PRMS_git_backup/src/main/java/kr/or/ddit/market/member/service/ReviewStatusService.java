package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.vo.def.ReviewstatusDefaultVO;

public interface ReviewStatusService {
	public int registerReviewStatNo(ReviewstatusDefaultVO row);

    public ReviewstatusDefaultVO retrieveReviewStatNo(String reviewReport);

    public List<ReviewstatusDefaultVO> retrieveAllreviewStat();

    public int modifyReviewStatNo(ReviewstatusDefaultVO row);
    
    public int removeReviewStatNo(String reviewReport);
    
    public ReviewstatusDefaultVO retrieveReviewNo(String reviewNo);
    
    
    
    

}
