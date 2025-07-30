package kr.or.ddit.franchise.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.InvrequestDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

@Service
public class InvRequestServiceImpl implements InvRequestService{

	@Autowired
	private InvrequestDefaultMapper mapper;

	@Override
	public int deleteInvrequest(String fireqId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertInvrequest(InvrequestDefaultVO reqVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public InvrequestDefaultVO selectInvrequest(String fireqId) {
		InvrequestDefaultVO reqVO = mapper.selectInvrequest(fireqId);
		if(reqVO == null) {
			throw new PkNotFoundException(reqVO.getFireqId());
		}
		return reqVO;
	}

	@Override
	public List<InvrequestDefaultVO> selectInvrequestList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInvrequest(InvrequestDefaultVO reqVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStatus(InvrequestDefaultVO reqVO) {
		int cnt = mapper.updateStatus(reqVO);
		return cnt;
	}

}
