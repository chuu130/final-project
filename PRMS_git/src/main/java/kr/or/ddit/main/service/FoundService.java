package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FoundDefaultVO;

public interface FoundService {
	/**
	 * 창업상담문의 등록
	 * @param found
	 */
	public void createFound(FoundDefaultVO found);

	/**
	 * 창업상담검토 리스트
	 * @return
	 */
	public List<FoundDefaultVO> foundCheckList(PaginationInfo paging);

	/**
	 * 창업검토승인
	 * @param found
	 * @return
	 */
	public void modifyFound(String foundNo, String foundConfmAt);

	/**
	 * 창업 내용 확인
	 * @param foundNo
	 */
	public FoundDefaultVO foundCheckDetail(String foundNo);



	/**
	 * 창업상담 통과한 리스트만 출력
	 * @return
	 */
	public List<FoundDefaultVO> foundSuccessList();

	public FoundDefaultVO Foundlicense(FoundDefaultVO Foundvo);

	/**
	 * 창업상담 상담사번호, 상담일자가 널값이 아닌 것만 출력
	 * @return
	 */
	public List<FoundDefaultVO> foundAtList();

	/**
	 * 창업상담 하나만 뽑아오기
	 */
	public FoundDefaultVO selectfound(String foundNo);

	/**
	 * 창업상담승인 후 상담통과여부 Y로 업뎃
	 */
	public int foundSideSeupdate(String foundNo);



}
