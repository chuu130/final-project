package kr.or.ddit.market.member.service;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.ReviewDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.vo.def.ReviewDefaultVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Value("#{appInfo.atchSavePath}")
	private File saveFolder;
	
	@Autowired
	private ReviewDefaultMapper mapper;
	@Autowired
	private AtchFileService atchFileService; 

	
	/**
	 * 리뷰 등록
	 */
	@Override
	public int registerreviewNo(ReviewDefaultVO row) {
		 Optional.ofNullable(row.getAtchfile())
         .ifPresent(atchFile -> {
             atchFileService.createAtchFile(atchFile, saveFolder);
             row.setReviewImage(atchFile.getAtchFileId());
         });
		
		return mapper.insertreviewNo(row);
	}
	
	
//		atchFileService.createAtchFile(reviewBoard.getAtchfile(), saveFolder);
//		int atchFileId = reviewBoard.getAtchfile().getAtchFileId();
//		reviewBoard.setReviewImage(atchFileId); // 리뷰이미지 세팅
	
	
	/**
	 * 리뷰 수정 사용안함 등록 삭제만
	 */
	@Override
	public int modifyByreviewNo(ReviewDefaultVO row) {
		return mapper.updateByreviewNo(row);
	}
	
	/**
	 * 리뷰 삭제
	 */
	@Override
	public int removeByreviewNo(String reviewNo) {
		ReviewDefaultVO saved= mapper.selectByreviewNo(reviewNo); 
		if (saved != null) {
			Optional.ofNullable(saved.getReviewImage())
			.ifPresent(fid->atchFileService.disableAtchFile(fid));
		}
		return mapper.deleteByreviewNo(reviewNo);
	}
	

	/**
	 *관리자 페이지 해당하는 리뷰 번호에 대한 정보 조회
	 */
	@Override
	public ReviewDefaultVO retrieveByreviewNo(String reviewNo) {
		return mapper.selectByreviewNo(reviewNo);
	}

	/**
	 * 페이징 포함 리스트 조회
	 */
	@Override
	public List<ReviewDefaultVO> retrieveAllreview(PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		return mapper.selectAllreview(paging);
	}
	
	/**
	 * 페이징 미포함 리스트
	 */
	@Override
	public List<ReviewDefaultVO> retrieveAllreviewNonPaging() {
		return mapper.selectAllreviewNonPaging();
	}


	/**
	 * 해당하는 회원에 대한 전체 리스트
	 */
	@Override
	public List<ReviewDefaultVO> selectMemReviewList(String memNo) {
		return mapper.selectMemReviewList(memNo);
	}

	/**
	 *마이페이지 해당 멤버와 리뷰번호에 해당하는 상품 가져오는 메소드
	 */
	@Override
	public ReviewDefaultVO retrieveMyReview(String reviewNo) {
		return mapper.selectMyReview(reviewNo);
	}

	/**
	 *블라인드 y/n 업데이트 메소드
	 */
	@Override
	public int modifyReviewBlind(ReviewDefaultVO row) {
		return mapper.updateReviewBlind(row);
	}





	
}
