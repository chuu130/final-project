package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranEmergencyMapper;
import kr.or.ddit.vo.def.EmergencyDefaultVO;
import kr.or.ddit.vo.def.EmergencydtDefaultVO;

@Service
public class FranEmergencyServiceImpl implements FranEmergencyService {

	@Autowired
	FranEmergencyMapper mapper;

	@Override
	public void createFranEmer(EmergencyDefaultVO emergnecy) {
		mapper.insertFranEmer(emergnecy);
	}

	@Override
	public List<EmergencyDefaultVO> retrieveFranEmerFranInvApplyList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranEmerFranInvApplyList(inputData);
	}

	@Override
	public List<EmergencydtDefaultVO> retrieveEmerDtList(String emerNo) {
		if(emerNo == null) {
			throw new PkNotFoundException(emerNo);
		}
		return mapper.selectEmerDtList(emerNo);
	}

	@Override
	public void modifyEmerApply(String emerNo, String emerPartn) {
		mapper.updateEmerApply(emerNo, emerPartn);

	}

	@Override
	public void createMyFranEmerApplyExp(EmergencyDefaultVO emergnecy) {
		mapper.insertMyFranEmerApplyExp(emergnecy);

	}

	@Override
	public void createOtherFranEmerApplySell(EmergencyDefaultVO emergnecy) {
		mapper.insertOtherFranEmerApplySell(emergnecy);

	}

	@Override
	public void createMyFranEmerApplyReturnSell(String emerNo) {
		mapper.insertMyFranEmerApplyReturnSell(emerNo);

	}

	@Override
	public void createOtherFranEmerApplyReturnExp(String emerNo) {
		mapper.insertOtherFranEmerApplyReturnExp(emerNo);

	}

	@Override
	public String retrieveYourEmpIdInfo(String reqFranchiseId) {
		return mapper.selectYourEmpIdInfo(reqFranchiseId);

	}

}
