package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.headquarter.master.mapper.FoundApproveMapper;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Service
public class FoundApproveServiceImpl implements FoundApproveService {

	@Autowired
	FoundApproveMapper mapper;

	public List<FoundDefaultVO> retrieveFoundApproveList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFoundApproveList(paging);
	}

	@Override
	public void modifyApproveFound(String foundNo, String empNo, String foundDe) {
		mapper.updateApproveFound(foundNo, empNo, foundDe);

	}
}
