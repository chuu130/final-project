package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.FranauditDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.headquarter.common.mapper.FranAuditMapper;
import kr.or.ddit.vo.CheckListVO;
import kr.or.ddit.vo.FranAuditVO;
import kr.or.ddit.vo.FranchiseVO;
import kr.or.ddit.vo.def.FranauditDefaultVO;

@Service
public class FranauditServiceImpl implements FranauditService{

	@Autowired
	private FranAuditMapper mapper;

	@Override
	public List<FranAuditVO> selectAuditList(String date) {
		return mapper.selectAuditList(date);
	}

	@Override
	public List<FranchiseVO> selectFranchiseAuditList(String date) {
		return mapper.selectFranchiseAuditList(date);
	}

	@Override
	public CheckListVO selectFranAuditCheckList(String franId, String franDe) {
		return mapper.selectFranAuditCheckList(franId, franDe);
	}

	@Override
	public FranchiseVO selectFranchiseDetail(String franId) {
		return mapper.selectFranchiseDetail(franId);
	}

	@Override
	public void insertCheckListNo() {
		mapper.insertCheckListNo();
		
	}

	@Override
	public void updateAuditCheckNo(String franId, String franDe) {
		mapper.updateAuditCheckNo(franId, franDe);
		
	}

	@Override
	public void updateFranAudit(String text, String audit, String confirm, String checkNo) {
		mapper.updateFranAudit(text, audit, confirm, checkNo);
		
	}

	@Override
	public void updateCheckList(int r1, int r2, int r3, int r4, int r5, int r6, int r7, String checkNo) {
		mapper.updateCheckList(r1, r2, r3, r4, r5, r6, r7, checkNo);
		
	}

}
