package kr.or.ddit.franchise.common.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.FranprodDefaultMapper;
import kr.or.ddit.vo.FranchisePosVO;
import kr.or.ddit.vo.PosPayInfoVO;
import kr.or.ddit.vo.SetlDtVO;
import kr.or.ddit.vo.def.CancleDefaultVO;
import kr.or.ddit.vo.def.FranprodsetlDefaultVO;

/**
 * @author PC-24
 *
 */
@Mapper
public interface FranchisePosMapper extends FranprodDefaultMapper {

	
	/**
	 * 한 가맹점에 있는 상품리스트 출력 (포스기관리)
	 * @param franId
	 * @return
	 */
	public List<FranchisePosVO> selectFranchiseProdList(String franId);
	
	
	/**
	 * 포스기 에서 모달창 상품 상세정보 가져오기
	 * @param franProdId
	 * @return
	 */
	public FranchisePosVO selectFranchiseProdDetail(String franProdId);


	public void insertProdSetl(@Param("franId") String franId,@Param("totalPc") int totalPc);


	public void insertPaymentDetail(@Param("franId") String franId,@Param("prodId") String prodId, @Param("prodQty") int prodQty, @Param("prodTotalPc") int prodTotalPc);
	
	/**
	 * 가맹점별 포스기 주문내역 조회
	 * @param franId
	 * @return
	 */
	public List<SetlDtVO> selectPosHistoryList(String franId);
	
	/**
	 * 가맹점 포스기 환불 처리
	 * @param franprodSetlNo
	 */
	public void insertPosCancle(String franprodSetlNo);
	
	public void updatePosCancleYn(String franprodSetlNo);
	
	
	
	/**
	 * 포스기 상품 환불한 리스트 조회
	 * @return
	 */
	public List<SetlDtVO> selectPosCancleList(String franId);
	
	
	/**
	 * 포스기 날짜로 상품검색
	 * @param franId
	 * @param date
	 * @return
	 */
	public List<SetlDtVO> selectPosDate(@Param("franId") String franId, @Param("date")  String date);
	
	/**
	 * 포스기 환불 날짜로 상품검색
	 * @param franId
	 * @param date
	 * @return
	 */
	public List<SetlDtVO> selectPosCancleDate(@Param("franId") String franId, @Param("date")  String date);
	
	/**
	 * 구매정보 pk값 가져오기
	 * @param franId
	 * @return
	 */
	public String selectSetlPK(String franId);
	
	
	
	/**
	 * 포스기 상품 매출에 추가
	 * @param pospay
	 */
	public void insertFranPosSelling(@Param("franId")String franId,@Param("franSetlNo") String franSetlNo,@Param("totalPc") int totalPc);
	
	
	/**
	 * 환불정보 pk값 가져오기
	 * @param franId
	 * @return
	 */
	public FranprodsetlDefaultVO selectExpensePK(String franSetlNo);
	
	/**
	 * 포스기 환불상품 지출에 추가
	 * @param pospay
	 */
	public void insertFranPosExpense(@Param("franId")String franId,@Param("franSetlNo") String franSetlNo,@Param("totalPc") int totalPc);
}
