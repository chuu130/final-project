package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.BlacklistDefaultMapper;
import kr.or.ddit.vo.def.BlacklistDefaultVO;

@Service
public class BlackListServiceImpl implements BlackListservice {
	@Autowired
	private BlacklistDefaultMapper mapper;

	@Override
	public int deleteByPrimaryKey(String blacklistId) {
		return 0;
	}

	@Override
	public int insert(BlacklistDefaultVO row) {
		 int cnt = mapper.insert(row);
		return cnt;
	}

	@Override
	public BlacklistDefaultVO selectByPrimaryKey(String blacklistId) {
		return null;
	}

	@Override
	public List<BlacklistDefaultVO> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(BlacklistDefaultVO row) {
		return 0;
	}

	@Override
	public int checkMember(String memNo) {
		int cnt = mapper.checkMember(memNo);
		return cnt;
	}
}
