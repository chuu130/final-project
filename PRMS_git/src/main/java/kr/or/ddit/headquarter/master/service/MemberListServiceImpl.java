package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.MemberDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.MemberDefaultVO;



@Service
public class MemberListServiceImpl implements MemberListService {
	@Autowired
	private MemberDefaultMapper mapper;

	@Override
	public int deleteMember(String memNo) {
		return 0;
	}

	@Override
	public int insertMember(MemberDefaultVO memVO) {
		return 0;
	}

	@Override
	public MemberDefaultVO selectMember(String memNo) {
		return null;
	}

	@Override
	public List<MemberDefaultVO> selectMemberListPaging(PaginationInfo paging) {
		paging.setTotalRecord(mapper.countMember());
		return mapper.selectMemberListPaging(paging);
	}

	@Override
	public int updateMember(MemberDefaultVO memVO) {
		return 0;
	}

	@Override
	public List<MemberDefaultVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

}
