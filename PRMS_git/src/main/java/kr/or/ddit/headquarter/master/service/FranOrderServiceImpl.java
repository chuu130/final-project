package kr.or.ddit.headquarter.master.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.headquarter.master.mapper.FranOrderMapper;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.FiorderDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.FranprodDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FranOrderServiceImpl implements FranOrderService {

	private final FranOrderMapper franOrderMapper;

	@Override
	public int retrieveFranOrderCount(PaginationInfoOrder paging) {
		return franOrderMapper.selectTotalRecord(paging);
	}

	@Override
	public List<InvrequestDefaultVO> retrieveFranOrderList(PaginationInfoOrder paging) {
		int totalRecord = franOrderMapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return franOrderMapper.selectInvRequestList(paging);
	}

	@Override
	public InvrequestDefaultVO retrieveFranOrderDt(String franOrderNo) {
		return franOrderMapper.selectInvRequest(franOrderNo);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void modifyInvFranAndHead(String franOrderNo) {

		// 주문상세를 조회한다.
		InvrequestDefaultVO invRequest = franOrderMapper.selectInvRequest(franOrderNo);

		// 가맹점 정보를 구한다.
		FranchiseDefaultVO franchise = invRequest.getFranchise();
		String franchiseId = franchise.getFranchiseId();

		// 가맹점 판매상품정보를 조회한다.
		List<FranprodDefaultVO> franProdList = franOrderMapper.selectFranProd(invRequest);

		// 주문상세의 상품리스트 개수만큼 반복한다.
		List<FiorderDefaultVO> fiOrderList = invRequest.getFiOrderList();

		for(FiorderDefaultVO fiOrder : fiOrderList) {

			// 본사판매 상품정보를 구한다.
			ProdDefaultVO prod = fiOrder.getProd();
			String prodId = prod.getProdId();

			Integer orderdetailQy = fiOrder.getOrderdetailQy(); // 주문수량

			boolean flag = false; // 가맹점에서 현재 판매하고있는 상품인지 여부를 체크하는 변수

			// 가맹점 판매상품정보 리스트만큼 반복한다.
			for(FranprodDefaultVO franProd : franProdList) {
				String franprodId = franProd.getFranprodId();

				// 가맹점 판매상품정보에 해당할 때
				if(franprodId.equals(franchiseId + prodId)) {

					// 취급하는 상품이다.
					flag = true;

					// 해당 가맹점 판매상품정보를 기반으로 가맹점 재고수량을 변경한다.
					InventoryDefaultVO inventory = new InventoryDefaultVO();
					inventory.setFivQy(orderdetailQy);
					inventory.setFranchiseId(franchiseId);
					inventory.setFranprodId(franprodId);

					franOrderMapper.updateInvFran(inventory);

					// 본사재고수량을 변경한다.
					AdmininvDefaultVO admininv = new AdmininvDefaultVO();
					admininv.setAdmininvQy(orderdetailQy);
					admininv.setProdId(prodId);

					franOrderMapper.updateInvHead(admininv);
				}
			}

			// 가맹점에서 취급하는 상품이 아니라면
			if(!flag) {
				// 가맹점취급 상품에 추가한다.
				String franProdId = franchiseId + prodId;

				FranprodDefaultVO franProd = new FranprodDefaultVO();
				franProd.setFranprodId(franProdId);
				franProd.setFranchiseId(franchiseId);
				franProd.setFranprodImage(prod.getProdImage());
				franProd.setFranprodNm(prod.getProdSleNm());
				franProd.setProdId(prodId);
				franProd.setFranprodPc(prod.getProdSlePc());

				franOrderMapper.insertFranProd(franProd);

				// 가맹점 재고에 추가한다.
				InventoryDefaultVO inventory = new InventoryDefaultVO();
				inventory.setFivQy(orderdetailQy);
				inventory.setFranchiseId(franchiseId);
				inventory.setFranprodId(franProdId);


				// 가맹점 재고품목에 추가한다.
				franOrderMapper.insertInventory(inventory);
			}

		}

		// 발주상태를 변경한다.
		franOrderMapper.updateFrieqSttusSuccess(invRequest);

		// 가맹점발주 처리날짜를 오늘로 변경한다.
		franOrderMapper.updateFrieqUpdateDe(invRequest);
	}


	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void modifyInvAndMoneyToFranAndHead(InvrequestDefaultVO inputInvRequest) {

		// 주문상세를 조회한다.
		InvrequestDefaultVO invRequest = franOrderMapper.selectInvRequest(inputInvRequest.getFireqId());

		// 주문금액을 가져온다.
		invRequest.getFireqAmount();

		// 해당 주문금액을 바탕으로, 본사 지출정보를 수정한다.
		franOrderMapper.insertRejectAdminexpMoney(invRequest);


		// 해당 주문금액을 바탕으로, 가맹점 매출정보를 수정한다.
		franOrderMapper.insertRejectFranMoney(invRequest);

		// 가맹점발주 신청상태를 반려로 변경한다.
		franOrderMapper.updateFrieqSttusReject(inputInvRequest);

		// 가맹점발주 처리날짜를 오늘로 변경한다.
		franOrderMapper.updateFrieqUpdateDe(invRequest);
	}
}
