package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.franchisee.mapper.FranMemoRandumMapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Service
public class FranchiseMemoRandumServiceImpl implements FranchiseMemoRandumService{

	@Autowired
	private FranMemoRandumMapper mapper;

	@Override
	public List<FranchiseDefaultVO> selectfranmemoList(String franchiseId) {
		return mapper.selectfranmemoList(franchiseId);
	}

}
