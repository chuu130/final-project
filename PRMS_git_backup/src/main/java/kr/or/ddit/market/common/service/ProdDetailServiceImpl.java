package kr.or.ddit.market.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.market.common.mapper.ProdDetailMapper;
import kr.or.ddit.market.member.mapper.MemberCartMapper;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CartDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;

@Service
public class ProdDetailServiceImpl implements ProdDetailService{

	@Autowired
	private ProdDetailMapper mapper;

	@Autowired
	private MemberCartMapper cartMapper;

	@Override
	public AdmininvDefaultVO retrieveProd(String prodId) {
		return mapper.selectProd(prodId);
	}

	@Override
	public List<ProdDefaultVO> retrieveSimilarProdList(ProdDefaultVO detailProd) {
		return mapper.selectSimilarProdList(detailProd);
	}

	@Override
	public List<ReviewDefaultVO> retrieveReviewList(String prodId) {
		return mapper.selectReviewList(prodId);
	}

	@Override
	public ServiceResult addCart(CartDefaultVO newCart) {

		ServiceResult serviceResult = ServiceResult.OK;

		List<CartVO> cartList = cartMapper.selectCartList(newCart.getMemNo());

		for(CartVO cart : cartList) {
			if(!cart.getProdId().equals(newCart.getProdId())) {
				serviceResult = ServiceResult.OK;
			}
			else{
				serviceResult = ServiceResult.FAILED;
				break;
			}
		}

		if(serviceResult.equals(ServiceResult.OK)) {
			mapper.insertCart(newCart);
			return serviceResult;
		}else {
			return serviceResult;

		}


	}

}
