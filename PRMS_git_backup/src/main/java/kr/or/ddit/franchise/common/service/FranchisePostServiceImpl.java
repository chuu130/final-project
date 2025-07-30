package kr.or.ddit.franchise.common.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.common.mapper.FranchisePosMapper;
import kr.or.ddit.vo.FranchisePosVO;
import kr.or.ddit.vo.PosPayInfoVO;
import kr.or.ddit.vo.SetlDtVO;
import kr.or.ddit.vo.def.CancleDefaultVO;
import kr.or.ddit.vo.def.FranprodsetlDefaultVO;

@Service
public class FranchisePostServiceImpl implements FranchisePosService{

	@Autowired
	private FranchisePosMapper mapper;
	
	@Override
	public List<FranchisePosVO> selectFranchiseProdList(String franId) {
		List<FranchisePosVO> franchiseProdList = mapper.selectFranchiseProdList(franId);
		return franchiseProdList;
	}

	@Override
	public FranchisePosVO selectFranchiseProdDetail(String franProdId) {
		FranchisePosVO franProd = mapper.selectFranchiseProdDetail(franProdId);
		return franProd;
	}

	@Override
	public void insertPaymentInfo(String franId, int totalPc, PosPayInfoVO posPayInfo ) {
		mapper.insertProdSetl(franId, totalPc);
		
		
		
	}

	@Override
	public void insertPaymentDetailInfo(PosPayInfoVO posPayInfo) {
		String franId = posPayInfo.getFranId();
		List<String> prodIdList = posPayInfo.getProdId();
		List<Integer> prodQtyList = posPayInfo.getProdQty();
		List<Integer> prodTotalPcList = posPayInfo.getProdTotalPc();	
		
		for(int i=0; i < prodIdList.size(); i++) {
			String prodId = prodIdList.get(i);
			int prodQty = prodQtyList.get(i);
			int prodTotalPc = prodTotalPcList.get(i);
			
			mapper.insertPaymentDetail(franId, prodId, prodQty, prodTotalPc );
		}
		
		
	}

	@Override
	public List<SetlDtVO> selectPosHistoryList(String franId) {
		return mapper.selectPosHistoryList(franId);
	}

	@Override
	public void insertPosCancle(String franprodSetlNo) {
		mapper.insertPosCancle(franprodSetlNo);
		
	}

	@Override
	public List<SetlDtVO> selectPosCancleList(String franId) {
		return mapper.selectPosCancleList(franId);
	}

	@Override
	public void updatePosCancleYn(String franprodSetlNo) {
		mapper.updatePosCancleYn(franprodSetlNo);
		
	}

	@Override
	public List<SetlDtVO> selectPosDate(String franId, String date) {
		return mapper.selectPosDate(franId, date);
		
	}

	@Override
	public List<SetlDtVO> selectPosCancleDate(String franId, String date) {
		return mapper.selectPosCancleDate(franId, date);
	}

	@Override
	public String selectSetlPK(String franId) {
		return mapper.selectSetlPK(franId);
	}


	@Override
	public void insertFranPosSelling(String franId, String franSetlNo, PosPayInfoVO pospay) {
		int totalPc = pospay.getTotal();
		mapper.insertFranPosSelling(franId, franSetlNo, totalPc);
	}

	@Override
	public FranprodsetlDefaultVO selectExpensePK(String franSetlNo) {
		return mapper.selectExpensePK(franSetlNo);
	}


	@Override
	public void insertFranPosExpense(String franId, String franSetlNo, int totalPc) {
		mapper.insertFranPosExpense(franId, franSetlNo, totalPc);
		
		
	}

}
