package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.headquarter.master.mapper.SalesMapper;
import kr.or.ddit.vo.AdminSalesVO;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesMapper mapper;

	@Override
	public List<AdminSalesVO> retrieveMonthSelling() {
		return mapper.selectMonthSelling();
	}

	@Override
	public List<AdminSalesVO> retrieveMonthExpense() {
		return mapper.selectMonthExpense();
	}

	@Override
	public List<AdminSalesVO> selectByTop5ProdList() {
		return mapper.selectByTop5ProdList();
	}

	@Override
	public List<AdminSalesVO> selectByProdSalesList() {
		return mapper.selectByProdSalesList();
	}



}
