package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.headquarter.common.mapper.AdminInvMapper;
import kr.or.ddit.vo.AdminInvDataDetailVO;
import kr.or.ddit.vo.AdminInvDataVO;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

@Service
public class AdminInvServiceImpl implements AdminInvService{
	@Autowired
	private AdminInvMapper mapper;

	@Override
	public int insertAdminInv(AdmininvDefaultVO invVO) {
		int cnt = mapper.insertAdminInv(invVO);
		return cnt;
	}

	@Override
	public List<AdmininvDefaultVO> selectAdminInvList(PaginationInfo paging) {
		return mapper.selectAdminInvList(paging);
	}

	@Override
	public int updateAdminInv(AdmininvDefaultVO invVo) {
		int cnt = mapper.updateAdminInv(invVo);
		return cnt;
	}

	@Override
	public int deleteAdminInv(String prodId) {
		int cnt = mapper.deleteAdminInv(prodId);
		return cnt;
	}

	@Override
	public AdmininvDefaultVO selectAdminInv(String prodId) {
		AdmininvDefaultVO invVO = mapper.selectAdminInv(prodId);
		if(invVO == null) {
			return null;
//			throw new PkNotFoundException(prodId);
		}
		return invVO;
	}
	@Override
	public List<AdminInvVO> selectAdminInvProdList() {
		List<AdminInvVO> InvProdList = mapper.selectAdminInvProdList();
		return InvProdList;
	}



	@Override
	public List<AdmininvDefaultVO> searchProdList(PaginationInfo paging) {
		int totalRecord = mapper.selectInvTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.searchProdList(paging);
	}

	@Override
	public  List<AdminInvDataDetailVO> selectProdDetail(String prodId) {
		return mapper.selectProdDetail(prodId);
	}

	@Override
	public int updateAdminInvQy(AdminInvVO adminInv) {
		int cnt = mapper.updateAdminInvQy(adminInv);
		return cnt;
	}

	@Override
	public List<AdminInvDataVO> selectDataTable() {
		return mapper.selectDataTable();
	}

	@Override
	public List<AdminInvDataVO> selectDataTableDropdown(String name) {
		return mapper.selectDataTableDropdown(name);
	}

	@Override
	public int CheckAdminIv(String prodId) {
		int cnt = mapper.CheckAdminIv(prodId);
		return cnt;
	}







}
