package kr.or.ddit.market.member.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.def.mapper.ReviewDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.market.common.mapper.AtchFileMapper;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.vo.def.ReviewDefaultVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDefaultMapper mapper;
	
	@Override
	public int removeByreviewNo(String reviewNo) {
		return mapper.deleteByreviewNo(reviewNo);
	}

	@Override
	public int registerreviewNo(ReviewDefaultVO row) {
		return mapper.insertreviewNo(row);
	}

	@Override
	public ReviewDefaultVO retrieveByreviewNo(String reviewNo) {
		return mapper.selectByreviewNo(reviewNo);
	}

	@Override
	public List<ReviewDefaultVO> retrieveAllreview(PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		return mapper.selectAllreview(paging);
	}
	
	@Override
	public List<ReviewDefaultVO> retrieveAllreviewNonPaging() {
		return mapper.selectAllreviewNonPaging();
	}

	@Override
	public int modifyByreviewNo(ReviewDefaultVO row) {
		return mapper.updateByreviewNo(row);
	}

	@Override
	public List<ReviewDefaultVO> selectMemReviewList(String memNo) {
		return mapper.selectMemReviewList(memNo);
	}

	@Override
	public ReviewDefaultVO retrieveMyReview(String reviewNo) {
		return mapper.selectMyReview(reviewNo);
	}

	@Override
	public int modifyReviewDelete(ReviewDefaultVO row) {
		return mapper.updateReviewDelete(row);
	}





	
}
