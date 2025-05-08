package kr.or.ddit.market.common.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CartDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;

/**
 * 본사재고에 있는 마켓상품의 상세정보와 관련된 매버
 * @author jbk
 *
 */
@Mapper
public interface ProdDetailMapper {

	/**
	 * 본사재고에 있는 마켓상품의 상세정보를 가져오는 메소드
	 * @param admininvDefaultVO
	 * @return
	 */
	public AdmininvDefaultVO selectProd(String prodId);


	/**
	 * 비슷한 상품정보를 조회하는 메소드
	 * @return
	 */
	public List<ProdDefaultVO> selectSimilarProdList(ProdDefaultVO prod);
	
	
	/**
	 * 상품아이디를 통해, 해당 상품의 리뷰정보를 조회하는 메소드
	 * @param prodId
	 * @return
	 */
	public List<ReviewDefaultVO> selectReviewList(String prodId);
	
	
	/**
	 * 마켓회원의 장바구니에 해당 상품과 수량을 추가한다.
	 * @param newCart
	 * @return
	 */
	public int insertCart(CartDefaultVO newCart);
	
	
	
}
