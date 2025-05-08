package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import kr.or.ddit.vo.def.StoremanageDefaultVO;

public interface StoreManageService {
	public int deleteStoremanage(String storemanageNo);

	public int insertStoremanage(StoremanageDefaultVO storemanageVO);

	public StoremanageDefaultVO selectStoremanage(String storemanageNo);

	public List<StoremanageDefaultVO> selectStoremanageList(String franchiseId);

	public int updateStoremanage(StoremanageDefaultVO storemanageVO);

	public int CHeckStoreManage(String storemanageNo);

	public List<StoremanageDefaultVO> StoremanageList();
}
