package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FoundDefaultVO;

public interface FoundApproveService {

	/**
	 * 창업상담 배정 리스트
	 * @param paging
	 * @return
	 */
	public List<FoundDefaultVO> retrieveFoundApproveList(PaginationInfo paging);

	/**
	 * 창업상담 날짜, 상담직원 배정 업데이트
	 * @param foundNo
	 * @param empNo
	 * @param foundDe
	 */
	public void modifyApproveFound(String foundNo, String empNo, String foundDe);
}
