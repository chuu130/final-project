package kr.or.ddit.market.common.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

public interface ProdService {
//	기존 CRUD
	public void createProd(ProdDefaultVO prod);
	public ProdDefaultVO retrieveProd(String prodId) throws PkNotFoundException;
	public List<ProdDefaultVO> retrieveProdList();
	public void modifyProd(ProdDefaultVO prod);



	/**
	 * 마켓 상품 검색리스트 출력
	 * @param paging
	 * @return
	 */
	public List<AdmininvDefaultVO> searchProdList(PaginationInfo paging);

}
