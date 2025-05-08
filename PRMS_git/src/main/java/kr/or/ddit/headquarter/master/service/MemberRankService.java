package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.RankDefaultVO;

public interface MemberRankService {
	public int deleteByPrimaryKey(String memNo);

	public int insert(RankDefaultVO row);

	public RankDefaultVO selectByPrimaryKey(String memNo);

	public List<RankDefaultVO> selectAll();

	public int updateByPrimaryKey(RankDefaultVO row);
}
