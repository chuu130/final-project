package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranHeadInvMapper;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Service
public class FranHeadInvServiceImpl implements FranHeadInvService {

	@Autowired
	FranHeadInvMapper mapper;

	@Override
	public List<ProdDefaultVO> retrieveFranHeadInvList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranHeadInvList(paging);
	}

}
