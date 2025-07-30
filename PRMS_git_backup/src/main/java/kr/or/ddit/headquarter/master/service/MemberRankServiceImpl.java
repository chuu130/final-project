package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.RankDefaultMapper;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.RankDefaultVO;

@Service
public class MemberRankServiceImpl implements MemberRankService {

	@Autowired
	private RankDefaultMapper mapper;

	@Override
	public int deleteByPrimaryKey(String memNo) {
		return 0;
	}

	@Override
	public int insert(RankDefaultVO row) {
		return 0;
	}

	@Override
	public RankDefaultVO selectByPrimaryKey(String memNo) {
		return null;
	}

	@Override
	public List<RankDefaultVO> selectAll() {
		return mapper.selectRankList();
	}

	@Override
	public int updateByPrimaryKey(RankDefaultVO row) {
		return 0;
	}
}