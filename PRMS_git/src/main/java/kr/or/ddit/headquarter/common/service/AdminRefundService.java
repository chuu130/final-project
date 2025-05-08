package kr.or.ddit.headquarter.common.service;

import java.util.List;

import kr.or.ddit.vo.AdminRefundVO;

public interface AdminRefundService {

	/**
	 * 회원이 신청한 환불 리스트를 본사에서 조회하는 기능
	 * @return
	 */
	public List<AdminRefundVO> selectRefundList();
}
