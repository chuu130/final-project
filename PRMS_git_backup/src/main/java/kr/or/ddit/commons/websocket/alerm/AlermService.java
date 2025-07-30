package kr.or.ddit.commons.websocket.alerm;

import java.util.List;

import kr.or.ddit.vo.AlermVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

/**
 * 알림정보를 처리하는 서비스
 * @author jbk
 *
 */
public interface AlermService {

	/**
	 * 알림을 저장하는 메소드
	 * @param alermVO
	 * @return
	 */
	public void InputAlerm(AlermVO alermVO);


	/**
	 * 알림을 읽었을시, 알람상태를 수정하는 메소드
	 * @param alermVO
	 * @return
	 */
	public void modifyAlerm(AlermVO alermVO);


	/**
	 * 알림을 보낸 송신자 정보를 조회하는 메소드
	 * @param alermVO
	 * @return
	 */
	public EmployeeDefaultVO retrieveSenderInfo(AlermVO alermVO);


	/**
	 * 내가 받은 알림중 읽지 않은 알람을 조회하는 메소드
	 * @param alermVO
	 * @return
	 */
	public List<AlermVO> retriveMyAlerm(AlermVO alermVO);
}
