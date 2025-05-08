package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.FoundDefaultVO;

public interface FoundOpenService {

	public int deleteFound(String foundNo);

	public int insertFound(FoundDefaultVO foundVO);

	public FoundDefaultVO selectFound(String foundNo);

	public List<FoundDefaultVO> selectFoundList();

	public int updateFound(FoundDefaultVO foundVO);


}
