package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Mapper
public interface MemberDefaultMapper {
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

	public List<MemberDefaultVO> selectMemberranklist();

	public int countMember();

	public String checkMempass(String memNo);


	/**
	 * 최근 등록일 기준으로 판매상품을 조회하는 메소드
	 * @return
	 */
	public List<ProdDefaultVO> selectLatestProdList();

	/**
	 * 배송상태에 해당하는 주문정보를 조회하는 메소드
	 * @param memOrder
	 * @return
	 */
	public List<MemorderDefaultVO> selectDlvySttusMemOrderList(MemorderDefaultVO memOrder);
}