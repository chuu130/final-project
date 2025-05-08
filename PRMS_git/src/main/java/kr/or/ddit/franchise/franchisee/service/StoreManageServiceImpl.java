package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.StoremanageDefaultMapper;
import kr.or.ddit.vo.def.StoremanageDefaultVO;

@Service
public class StoreManageServiceImpl implements StoreManageService {

	@Autowired
	private StoremanageDefaultMapper mapper;


	@Override
	public int insertStoremanage(StoremanageDefaultVO storemanageVO) {
		return mapper.insertStoremanage(storemanageVO);
	}

	@Override
	public StoremanageDefaultVO selectStoremanage(String storemanageNo) {
		return mapper.selectStoremanage(storemanageNo);
	}

	@Override
	public List<StoremanageDefaultVO> selectStoremanageList(String franchiseId) {
		return mapper.selectStoremanageList(franchiseId);
	}

	@Override
	public int updateStoremanage(StoremanageDefaultVO storemanageVO) {
		return mapper.updateStoremanage(storemanageVO);
	}

	@Override
	public int CHeckStoreManage(String storemanageNo) {
		int cnt = mapper.CHeckStoreManage(storemanageNo);
		return cnt;
	}

	@Override
	public int deleteStoremanage(String storemanageNo) {
		return mapper.deleteStoremanage(storemanageNo);
	}

	@Override
	public List<StoremanageDefaultVO> StoremanageList() {
		return mapper.StoremanageList();
	}



}
