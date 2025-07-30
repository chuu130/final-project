package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.AdminexpDefaultMapper;
import kr.or.ddit.vo.def.AdminexpDefaultVO;

@Service
public class AdminExpServiceImpl implements AdminExpService{

	@Autowired
	private AdminexpDefaultMapper mapper;

	@Override
	public int deleteAdminexp(String adminexpNo, String hqId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAdminexp(AdminexpDefaultVO adminExpVO) {
		int cnt = mapper.insertAdminexp(adminExpVO);
		return cnt;
	}

	@Override
	public AdminexpDefaultVO selectAdminexp(String adminexpNo, String hqId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdminexpDefaultVO> selectAdminexpList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateAdminexp(AdminexpDefaultVO adminExpVO) {
		// TODO Auto-generated method stub
		return 0;
	}
}
