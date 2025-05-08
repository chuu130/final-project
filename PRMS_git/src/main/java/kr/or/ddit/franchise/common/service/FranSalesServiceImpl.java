package kr.or.ddit.franchise.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.common.mapper.FranSalesMapper;
import kr.or.ddit.vo.FranSalesVO;

@Service
public class FranSalesServiceImpl implements FranSalesService{
	
	@Autowired
	FranSalesMapper mapper;

	@Override
	public List<FranSalesVO> selectFranSalesFsel(String franId) {
		return mapper.selectFranSalesFsel(franId);
	}

	@Override
	public List<FranSalesVO> selectFranSalesFexps(String franId) {
		return mapper.selectFranSalesFexps(franId);
	}

	@Override
	public List<FranSalesVO> selectFranThisWeekFsel(String franId) {
		return mapper.selectFranThisWeekFsel(franId);
	}

	@Override
	public List<FranSalesVO> selectFranLastWeekFsel(String franId) {
		return mapper.selectFranLastWeekFsel(franId);
	}

	@Override
	public List<FranSalesVO> selectFranTopFiveProd(String franId) {
		return mapper.selectFranTopFiveProd(franId);
	}

	@Override
	public List<FranSalesVO> selectFranProdRate(String franId) {
		return mapper.selectFranProdRate(franId);
	}

	@Override
	public List<FranSalesVO> selectFranHotelState(String franId) {
		return mapper.selectFranHotelState(franId);
	}

	@Override
	public List<FranSalesVO> selectFranBeautyState(String franId) {
		return mapper.selectFranBeautyState(franId);
	}

	@Override
	public List<FranSalesVO> selectFranTopFirveProdName(String franId) {
		return mapper.selectFranTopFirveProdName(franId);
	}

	@Override
	public List<FranSalesVO> selectFranByProdSales(String franId) {
		return mapper.selectFranByProdSales(franId);
	}

}
