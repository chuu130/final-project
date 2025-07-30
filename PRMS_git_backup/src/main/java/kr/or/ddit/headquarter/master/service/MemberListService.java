package kr.or.ddit.headquarter.master.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.sun.istack.internal.Nullable;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.AtchfileDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

public interface MemberListService  {
	 public int deleteMember(String memNo);

	    public int insertMember(MemberDefaultVO memVO);

	    public MemberDefaultVO selectMember(String memNo);

	    public List<MemberDefaultVO> selectMemberList();

	    public List<MemberDefaultVO> selectMemberListPaging(PaginationInfo paging);

	    public int updateMember(MemberDefaultVO memVO);
}
