package kr.or.ddit.franchise.common.service;

import java.util.List;

import kr.or.ddit.vo.def.FiorderDefaultVO;

public interface FiorderService {
	public int deleteFiorder(String orderdetailNo);

    public int insertFiorder(FiorderDefaultVO FioVO);

    public FiorderDefaultVO selectFiorder(String orderdetailNo);

    public List<FiorderDefaultVO> selectFiorderList();

    public int updateFiorder(FiorderDefaultVO FioVO);
}
