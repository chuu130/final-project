package kr.or.ddit.franchise.common.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.FranchisePosVO;
import kr.or.ddit.vo.PosPayInfoVO;
import kr.or.ddit.vo.SetlDtVO;
import kr.or.ddit.vo.def.CancleDefaultVO;
import kr.or.ddit.vo.def.FranprodsetlDefaultVO;

public interface FranchisePosService {

	
	public List<FranchisePosVO> selectFranchiseProdList(String franId);
	
	public FranchisePosVO selectFranchiseProdDetail(String franProdId);

	public void insertPaymentInfo(String franId,int totalPc, PosPayInfoVO posPayInfo);

	public void insertPaymentDetailInfo(PosPayInfoVO posPayInfo);
	
	public List<SetlDtVO> selectPosHistoryList(String franId);
	
	public void insertPosCancle(String franprodSetlNo);
	
	public void updatePosCancleYn(String franprodSetlNo);
	
	public List<SetlDtVO> selectPosCancleList(String franId);
	
	public List<SetlDtVO> selectPosDate(@Param("franId") String franId, @Param("date") String date);
	
	public List<SetlDtVO> selectPosCancleDate(@Param("franId") String franId, @Param("date")  String date);
	
	public String selectSetlPK(String franId);
	
	public void insertFranPosSelling(@Param("franId")String franId,@Param("franSetlNo") String franSetlNo, PosPayInfoVO pospay);
	
	public FranprodsetlDefaultVO selectExpensePK(String franSetlNo);
	
	public void insertFranPosExpense(@Param("franId")String franId,@Param("franSetlNo") String franSetlNo,@Param("totalPc") int totalPc);
}
