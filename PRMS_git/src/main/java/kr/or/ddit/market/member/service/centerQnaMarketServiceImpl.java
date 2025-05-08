package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.CenterDefaultMapper;
import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.vo.def.CenterDefaultVO;

@Service
public class centerQnaMarketServiceImpl implements centerQnaMarketService {
	
	@Autowired
	CenterDefaultMapper centerMapper;
	
	@Autowired
	private QnaService qnaService;
	

	@Override
	public int removeCenterBoard(String ctrBbsNo) {
		return centerMapper.deleteCenterBoard(ctrBbsNo);
	}

	@Override
	public int registerCenterBoard(CenterDefaultVO row) {
		return centerMapper.insertCenterBoard(row);
	}

	@Override
	public CenterDefaultVO retrieveByctrBbsNo(String ctrBbsNo) {
		return centerMapper.selectByctrBbsNo(ctrBbsNo);
	}


	@Override
	public int modifyCenterBoard(CenterDefaultVO row) {
		return centerMapper.updateCenterBoard(row);
	}

	@Override
	public List<CenterDefaultVO> retrieveAllMergeBoard() {
        return centerMapper.selectAllMergeBoard();
	}
}
