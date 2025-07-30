package kr.or.ddit.headquarter.master.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.headquarter.master.mapper.OnlineOrderMapper;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OnlineOrderServiceImpl implements OnlineOrderService {

	@Autowired
	private OnlineOrderMapper onlineOrderMapper;


	@Override
	public List<MemorderDefaultVO> retriveMemOrderList(PaginationInfoOrder paging) {
		int totalRecord = onlineOrderMapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return onlineOrderMapper.selectMemOrderList(paging);
	}


	@Override
	public MemorderDefaultVO retrieveMemOrderDt(String memOrderNo) {
		return onlineOrderMapper.selectMemOrderDt(memOrderNo);
	}


	@Override
	public boolean modifyDlvySttus(String memOrderNo) {

		boolean status = false;

		int result = onlineOrderMapper.updateDlvySttus(memOrderNo);

		if(result > 0) {
			status = true;
		}

		return status;
	}


	@Override
//	@Scheduled(cron = "0 0 0 1/1 * ? *")
	@Scheduled(fixedDelay = 1000 * 60 * 60 * 24)
	public void scheduleDlvySttus() {

		// 배송중인 주문정보를 조회한다.
		List<MemorderDefaultVO> dlveringMemOrderList = onlineOrderMapper.selectDlveringMemOrder();

		// 배송정보를 업데이트한다.
		for(MemorderDefaultVO dlveringMemOrder : dlveringMemOrderList) {
			onlineOrderMapper.updateDlvySttusSuccess(dlveringMemOrder);

			log.info("쿼리실행된 배송정보 : {}",dlveringMemOrder);
		}
	}


	@Override
	public int retriveMemOrderCount(PaginationInfoOrder paging) {
		return onlineOrderMapper.selectTotalRecord(paging);
	}

}
