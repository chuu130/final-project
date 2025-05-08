package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.CounselDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.CounselDefaultVO;

@Service
public class CounselServiceImpl implements CounselService{

	@Autowired
	private CounselDefaultMapper mapper;

	@Override
	public int deleteCounsel(String counselNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCounsel(CounselDefaultVO couVO) {
		int cnt = mapper.insertCounsel(couVO);
		return cnt;
	}

	@Override
	public CounselDefaultVO selectCounsel(String counselNo) {
		CounselDefaultVO counVO = mapper.selectCounsel(counselNo);
		if(counVO == null) {
			throw new PkNotFoundException(counVO.getCounselNo());
		}
		return counVO;
	}

	@Override
	public List<CounselDefaultVO> selectCounselList() {
		return mapper.selectCounselList();
	}

	@Override
	public int updateCounsel(CounselDefaultVO couVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CHeckCounsel(String counselNo) {
		int cnt = mapper.CHeckCounsel(counselNo);
		return cnt;
	}

	@Override
	public List<CounselDefaultVO> counselAtList() {
		return mapper.counselAtList();
	}

	@Override
	public int counselAtUpdate(String counselNo) {
		int cnt = mapper.counselAtUpdate(counselNo);
		return cnt;
	}

	@Override
	public String selectCounselMax() {
		return mapper.selectCounselMax();
	}

	@Override
	public CounselDefaultVO selectCounselNo(String foundNo) {
		CounselDefaultVO counVO = mapper.selectCounselNo(foundNo);
		if(counVO == null) {
			throw new PkNotFoundException(counVO.getCounselNo());
		}
		return counVO;
	}


}
