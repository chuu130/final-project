package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FranchiseDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Service
public class FranchiseServiceImpl implements FranchiseService{

	@Autowired
	private FranchiseDefaultMapper mapper;

	@Override
	public int deleteFranchise(String franchiseId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFranchise(FranchiseDefaultVO franchise) {
		int cnt = mapper.insertFranchise(franchise);
		return cnt;
	}

	@Override
	public FranchiseDefaultVO selectFranchise(String franchiseId) {
		FranchiseDefaultVO franVO = mapper.selectFranchise(franchiseId);
		if(franVO == null) {
			throw new PkNotFoundException(franVO.getFranchiseId());
		}
		return franVO;
	}

	@Override
	public List<FranchiseDefaultVO> selectFranchiseList(PaginationInfo paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFranchise(FranchiseDefaultVO franchise) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHotelCnt(String franchiseId) {
		// TODO Auto-generated method stub

	}

	@Override
	public int selectTotalRecord(PaginationInfo paging) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FranchiseDefaultVO> selectbeautyList(String franchiseId) {
		return mapper.selectbeautyList(franchiseId);
	}

	@Override
	public List<FranchiseDefaultVO> selecthotelList(String franchiseId) {
		return mapper.selecthotelList(franchiseId);
	}

	@Override
	public List<FranchiseDefaultVO> selectfranchiseclose() {
		return mapper.selectfranchiseclose();
	}

	@Override
	public int franchiseClose(String franchiseId) {
		int cnt = mapper.franchiseClose(franchiseId);
		return cnt;
	}

	@Override
	public int countfran() {
		int francnt = mapper.countfran();
		return francnt;
	}

	@Override
	public List<FranchiseDefaultVO> selectFranchiseEmployees(String franchiseId) {
		return mapper.selectFranchiseEmployees(franchiseId);
	}



}
