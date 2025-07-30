package kr.or.ddit.commons.websocket.alerm;


import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.vo.AlermVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 알림정보를 처리하는 컨트롤러
 * @author jbk
 */
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/alerm")
public class AlermController {

	private final AlermService alermService;

	/**
	 * 송신한 알림을 데이터베이스에 저장한 후, 성공여부를 반환하는 메소드
	 * @param alermVO
	 * @return
	 */
	@PostMapping("send")
	public boolean alermSave(
		@RequestBody AlermVO alermVO
	) {
		log.info("alerm : {}", alermVO);

		boolean success = false;

		try {
			alermService.InputAlerm(alermVO);
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}


	/**
	 * 읽은 알림을 처리한 후, 성공여부를 반환하는 메소드
	 * @param alermVO
	 * @return
	 */
	@PostMapping("read")
	public boolean alermReadProcess(
		@RequestBody AlermVO alermVO
	) {
		log.info("읽은 알림 : {}", alermVO);

		boolean success = false;

		try {
			alermService.modifyAlerm(alermVO);
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}


	/**
	 * 알림 송신자 정보를 조회한후, 반환하는 메소드
	 * @param alermVO
	 * @return
	 */
	@PostMapping("sender")
	public EmployeeDefaultVO alermSender(
		@RequestBody AlermVO alermVO
	) {
		log.info("전달받은 알림 : {}", alermVO);

		EmployeeDefaultVO sender = null;

		try {
			sender = alermService.retrieveSenderInfo(alermVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sender;
	}


	/**
	 * 읽지 않은 알림을 조회한후, 반환하는 메소드
	 * @param alermVO
	 * @return
	 */
	@PostMapping("myAlerm")
	public List<AlermVO> myAlermRetriveProcess(
		@RequestBody AlermVO alermVO
	) {
		log.info("전달받은 알림 : {}", alermVO);

		List<AlermVO> myAlermList = null;

		try {
			myAlermList = alermService.retriveMyAlerm(alermVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return myAlermList;
	}

}
