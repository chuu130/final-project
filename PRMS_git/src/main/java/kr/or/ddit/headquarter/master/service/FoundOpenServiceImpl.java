package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FoundDefaultMapper;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Service
public class FoundOpenServiceImpl implements FoundOpenService {

	@Autowired
	@Qualifier("foundDefaultMapper")
	private FoundDefaultMapper mapper;

	@Override
	public List<FoundDefaultVO> selectFoundList() {

		return mapper.selectFoundList();
	}

	@Override
	public int deleteFound(String foundNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFound(FoundDefaultVO foundVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FoundDefaultVO selectFound(String foundNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFound(FoundDefaultVO foundVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
