package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.MemberDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.market.member.mapper.MemberPurchasingCommonMapper;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDefaultMapper mapper;

	@Autowired
	private MemberPurchasingCommonMapper memberPurchasingCommonMapper;

	@Override
	public int deleteMember(String memNo) {
		int cnt = mapper.deleteMember(memNo);
		return cnt;
	}

	@Override
	public int insertMember(MemberDefaultVO memVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDefaultVO selectMember(String memNo) {
		MemberDefaultVO memVO = mapper.selectMember(memNo);
		if(memVO == null) {
			throw new PkNotFoundException(memVO.getMemNo());
		}
		return memVO;
	}

	@Override
	public List<MemberDefaultVO> selectMemberListPaging(PaginationInfo paging) {
		paging.setTotalRecord(mapper.countMember());
		return mapper.selectMemberListPaging(paging);
	}

	@Override
	public List<MemberDefaultVO> selectMemberList() {
		return mapper.selectMemberList();
	}

	@Override
	public int updateMember(MemberDefaultVO memVO) {
		int cnt = mapper.updateMember(memVO);
		return cnt;
	}

	@Override
	public MemberDefaultVO selectMemberId(String memId) {
		MemberDefaultVO memVO = mapper.selectMemberId(memId);
		if(memVO == null) {
			throw new PkNotFoundException(memVO.getMemId());
		}
		return memVO;
	}

	@Override
	public MemberDefaultVO selectMemOrder(String memNo) {
		MemberDefaultVO memVO = mapper.selectMemOrder(memNo);
		if(memNo == null) {
			throw new PkNotFoundException(memVO.getMemNo());
		}
		return memVO;
	}

	@Override
	public List<String> memBirthdy() {
		return mapper.memBirthdy();
	}

	@Override
	public List<MemorderDefaultVO> retrieveMemOrderList(String memNo) {
		return memberPurchasingCommonMapper.selectMemOrderList(memNo);
	}

	@Override
	public List<MemberDefaultVO> payment(String memNo) {
		return  mapper.payment(memNo);
	}

	@Override
	public List<MemberDefaultVO> selectMemberranklist() {

		return mapper.selectMemberranklist();
	}

	@Override
	public String checkMempass(String memNo) {
		return mapper.checkMempass(memNo);
	}

	@Override
	public List<MemorderDefaultVO> retrieveMemOrderDlvySttusList(String dlvySttus) {

		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper memberVOWrapper = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());

		log.info("회원정보 : {}", memberVOWrapper);

		String memNo = memberVOWrapper.getRealUser().getMemNo();

		DeliveryDefaultVO delivery = new DeliveryDefaultVO();
		delivery.setDlvySttus(dlvySttus);

		MemberDefaultVO member = new MemberDefaultVO();
		member.setMemNo(memNo);

		MemorderDefaultVO memOrder = new MemorderDefaultVO();
		memOrder.setDelivery(delivery);
		memOrder.setMember(member);

		return mapper.selectDlvySttusMemOrderList(memOrder);
	}

	@Override
	public List<ProdDefaultVO> retrieveLatestProdList() {
		return mapper.selectLatestProdList();
	}
}
