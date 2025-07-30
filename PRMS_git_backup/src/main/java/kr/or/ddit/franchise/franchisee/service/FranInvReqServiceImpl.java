package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.franchise.franchisee.mapper.FranInvReqMapper;
import kr.or.ddit.vo.def.FiorderDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

@Service
public class FranInvReqServiceImpl implements FranInvReqService {

	@Autowired
	FranInvReqMapper mapper;

	@Override
	public void createFranInvReq(InvrequestDefaultVO invReq, String empId) {
		mapper.insertFranInvReq(invReq,empId);
	}

	@Override
	public List<InvrequestDefaultVO> retrieveInvReqList(HashMap<String, Object> inputData) {
		PaginationInfo paging = (PaginationInfo) inputData.get("paging");
		String franchiseId = (String) inputData.get("franchiseId");
		int totalRecord = mapper.selectTotalRecord(paging, franchiseId);
		paging.setTotalRecord(totalRecord);
		return mapper.selectFranInvReqList(inputData);
	}

	@Override
	public List<FiorderDefaultVO> retrieveFiOrderList(String fireqId) {
		if(fireqId == null) {
			throw new PkNotFoundException(fireqId);
		}
		return mapper.selectFiOrderList(fireqId);
	}

	@Override
	public void modifyInvReq(String fireqId, String fireqSttus) {
		mapper.updateInvReq(fireqId, fireqSttus);

	}

	@Override
	public void createFranApplyInvReqExp(InvrequestDefaultVO invReq) {
		mapper.insertFranApplyInvReqExp(invReq);

	}

	@Override
	public void createAdminApplyInvReqSell(InvrequestDefaultVO invReq) {
		mapper.insertAdminApplyInvReqSell(invReq);

	}

	@Override
	public void createMyHeadInvReqReturnSell(String fireqId) {
		mapper.insertMyHeadInvReqReturnSell(fireqId);

	}

	@Override
	public void createAdminHeadInvReqReturnExp(String fireqId) {
		mapper.insertAdminHeadInvReqReturnExp(fireqId);
	}

}
