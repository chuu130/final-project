package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

public interface MemberService {
	public int deleteMember(String memNo);

    public int insertMember(MemberDefaultVO memVO);

    public MemberDefaultVO selectMember(String memNo);

    public MemberDefaultVO selectMemberId(String memId);

    public List<MemberDefaultVO> selectMemberList();

    public List<MemberDefaultVO> selectMemberListPaging(PaginationInfo paging);

    public int updateMember(MemberDefaultVO memVO);

    public MemberDefaultVO selectMemOrder(String memNo);

    public List<String> memBirthdy();

    public List<MemberDefaultVO> payment(String memNo);


    /**
     * 최근등록 상품을 기준으로 판매상품을 조회하는 메소드
     * @author jbk
     * @return
     */
    public List<ProdDefaultVO> retrieveLatestProdList();

	/**
	 * 회원의 전체 주문정보를 조회하는 메소드
	 * @author jbk
	 * @param memNo
	 * @return
	 */
	public List<MemorderDefaultVO> retrieveMemOrderList(String memNo);

	/**
	 * 배송상태에 따라 회원의 주문정보를 조회하는 메소드
	 * @author jbk
	 * @param dlvySttus
	 * @return
	 */
	public List<MemorderDefaultVO> retrieveMemOrderDlvySttusList(String dlvySttus);

	public List<MemberDefaultVO> selectMemberranklist();

	public String checkMempass(String memNo);

}
