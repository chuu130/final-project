package kr.or.ddit.commons.websocket.alerm;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.AlermVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 스프링 웹소켓을 이용한 알림핸들러
 * @author jbk
 */
@Slf4j
public class AlermHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>(); // 사용자 id 와 WebSocketSession 매핑!

	/**
	 * 최초 연결이 되었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("연결된 세션정보 : {}", session);

		String id  = session.getPrincipal().getName();
		log.info("연결된 세션아이디 : {}", id);

		users.put(id, session);
	}


	/**
	 * 연결이후, 메시지를 처리하는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		log.info("알람을 보낸 세션정보 : {}", session);
		log.info("넘어온 메시지 : {}", message.getPayload());


		// JSON으로 전송된 알람정보를 Java객체로 매핑한다.
		ObjectMapper objMap = new ObjectMapper();
		AlermVO alerm = objMap.readValue(message.getPayload(), AlermVO.class);

		log.info("알람체크 : {}", alerm);
		String reciverId = alerm.getAlermReciverId();


		// 자바객체를 json 문자열로 반환한다.
		String jsonStringMsg = objMap.writeValueAsString(alerm);

		// 보낸 알람정보를 수신자 세션으로 전송한다.
		for(Entry<String, WebSocketSession> entrySet : users.entrySet()) {

			String userId = entrySet.getKey();

			if(reciverId.equals(userId)) {
				WebSocketSession userSession = entrySet.getValue();
				userSession.sendMessage(new TextMessage(jsonStringMsg));
				break;
			}
		}
	}


	/**
	 * 연결이 끊겼을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log.info("종료된 세션정보 : {}", session);

		String id = session.getPrincipal().getName();
		log.info("종료된 세션아이디 : {}", id);

		users.remove(id);
	}
}

