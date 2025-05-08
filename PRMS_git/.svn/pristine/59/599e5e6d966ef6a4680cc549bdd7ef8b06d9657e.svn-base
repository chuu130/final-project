package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.ContractDefaultMapper;
import kr.or.ddit.vo.def.ContractDefaultVO;

@Service
public class ContractServiceImpl implements ContractService{

	@Autowired
	private ContractDefaultMapper mapper;

	@Override
	public int deleteContract(String contractNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertContract(ContractDefaultVO conVO) {
		int cnt = mapper.insertContract(conVO);
		return cnt;
	}

	@Override
	public ContractDefaultVO selectContract(String contractNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContractDefaultVO> selectContractList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateContract(ContractDefaultVO conVO) {
		// TODO Auto-generated method stub
		return 0;
	}
}
