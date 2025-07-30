package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.headquarter.common.mapper.HeadquarterProdMapper;
import kr.or.ddit.vo.HeadquarterProdVO;

@Service
public class HeadquarterProdServiceImpl implements HeadquarterProdService{

	@Autowired
	private HeadquarterProdMapper mapper;
	

	@Override
	public List<HeadquarterProdVO> selectHeadquarterProdList(PaginationInfo paging,int firstRecord,int lastRecord) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		List<HeadquarterProdVO> InvProdList = mapper.selectHeadquarterProdList(paging, firstRecord, lastRecord);
		return InvProdList;
	}


	@Override
	public HeadquarterProdVO selectProdDetail(String prodId) {
		HeadquarterProdVO prod = mapper.selectProdDetail(prodId);
		return prod;
	}


	@Override
	public List<HeadquarterProdVO> selectProdDropdownList(String name, int firstRecord, int lastRecord, PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectDrowdownTotalRecord(name));
		List<HeadquarterProdVO> prodDropdownList = mapper.selectProdDropdownList(name, firstRecord, lastRecord, paging);
		return prodDropdownList;
	}

}
