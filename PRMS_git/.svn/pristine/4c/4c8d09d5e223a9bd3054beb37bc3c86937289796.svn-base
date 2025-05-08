package kr.or.ddit.headquarter.common.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CheckListVO;
import kr.or.ddit.vo.FranAuditVO;
import kr.or.ddit.vo.FranchiseVO;
import kr.or.ddit.vo.def.FranauditDefaultVO;

public interface FranauditService {
	
	public List<FranAuditVO> selectAuditList(String date);
	
	public List<FranchiseVO> selectFranchiseAuditList(String date);
	
	public CheckListVO selectFranAuditCheckList(@Param("franId") String franId, @Param("franDe") String franDe);
	
	public FranchiseVO selectFranchiseDetail(String franId);
	
	public void insertCheckListNo();
	
	public void updateAuditCheckNo(@Param("franId") String franId, @Param("franDe") String franDe);

	public void updateFranAudit(@Param("text")String text, @Param("audit") String audit, @Param("confirm") String confirm, @Param("checkNo") String checkNo);
	
	public void updateCheckList(@Param("r1") int r1, @Param("r2") int r2, @Param("r3") int r3, @Param("r4") int r4, @Param("r5") int r5, @Param("r6") int r6, @Param("r7") int r7, @Param("checkNo") String checkNo);

}
