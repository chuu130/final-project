package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.MaintainDefaultVO;

public interface MainTainService {
	 int deleteByPrimaryKey(String maintNo);

	    int insert(MaintainDefaultVO row);

	    MaintainDefaultVO selectByPrimaryKey(String maintNo);

	    List<MaintainDefaultVO> selectAll();

	    int updateByPrimaryKey(MaintainDefaultVO row);
}
