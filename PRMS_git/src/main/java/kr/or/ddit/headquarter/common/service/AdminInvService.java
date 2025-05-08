package kr.or.ddit.headquarter.common.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminInvDataDetailVO;
import kr.or.ddit.vo.AdminInvDataVO;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

public interface AdminInvService {
	public int insertAdminInv(AdmininvDefaultVO invVO);
	public List<AdmininvDefaultVO> selectAdminInvList(PaginationInfo paging);
	public int updateAdminInv(AdmininvDefaultVO invVo);
	public int deleteAdminInv(String prodId);
	public AdmininvDefaultVO selectAdminInv(String prodId);

	/**
	 * 본사 재고관리 상품 리스트 출력
	 * @param paging
	 * @return
	 */
	public List<AdminInvVO> selectAdminInvProdList();

	/**
	 * 마켓 상품검색 리스트
	 * @param paging
	 * @return
	 */
	public List<AdmininvDefaultVO> searchProdList(PaginationInfo paging);


	public  List<AdminInvDataDetailVO> selectProdDetail(String prodId);

	public int updateAdminInvQy(AdminInvVO adminInv);

	public List<AdminInvDataVO> selectDataTable();

	public List<AdminInvDataVO> selectDataTableDropdown(String name);

	public int CheckAdminIv(String prodId);

}
