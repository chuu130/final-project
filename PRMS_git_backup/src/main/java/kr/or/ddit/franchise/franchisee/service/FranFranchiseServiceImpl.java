package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranFranchiseMapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Service
public class FranFranchiseServiceImpl implements FranFranchiseService {

	@Autowired
	FranFranchiseMapper mapper ;

	@Override
	public List<FranchiseDefaultVO> retrieveFranFranchiseList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String empId = (String) inputData.get("empId");
		int totalRecord = mapper.selectTotalRecord(paging, empId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranFranchiseList(inputData);
	}

	@Override
	public FranchiseDefaultVO retrieveMyFranchiseInfo(String franchiseId) {
		return mapper.selectMyFranchiseInfo(franchiseId);
	}

	@Override
	public List<FranchiseDefaultVO> retrieveKakaoFranchiseList(HashMap<String, Object> inputData) {
		return mapper.selectKakaoFranchiseList(inputData);
	}

}
