package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.FranauditDefaultMapper;
import kr.or.ddit.vo.CheckListVO;
import kr.or.ddit.vo.FranAuditVO;
import kr.or.ddit.vo.FranchiseVO;

@Mapper
public interface FranAuditMapper extends FranauditDefaultMapper{

	
	/**
	 * 방문감사 내역 리스트 조회
	 * @return
	 */
	public List<FranAuditVO> selectAuditList(String date);
	
	/**
	 * 월별 방문감사 내역 리스트 조회
	 * @param date
	 * @return
	 */
	public List<FranchiseVO> selectFranchiseAuditList(String date);
	
	/**
	 * 가맹점 선택후 해당월 가맹점 체크리스트 내역 조회
	 * @param franId
	 * @param franDe
	 * @return
	 */
	public CheckListVO selectFranAuditCheckList(@Param("franId") String franId, @Param("franDe") String franDe);
	
	
	/**
	 * 체크리스트 작성중 프랜차이즈 정보 가져오기
	 * @param franId
	 * @return
	 */
	public FranchiseVO selectFranchiseDetail(String franId);
	
	
	/**
	 * 체크리스트 생성
	 */
	public void insertCheckListNo();
	
	/**
	 * 체크리스트 번호랑 감사내역 체크리스트 번호 매칭
	 * @param franId
	 * @param franDe
	 */
	public void updateAuditCheckNo(@Param("franId") String franId, @Param("franDe") String franDe);
	
	
	/**
	 * 체크리스트 작성후 franaudit 테이블에 업데이트 저장
	 * @param text
	 * @param audit
	 * @param confirm
	 */
	public void updateFranAudit(@Param("text")String text, @Param("audit") String audit, @Param("confirm") String confirm, @Param("checkNo") String checkNo);
	
	/**
	 * 체크리스트 작성후 checkList 테이블에 업데이트후 저장
	 * @param r1
	 * @param r2
	 * @param r3
	 * @param r4
	 * @param r5
	 * @param r6
	 * @param r7
	 */
	public void updateCheckList(@Param("r1") int r1, @Param("r2") int r2, @Param("r3") int r3, @Param("r4") int r4, @Param("r5") int r5, @Param("r6") int r6, @Param("r7") int r7, @Param("checkNo") String checkNo);

}
