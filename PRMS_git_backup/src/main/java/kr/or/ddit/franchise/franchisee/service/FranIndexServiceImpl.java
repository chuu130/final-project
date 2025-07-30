package kr.or.ddit.franchise.franchisee.service;

import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.franchisee.mapper.FranIndexMapper;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FranIndexServiceImpl implements FranIndexService {

	private final FranIndexMapper franIndexMapper;

	@Override
	public int retrieveTotalRevenue(EmployeeDefaultVO fran) {
		return franIndexMapper.selectTotalRevenue(fran);
	}

	@Override
	public int retrieveProductRevenue(EmployeeDefaultVO fran) {
		return franIndexMapper.selectProductRevenue(fran);
	}

	@Override
	public int retrieveBeautyRevenue(EmployeeDefaultVO fran) {
		return franIndexMapper.selectBeautyRevenue(fran);
	}

	@Override
	public int retrieveHotelRevenue(EmployeeDefaultVO fran) {
		return franIndexMapper.selectHotelRevenue(fran);
	}


}
