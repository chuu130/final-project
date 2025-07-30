package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.headquarter.common.mapper.UnderPerformingFranchiseMapper;
import kr.or.ddit.vo.FranchiseVO;

@Service
public class UnderPerformingFranchiseServiceImpl implements UnderPerformingFranchiseSerivce{
	
	@Autowired
	UnderPerformingFranchiseMapper mapper;

	@Override
	public List<FranchiseVO> selectThisYearFranchiseSelling() {
		return mapper.selectThisYearFranchiseSelling();
	}

	@Override
	public List<FranchiseVO> selectLastYearFranchiseSelling() {
		return mapper.selectLastYearFranchiseSelling();
	}

	@Override
	public List<FranchiseVO> selectThisYearFranchiseExpense() {
		return mapper.selectThisYearFranchiseExpense();
	}

	@Override
	public List<FranchiseVO> selectLastYearFranchiseExpense() {
		return mapper.selectLastYearFranchiseExpense();
	}
	

}
