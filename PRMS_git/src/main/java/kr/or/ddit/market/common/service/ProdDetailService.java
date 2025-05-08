package kr.or.ddit.market.common.service;

import java.util.List;
import java.util.Set;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CartDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;

/**
 * 본사재고에 있는 마켓상품의 상세정보와 관련된 서비스
 * @author jbk
 *
 */
public interface ProdDetailService {

	/**
	 * 본사재고에 있는 마켓상품의 상세정보를 조회하는 메소드
	 * @return
	 */
	public AdmininvDefaultVO retrieveProd(String prodId);


	/**
	 * 상세상품정보와 비슷한 상품리스트를 조회하는 메소드
	 * @param detailProd
	 * @return
	 */
	public List<ProdDefaultVO> retrieveSimilarProdList(ProdDefaultVO detailProd);
	
	
	/**
	 * 회원번호로 회원의 상품정보와 리뷰정보를 조회하는 메소드
	 * @param prodId
	 * @return
	 */
	public List<ReviewDefaultVO> retrieveReviewList(String memNo);
	

	/**
	 * 해당 상품을 장바구니에 추가하는 메소드
	 * @return
	 */
	public ServiceResult addCart(CartDefaultVO newCart);
}
