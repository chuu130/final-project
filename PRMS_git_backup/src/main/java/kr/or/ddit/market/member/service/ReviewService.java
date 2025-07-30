package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReviewDefaultVO;

public interface ReviewService {
	

	/** 리뷰 등록
	 * @param row
	 * @return
	 */
	public int registerreviewNo(ReviewDefaultVO row);
	
	/** 리뷰 수정
	 * @param row
	 * @return
	 */
	public int modifyByreviewNo(ReviewDefaultVO row);

	/** 리뷰 삭제
	 * @param reviewNo
	 * @return
	 */
	public int removeByreviewNo(String reviewNo);

	/** 관리자 페이지 해당하는 리뷰 번호에 대한 정보 조회
	 * @param reviewNo
	 * @return
	 */
	public ReviewDefaultVO retrieveByreviewNo(String reviewNo);

	/** 마이페이지 해당 멤버와 리뷰번호에 해당하는 상품
	 * @param reviewNo
	 * @return
	 */
	public ReviewDefaultVO retrieveMyReview(String reviewNo);
	
	/** 페이징 포함 리스트
	 * @param paging
	 * @return
	 */
	public List<ReviewDefaultVO> retrieveAllreview(PaginationInfo paging);
	
	/** 페이징 미포함
	 * @return
	 */
	public List<ReviewDefaultVO> retrieveAllreviewNonPaging();
	
	/** 해당하는 회원에 대한 리뷰 전체
	 * @param memNo
	 * @return
	 */
	public List<ReviewDefaultVO> selectMemReviewList(String memNo);
	
	/** 블라인드 여부 상태 값 변환
	 * @param row
	 * @return
	 */
	public int modifyReviewBlind(ReviewDefaultVO row);
}
 