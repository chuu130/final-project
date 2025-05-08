package kr.or.ddit.franchise.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FiorderDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.def.FiorderDefaultVO;

@Service
public class FiorderServiceImpl implements FiorderService{

	@Autowired
	private FiorderDefaultMapper mapper;

	@Override
	public int deleteFiorder(String orderdetailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFiorder(FiorderDefaultVO FioVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FiorderDefaultVO selectFiorder(String orderdetailNo) {
		FiorderDefaultVO fioVO = mapper.selectFiorder(orderdetailNo);
		if(fioVO == null) {
			throw new PkNotFoundException(fioVO.getOrderdetailNo());
		}
		return fioVO;
	}

	@Override
	public List<FiorderDefaultVO> selectFiorderList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFiorder(FiorderDefaultVO FioVO) {
		// TODO Auto-generated method stub
		return 0;
}
}
