package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranFranInvMapper;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Service
public class FranFranInvServiceImpl implements FranFranInvService {

	@Autowired
	FranFranInvMapper mapper;

	@Override
	public List<InventoryDefaultVO> retrieveFranFranInvList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranFranInvList(inputData);
	}

	@Override
	public void modifyFranInvDispose(InventoryDefaultVO inventory) {
		mapper.updateFranInvDispose(inventory);
	}

	@Override
	public void modifyFranInvReturn(InventoryDefaultVO inventory) {
		mapper.updateFranInvReturn(inventory);
	}

	@Override
	public void modifyAdminInvReturn(InventoryDefaultVO inventory) {
		mapper.updateAdminInvReturn(inventory);

	}

	@Override
	public void createFranReturnSell(InventoryDefaultVO inventory, String franchiseId) {
		mapper.insertFranReturnSell(inventory, franchiseId);
	}

	@Override
	public void createAdminReturnExp(InventoryDefaultVO inventory) {
		mapper.insertAdminReturnExp(inventory);
	}



}
