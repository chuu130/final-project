package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.HeadquarterProdVO;

public interface HeadquarterProdService {

	public List<HeadquarterProdVO> selectHeadquarterProdList(PaginationInfo paging, int firstRecord, int lastRecord);
	
	public HeadquarterProdVO selectProdDetail(String prodId);
	
	public List<HeadquarterProdVO> selectProdDropdownList(String name, int firstRecord, int lastRecord, PaginationInfo paging);
	
}
