package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.headquarter.common.mapper.AdminDeliveryMapper;
import kr.or.ddit.vo.AdminDeliveryVO;

@Service
public class AdminDeliveryServiceImpl implements AdminDeliveryService{


	@Autowired
	private AdminDeliveryMapper mapper;

	@Override
	public List<AdminDeliveryVO> selectDeliveryList() {
		List<AdminDeliveryVO> deliveryList = mapper.selectDeliveryList();
		return deliveryList;
	}

	@Override
	public List<AdminDeliveryVO> selectInDeliveryList() {
		List<AdminDeliveryVO> IndeliveryList = mapper.selectInDeliveryList();
		return IndeliveryList;
	}

	@Override
	public List<AdminDeliveryVO> selectDeliveryCompleteList() {
		List<AdminDeliveryVO> deliveryCompleteList = mapper.selectDeliveryCompleteList();
		return deliveryCompleteList;
	}


}
