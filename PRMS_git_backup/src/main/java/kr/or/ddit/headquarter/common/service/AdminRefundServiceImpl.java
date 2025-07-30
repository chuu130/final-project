package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.headquarter.common.mapper.AdminRefundMapper;
import kr.or.ddit.vo.AdminRefundVO;

@Service
public class AdminRefundServiceImpl implements AdminRefundService{
	
	@Autowired
	private AdminRefundMapper mapper;

	@Override
	public List<AdminRefundVO> selectRefundList() {
		List<AdminRefundVO> refundList = mapper.selectRefundList();
		return refundList;
	}

}
