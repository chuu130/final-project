package kr.or.ddit.market.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ReviewstatusDefaultVO;

@Mapper
public interface ReviewStatusMapper {
	/**
	 * 리뷰신고 등록쿼리 / 조회수 초기값 1
	 * @param row
	 * @return
	 */
	public int insertReviewStatNo(ReviewstatusDefaultVO row);

    public ReviewstatusDefaultVO selectReviewStatNo(String reviewReport);

    public ReviewstatusDefaultVO selectReviewNo(String reviewNo);
    
    public List<ReviewstatusDefaultVO> selectAllreviewStat();

    public int updateReviewStatNo(ReviewstatusDefaultVO row);
    
    public int deleteReviewStatNo(String reviewReport);
    
	/**
	 * 해당 리뷰에 대한 조회수 증가쿼리
	 * @param reviewNo
	 * @return
	 */
	public void incrementReportCount(Map<String, Object> param);
	
	/**
	 * 조회수 증가전 신고가 이미 존재하는지 확인하는 쿼리 
	 * 리뷰와 회원에 대한 신고기록 존재하는지 두건 파악
	 * @param reviewNo
	 * @return
	 */
	public Integer checkReviewExist(Map<String, Object> param);

	
	/**
	 * 신고 카운트수 반환
	 * @param param
	 * @return
	 */
	public Integer getReportCount(Map<String, Object> param);

	
    
    
}
