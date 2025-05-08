package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.PartprodDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.ArticlePage;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.PartprodDefaultVO;

@Service
public class PartProdServiceImpl implements PartProdService{
	@Autowired
	private PartprodDefaultMapper mapper;

	@Override
	public int deletePartProd(String prodId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPartProd(PartprodDefaultVO prodVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PartprodDefaultVO selectPartProd(String prodId) {
		PartprodDefaultVO partprod = mapper.selectPartProd(prodId);
		if(partprod == null) {
			throw new PkNotFoundException(partprod);
		}
		return partprod;
	}

	@Override
	public List<PartprodDefaultVO> selectPartProdList() {
		return mapper.selectPartProdList();
	}

	@Override
	public int updatePartProd(PartprodDefaultVO prodVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PartprodDefaultVO> selectPartProdListPaging(PaginationInfo paging) {
		paging.setTotalRecord(mapper.countedPartProd());
		return mapper.selectPartProdListPaging(paging);
	}


}
