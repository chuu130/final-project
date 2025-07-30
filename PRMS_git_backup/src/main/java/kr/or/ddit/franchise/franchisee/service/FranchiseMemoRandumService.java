package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import kr.or.ddit.vo.def.FranchiseDefaultVO;

public interface FranchiseMemoRandumService {

	/**
	 * franchiseId를 이용해 memoList 출력
	 */
	public List<FranchiseDefaultVO> selectfranmemoList(String franchiseId);

}
