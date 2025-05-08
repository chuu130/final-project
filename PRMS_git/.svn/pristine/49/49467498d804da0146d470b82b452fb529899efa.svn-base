package kr.or.ddit.franchise.staff.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.staff.mapper.StaffEmerFranInvMapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Service
public class StaffEmerFranInvServiceImpl implements StaffEmerFranInvService {

	@Autowired
	StaffEmerFranInvMapper mapper;

	@Override
	public List<InventoryDefaultVO> retrieveStaffEmerFranInvList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String what = (String) inputData.get("what");
		int totalRecord = mapper.selectTotalRecord(paging, what);
		paging.setTotalRecord(totalRecord);
		return mapper.selectStaffEmerFranInvList(inputData);
	}

	@Override
	public List<FranchiseDefaultVO> retrieveStaffFranchiseList(String franchiseId) {

		return mapper.selectStaffFranchiseList(franchiseId);
	}

}
