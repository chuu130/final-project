package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranEmerFranInvMapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Service
public class FranEmerFranInvServiceImpl implements FranEmerFranInvService {

	@Autowired
	FranEmerFranInvMapper mapper;

	@Override
	public List<InventoryDefaultVO> retrieveFranEmerFranInvList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String what = (String) inputData.get("what");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, what, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranEmerFranInvList(inputData);
	}

	@Override
	public List<FranchiseDefaultVO> retrieveFranFranchiseList(String franchiseId) {

		return mapper.selectFranFranchiseList(franchiseId);
	}

}
