package kr.or.ddit.market.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.market.common.mapper.ProdMapper;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Service
public class ProdServiceImpl implements ProdService {

	@Autowired
	private ProdMapper mapper;

	@Override
	public void createProd(ProdDefaultVO prod) {
		mapper.insertProd(prod);
	}

	@Override
	public ProdDefaultVO retrieveProd(String prodId) throws PkNotFoundException {
		if(prodId == null) {
			throw new PkNotFoundException(prodId);
		}
		return mapper.selectProd(prodId);
	}

	@Override
	public List<ProdDefaultVO> retrieveProdList() {
		return mapper.selectProdList();
	}

	@Override
	public void modifyProd(ProdDefaultVO prod) {
		mapper.updateProd(prod);
	}

	@Override
	public List<AdmininvDefaultVO> searchProdList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.searchProdList(paging);
	}


}
