package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.vo.def.MemberaddressDefaultVO;

public interface MemberAddressService {
	public int deleteAddress(String memAddId);

    public int insertAddress(MemberaddressDefaultVO addrVO);

    public MemberaddressDefaultVO selectAddress(String memAddId);

    public MemberaddressDefaultVO selectAddressMemNo(String memNo);

    public List<MemberaddressDefaultVO> selectAddressList();

    public int updateAddress(MemberaddressDefaultVO addrVO);
}
