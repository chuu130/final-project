package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.SellingDefaultMapper;
import kr.or.ddit.vo.def.SellingDefaultVO;

@Service
public class SellingServiceImpl implements SellingService{

	@Autowired
	private SellingDefaultMapper mapper;

	@Override
	public int deleteByPrimaryKey(String selngNo, String hqId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(SellingDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SellingDefaultVO selectByPrimaryKey(String selngNo, String hqId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SellingDefaultVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKey(SellingDefaultVO row) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelling(SellingDefaultVO selVO) {
		int cnt = mapper.insertSelling(selVO);
		return cnt;
	}
}
