package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.ContractDefaultVO;

public interface ContractService {
	public int deleteContract(String contractNo);

    public int insertContract(ContractDefaultVO conVO);

    public ContractDefaultVO selectContract(String contractNo);

    public List<ContractDefaultVO> selectContractList();

    public int updateContract(ContractDefaultVO conVO);
}
