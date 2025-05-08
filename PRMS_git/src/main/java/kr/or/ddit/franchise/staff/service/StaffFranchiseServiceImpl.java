package kr.or.ddit.franchise.staff.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.staff.mapper.StaffFranchiseMapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Service
public class StaffFranchiseServiceImpl implements StaffFranchiseService {

	@Autowired
	StaffFranchiseMapper mapper;

	@Override
	public List<FranchiseDefaultVO> retrieveStaffFranchiseList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String empId = (String) inputData.get("empId");
		int totalRecord = mapper.selectTotalRecord(paging, empId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectStaffFranchiseList(inputData);
	}

}
