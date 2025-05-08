package kr.or.ddit.franchise.staff.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.staff.mapper.StaffFranInvMapper;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Service
public class StaffFranInvServiceImpl implements StaffFranInvService {

	@Autowired
	StaffFranInvMapper mapper;

	@Override
	public List<InventoryDefaultVO> retrieveStaffFranInvList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectStaffFranInvList(inputData);
	}

}
