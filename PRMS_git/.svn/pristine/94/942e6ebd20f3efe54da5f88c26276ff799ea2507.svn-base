package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReviewDefaultVO;

@Mapper
public interface ReviewDefaultMapper {

    /**
     * 리뷰 등록하기
     * @param row
     * @return
     */
    public int insertreviewNo(ReviewDefaultVO row);

    public ReviewDefaultVO selectByreviewNo(String reviewNo);
    
    /**
     * 마이페이지 해당 멤버와 리뷰번호에 해당하는 상품 가져오는 메소드
     * @param reviewNo
     * @return
     */
    public ReviewDefaultVO selectMyReview(String reviewNo);

    /**
     * 페이징 포함 전체리스트 조회
     * @return
     */
    public List<ReviewDefaultVO> selectAllreview(PaginationInfo paging);
    
    /**
     * 페이징 미포함 전체리스트 조회
     * @return
     */
    public List<ReviewDefaultVO> selectAllreviewNonPaging();
	
    /**
	 * 게시글 목록수 조회 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
    
    
    
    public List<ReviewDefaultVO> selectMemReviewList(String reviewNo);

    /**
     * 리뷰수정 / 삭제로 대체
     * @param row
     * @return
     */
    public int updateByreviewNo(ReviewDefaultVO row);
    
    /**
     * 리뷰 삭제 / 상태값 yn으로 updateReviewDelete 사용
     * @param reviewNo
     * @return
     */
    public int deleteByreviewNo(String reviewNo);
    
    /**
     * 마이페이지 나의 리뷰에서 삭제여부 y/n 업데이트 메소드
     * @param row
     * @return
     */
    public int updateReviewDelete(ReviewDefaultVO row);
    
}