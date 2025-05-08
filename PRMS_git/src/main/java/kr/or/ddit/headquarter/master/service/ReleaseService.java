package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReleaseDefaultVO;

public interface ReleaseService {
	public int insertRelease(ReleaseDefaultVO relVO);

    /**
     * 상품발주신청 리스트
     * @param paging
     * @return
     */
    public List<ReleaseDefaultVO> selectReleaseList(PaginationInfo paging);

	/**
	 * 상품발주신청 하나의 발주신청만 조회
	 */
	public ReleaseDefaultVO selectRelease(String orderdetailNo);

	/**
	 * 출고물품 상세 조회
	 */
	public ReleaseDefaultVO selectReleaseDetail(String orderdetailNo);

	/**
	 * 출고완료 후 출고여부 업데이트
	 */
	public int updaterelStatus(String orderdetailNo);

	/**
	 * 출고여부가 Y인지 체크
	 */
	public String checkYn(String orderdetailNo);
}
