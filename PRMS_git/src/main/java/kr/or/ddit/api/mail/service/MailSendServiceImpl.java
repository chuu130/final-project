package kr.or.ddit.api.mail.service;

import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.or.ddit.api.mail.handler.MailHandler;
import kr.or.ddit.api.mail.handler.MailHandler.MessageVO;

@Service
public class MailSendServiceImpl implements MailService {

	@Autowired
	MailHandler handler;

	@Override
	public String sendPwMail(String mail) {

		// 신규 비밀번호를 생성한다.
		String newPw = UUID.randomUUID().toString().substring(0, 6);

		try {

			MessageVO message = MessageVO.builder()
			// 메일 수신자를 설정
			.to(mail)
			// 메일 컨텐츠 설정
			.fromAdr("email@gmail.com")
			.fromTitle("펫코노미㈜ 멍냥몰")
			.subject("펫코노미㈜ 멍냥몰 신규 비밀번호 발송!")
			// 보낼 메일 내용 설정
			.text(String.format("고객님의 신규 비밀번호는 %s 입니다.", newPw))
			.build();

			// 메일을 전송한다.
			handler.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return newPw;
	}

	@Override
	public void sendFoundReturnMail(String foundEmail, String foundReCn) {

		try {

			MessageVO message = MessageVO.builder()
			// 메일 수신자를 설정
			.to(foundEmail)
			// 메일 컨텐츠 설정
			.fromAdr("email@gmail.com")
			.fromTitle("펫코노미㈜ 멍냥몰")
			.subject("펫코노미㈜ 창업상담이 반려되었습니다.")
			// 보낼 메일 내용 설정
			.text(foundReCn)
			.build();
			// 메일을 전송한다.
			handler.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
