package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.MemberaddressDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;

@Service
public class MemberAddressServiceImpl implements MemberAddressService{

	@Autowired
	private MemberaddressDefaultMapper mapper;

	@Override
	public int deleteAddress(String memAddId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAddress(MemberaddressDefaultVO addrVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberaddressDefaultVO selectAddress(String memAddId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberaddressDefaultVO> selectAddressList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateAddress(MemberaddressDefaultVO addrVO) {
		int cnt = mapper.updateAddress(addrVO);
		return cnt;
	}

	@Override
	public MemberaddressDefaultVO selectAddressMemNo(String memNo) {
		MemberaddressDefaultVO addrVO = mapper.selectAddressMemNo(memNo);
		if(addrVO == null) {
			throw new PkNotFoundException(addrVO.getMemNo());
		}
		return addrVO;
	}
}
