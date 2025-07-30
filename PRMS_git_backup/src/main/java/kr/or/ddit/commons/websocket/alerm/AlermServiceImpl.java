package kr.or.ddit.commons.websocket.alerm;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.websocket.alerm.mapper.AlermMapper;
import kr.or.ddit.vo.AlermVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AlermServiceImpl implements AlermService {

	private final AlermMapper alermMapper;

	@Override
	public void InputAlerm(AlermVO alermVO) {
		try {
			alermMapper.insertAlerm(alermVO);
		} catch (Exception e) {
			log.info("알림추가 에러발생! : {}", e);
			throw e;
		}
	}


	@Override
	public void modifyAlerm(AlermVO alermVO) {
		try {
			alermMapper.updateAlerm(alermVO);
		} catch (Exception e) {
			log.info("알림수정 에러발생! : {}", e);
			throw e;
		}
	}


	@Override
	public EmployeeDefaultVO retrieveSenderInfo(AlermVO alermVO) {
		try {
			return alermMapper.selectSenderInfo(alermVO);
		} catch (Exception e) {
			log.info("송신자조회 에러발생! : {}", e);
			throw e;
		}
	}


	@Override
	public List<AlermVO> retriveMyAlerm(AlermVO alermVO) {
		try {
			return alermMapper.selectMyAlerm(alermVO);
		} catch (Exception e) {
			log.info("내 알림조회 에러발생! : {}", e);
			throw e;
		}
	}

}
