package kr.or.ddit.headquarter.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FranchiseDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HeadquarterDefaultVO;

@Service
public class FranchiseInfoServiceImpl implements FranchiseInfoService {

	@Autowired
	private FranchiseDefaultMapper mapper;

	@Override
	public List<FranchiseDefaultVO> retrieveFranchiseList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranchiseList(paging);
	}

	@Override
	public FranchiseDefaultVO retrieveFranchiseDetail(String franchiseId) {
		FranchiseDefaultVO franchise = mapper.selectFranchise(franchiseId);
		if(franchise==null)
			throw new PkNotFoundException(franchiseId);
		return franchise;
	}

	@Override
	public void modifyFranchise(FranchiseDefaultVO franchise) {
		mapper.updateFranchise(franchise);
	}

	@Override
	public void modifyHotelCnt(String franchiseId) {
		HashMap<String, String> inputData = new HashMap<String, String>();
		inputData.put("franchiseId", franchiseId);
		mapper.updateHotelCnt(inputData);
	}

	@Override
	public List<FranchiseDefaultVO> retrieveFranchiseInfoList() {
		return mapper.selectFranchiseInfoList();
	}

	@Override
	public HeadquarterDefaultVO retrieveHeadInfo(String empId) {
		return mapper.selectHeadInfo(empId);
	}

}
