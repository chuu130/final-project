package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranEmerApproveMapper;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Service
public class FranEmerApproveServiceImpl implements FranEmerApproveService {

	@Autowired
	FranEmerApproveMapper mapper;

	@Override
	public List<EmergencyDefaultVO> retrieveFranEmerFranInvApporveList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranEmerFranInvApproveList(inputData);
	}

	@Override
	public void modifyEmerApprove(String emerNo, String emerPartn) {
		mapper.updateEmerApprove(emerNo, emerPartn);
	}

	@Override
	public void modifyMyFranEmerApproveInv(String emerNo) {
		mapper.updateMyFranEmerApproveInv(emerNo);

	}

	@Override
	public void modifyOtherFranEmerApporveInv(String emerNo) {
		mapper.updateOtherFranEmerApporveInv(emerNo);
	}

	@Override
	public void createMyFranEmerApproveExp(String emerNo) {
		mapper.insertMyFranEmerApproveExp(emerNo);

	}

	@Override
	public void createOtherFranEmerApproveSell(String emerNo) {
		mapper.insertOtherFranEmerApproveSell(emerNo);
	}

	@Override
	public void modifyEmerFranInvStatus(EmergencyDefaultVO emer) {
		mapper.updateEmerFranInvStatus(emer);
	}

	@Override
	public String retrieveApproveYourEmpId(String emerNo) {
		return mapper.selectApproveYourEmpId(emerNo);
	}

}
