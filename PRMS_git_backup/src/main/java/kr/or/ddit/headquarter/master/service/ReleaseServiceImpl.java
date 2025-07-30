package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.ReleaseDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReleaseDefaultVO;

@Service
public class ReleaseServiceImpl implements ReleaseService{

	@Autowired
	private ReleaseDefaultMapper mapper;

	@Override
	public int insertRelease(ReleaseDefaultVO relVO) {
		int cnt = mapper.insertRelease(relVO);
		return cnt;
	}

	@Override
	public List<ReleaseDefaultVO> selectReleaseList(PaginationInfo paging) {
		paging.setTotalRecord(mapper.countRelease());
		return mapper.selectReleaseList(paging);
	}

	@Override
	public ReleaseDefaultVO selectRelease(String orderdetailNo) {
		ReleaseDefaultVO relVO = mapper.selectRelease(orderdetailNo);
		if(relVO == null) {
			throw new PkNotFoundException(relVO);
		}
		return relVO;
	}

	@Override
	public ReleaseDefaultVO selectReleaseDetail(String orderdetailNo) {
		ReleaseDefaultVO relVO = mapper.selectReleaseDetail(orderdetailNo);
		if(relVO == null) {
			throw new PkNotFoundException(relVO);
		}
		return relVO;
	}

	@Override
	public int updaterelStatus(String orderdetailNo) {
		int cnt = mapper.updaterelStatus(orderdetailNo);
		return cnt;
	}

	@Override
	public String checkYn(String orderdetailNo) {
		return mapper.checkYn(orderdetailNo);
	}


}
