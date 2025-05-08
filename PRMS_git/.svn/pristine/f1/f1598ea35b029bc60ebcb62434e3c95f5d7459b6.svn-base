package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.RankDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.def.RankDefaultVO;

@Service
public class RankServiceImpl implements RankService{

	@Autowired
	private RankDefaultMapper mapper;

	@Override
	public int deleteRank(String memNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRank(RankDefaultVO rankVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RankDefaultVO selectRank(String memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankDefaultVO> selectRankList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateRank(RankDefaultVO rankVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectRankSE(String memNo) {
		return mapper.selectRankSE(memNo);
	}

	@Override
	public int updateRankgold(String memNo) {
		int cnt = mapper.updateRankgold(memNo);
		return cnt;
	}

	@Override
	public int updateRankplatinum(String memNo) {
		int cnt = mapper.updateRankplatinum(memNo);
		return cnt;
	}

	@Override
	public int updateRankdiamond(String memNo) {
		int cnt = mapper.updateRankdiamond(memNo);
		return cnt;
	}
}
