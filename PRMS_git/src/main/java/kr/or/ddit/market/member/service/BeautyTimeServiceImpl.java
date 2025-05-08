package kr.or.ddit.market.member.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.BeautytimeDefaultMapper;
import kr.or.ddit.vo.def.BeautytimeDefaultVO;

@Service
public class BeautyTimeServiceImpl implements BeautyTimeService {

    @Autowired
    BeautytimeDefaultMapper mapper;

    @Override
    public List<BeautytimeDefaultVO> retrieveBeautyTimeByDate(HashMap<String, String> data) {
        return mapper.selectByDate(data);
    }

    @Override
    public HashMap<String, String> checkAvailableSlots(HashMap<String, String> data, List<String> allEmpNos) {
        List<BeautytimeDefaultVO> beautyTimes = retrieveBeautyTimeByDate(data);
        HashMap<String, String> availableSlots = new HashMap<>();

        // 예약된 정보가 없을 경우, 첫 번째 직원으로 예약 가능 설정
        if (beautyTimes.isEmpty()) {
            String firstEmpNo = allEmpNos.get(0);  // 첫 번째 직원 번호 가져오기
            for (int i = 1; i <= 9; i++) {
                availableSlots.put("RES_HR" + i, firstEmpNo);
            }
            return availableSlots; // 모든 시간대를 첫 번째 직원으로 설정한 후 반환
        }

        // 이미 예약된 직원들의 EMP_NO를 수집
        Set<String> reservedEmpNos = new HashSet<>();
        for (BeautytimeDefaultVO bt : beautyTimes) {
            reservedEmpNos.add(bt.getEmpNo());
        }

        // 예약된 정보가 있을 경우, 예약된 직원 정보 반영
        for (int i = 1; i <= 9; i++) {
            availableSlots.put("RES_HR" + i, "0"); // 기본값: 예약 가능
        }

        for (BeautytimeDefaultVO bt : beautyTimes) {
            String empNo = bt.getEmpNo();

            // 예약된 시간대는 예약된 직원 번호로 설정
            for (int i = 1; i <= 9; i++) {
                String resHrValue = getResHrValue(bt, i);
                if ("N".equals(resHrValue)) {
                    availableSlots.put("RES_HR" + i, empNo);
                }
            }
        }

        // 예약되지 않은 직원이 있는지 확인하여 예약 가능한 시간대를 결정
        for (int i = 1; i <= 9; i++) {
            String reservedEmpNo = availableSlots.get("RES_HR" + i);

            // 예약된 시간대가 아니면, 예약되지 않은 다른 직원에게 슬롯을 열어줌
            if (reservedEmpNo.equals("0")) {
                for (String empNo : allEmpNos) {
                    if (!reservedEmpNos.contains(empNo)) {
                        availableSlots.put("RES_HR" + i, empNo);
                        break; // 첫 번째 예약되지 않은 직원에게 할당 후 중지
                    }
                }
            }
        }

        return availableSlots;
    }

    private String getResHrValue(BeautytimeDefaultVO bt, int hrIndex) {
        switch (hrIndex) {
            case 1:
                return bt.getResHr1();
            case 2:
                return bt.getResHr2();
            case 3:
                return bt.getResHr3();
            case 4:
                return bt.getResHr4();
            case 5:
                return bt.getResHr5();
            case 6:
                return bt.getResHr6();
            case 7:
                return bt.getResHr7();
            case 8:
                return bt.getResHr8();
            case 9:
                return bt.getResHr9();
            default:
                return null;
        }
    }

    @Override
    public BeautytimeDefaultVO retrieveBeautyTime(HashMap<String, String> data) {
    	return mapper.selectBeautyTime(data);
    }

    @Override
	public void createBeautyTime(BeautytimeDefaultVO resTime) {
		mapper.insertBeautyTime(resTime);
	}

	@Override
	public void modifyBeautyTime(BeautytimeDefaultVO resTime) {
		mapper.updateBeautyTime(resTime);
	}

}
