package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.FranchiseDefaultVO;

public interface FranFranchiseService {


	/**
	 * 점장 근처 가맹점 조회 메서드
	 * @param inputData
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveFranFranchiseList(HashMap<String, Object> inputData);

	/**
	 * 카카오맵 자기 가맹점 정보 메서드
	 * @param franchiseId
	 * @return
	 */
	public FranchiseDefaultVO retrieveMyFranchiseInfo(String franchiseId);

	/**
	 * 카카오맵 다른 가맹점 정보 메서드
	 * @param inputData
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveKakaoFranchiseList(HashMap<String, Object> inputData);
}
