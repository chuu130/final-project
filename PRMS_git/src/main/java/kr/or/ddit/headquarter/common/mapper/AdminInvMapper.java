package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.def.mapper.AdmininvDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminInvDataDetailVO;
import kr.or.ddit.vo.AdminInvDataVO;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

@Mapper
public interface AdminInvMapper extends AdmininvDefaultMapper{


	/**
	 * admininv, partprod 조인한 결과 조회하는 쿼리문
	 * @return
	 */
	public List<AdminInvVO> selectAdminInvProdList();

	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectInvTotalRecord(PaginationInfo paging);

    /**
     * 상품검색
     * @param paging
     * @return
     */
    List<AdmininvDefaultVO> searchProdList(PaginationInfo paging);


    /**
     * 상품 재고관리페이지 상세정보
     * @param prodId
     * @return
     */
    public  List<AdminInvDataDetailVO> selectProdDetail(String prodId);


    /**
     * 본사 재고관리 상세페이지에서 상품재고 수량 업데이트
     * @param prodId
     * @param Qy
     * @return
     */
    public int updateAdminInvQy(AdminInvVO adminInv);


    public List<AdminInvDataVO> selectDataTable();

    public List<AdminInvDataVO> selectDataTableDropdown(String name);

	public int CheckAdminIv(String prodId);








}
