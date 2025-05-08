package kr.or.ddit.market.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.market.member.mapper.MemberWishListMapper;
import kr.or.ddit.vo.MemberWishListVO;

@Service
public class MemberWishListServiceImpl implements MemberWishListService{

	@Autowired
	private MemberWishListMapper mapper;

	@Override
	public List<MemberWishListVO> selectMemberWishList(String memNo) {
		return mapper.selectMemberWishList(memNo);
	}

	@Override
	public int selectWishListCount(String memNo) {
		return mapper.selectWishListCount(memNo);
	}

	@Override
	public int deleteMemberWishListProd(String memNo, String prodId) {
		return mapper.deleteMemberWishListProd(memNo, prodId);
	}

	@Override
	public void insertWishList(String memNo, String prodId) {
		mapper.insertWishList(memNo, prodId);
	}

	@Override
	public MemberWishListVO checkProdWishList(String memNo, String prodId) {
		return mapper.checkProdWishList(memNo, prodId);
	}
}
