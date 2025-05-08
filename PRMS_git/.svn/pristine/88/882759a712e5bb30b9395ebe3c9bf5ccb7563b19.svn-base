package kr.or.ddit.franchise.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.InventoryDefaultMapper;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Service
public class InventoryServiceImpl implements InventoryService{

	@Autowired
	private InventoryDefaultMapper mapper;

	@Override
	public int deleteInventory(String fivId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertInventory(InventoryDefaultVO InvenVO) {
		int cnt = mapper.insertInventory(InvenVO);
		return cnt;
	}

	@Override
	public InventoryDefaultVO selectInventory(String fivId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InventoryDefaultVO> selectInventoryList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInventory(InventoryDefaultVO InvenVO) {
		int cnt = mapper.updateInventory(InvenVO);
		return cnt;
	}

	@Override
	public InventoryDefaultVO selectInvenPk(InventoryDefaultVO InvenVO) {
		InventoryDefaultVO invVO = mapper.selectInvenPk(InvenVO);
		return invVO;
	}

	@Override
	public int CheckPk(InventoryDefaultVO invenVO) {
		int cnt = mapper.CheckPk(invenVO);
		return cnt;
	}

}
