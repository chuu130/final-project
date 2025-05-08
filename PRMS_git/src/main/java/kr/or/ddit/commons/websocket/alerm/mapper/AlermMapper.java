package kr.or.ddit.commons.websocket.alerm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AlermVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

/**
 * 알림정보를 처리하는 매퍼
 * @author jbk
 */
@Mapper
public interface AlermMapper {

	/**
	 * 알림을 저장하는 메소드
	 * @param alermVO
	 * @return
	 */
	public int insertAlerm(AlermVO alermVO);


	/**
	 * 알림을 읽었을시, 알람상태를 수정하는 메소드
	 * @param alermVO
	 * @return
	 */
	public int updateAlerm(AlermVO alermVO);


	/**
	 * 알림을 보낸 송신자 정보를 조회하는 메소드
	 * @param alermVO
	 * @return
	 */
	public EmployeeDefaultVO selectSenderInfo(AlermVO alermVO);


	/**
	 * 내가 받은 알림을 조회하는 메소드
	 * @param alermVO
	 * @return
	 */
	public List<AlermVO> selectMyAlerm(AlermVO alermVO);
}
