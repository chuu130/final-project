package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.CenterDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.CenterDefaultVO;

@Service
public class CenterBoardServiceImpl implements CenterBoardService {
	
	@Autowired
	private CenterDefaultMapper mapper;

	@Override
	public int removeCenterBoard(String ctrBbsNo) {
		return mapper.deleteCenterBoard(ctrBbsNo);
	}

	@Override
	public int registerCenterBoard(CenterDefaultVO row) {
		return mapper.insertCenterBoard(row);
	}

	@Override
	public CenterDefaultVO retrieveByctrBbsNo(String ctrBbsNo) {
		return mapper.selectByctrBbsNo(ctrBbsNo);
	}

	/**
	 * 회원문의글 전체조회
	 */
	@Override
	public List<CenterDefaultVO> retrieveAllCenterBoard(PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		return mapper.selectAllCenterBoard(paging);
	}

	@Override
	public int modifyCenterBoard(CenterDefaultVO row) {
		return mapper.updateCenterBoard(row);
	}

	@Override
	public List<CenterDefaultVO> retrieveAllCenterNonPaging() {
		return mapper.selectAllCenterNonPaging();
	}

}
