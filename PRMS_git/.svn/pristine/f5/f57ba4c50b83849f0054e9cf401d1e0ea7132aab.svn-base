package kr.or.ddit.headquarter.master.mapper;

import java.util.List;

import kr.or.ddit.commons.def.mapper.ReviewDefaultMapper;
import kr.or.ddit.vo.ReviewVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;


//@Mapper
public interface ReviewMapper extends ReviewDefaultMapper{
	 public int deleteByreviewNo(String reviewNo);
	 public int insertReview(ReviewDefaultVO row);
	 public ReviewDefaultVO selectByPrimaryKey(String reviewNo);
	 public List<ReviewDefaultVO> selectAll();
	 public int updateByPrimaryKey(ReviewDefaultVO row);
	 
	 
	/**
	 * 전체 리뷰 목록 조회
	 * @return
	 */
	public List<ReviewVO> selectReviewList();
	
}
