package kr.or.ddit.api.mail.handler;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import kr.or.ddit.api.mail.handler.MailHandler.MessageVO.MessageVOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;

public class MailHandler {

	private JavaMailSender sender;

	@Builder
	@AllArgsConstructor
	public static class MessageVO{
		private String fromTitle;
		private String fromAdr;
		private String to;
		private String subject;
		private String text;

		public void sendMessage(JavaMailSender sender) {
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper messageHelper;
			try {
				messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(fromAdr, fromTitle);
				messageHelper.setSubject(subject);
				messageHelper.setText(text, true);
				messageHelper.setTo(to);
				sender.send(message);
			} catch (MessagingException | UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}
	}

	public MailHandler(JavaMailSender sender) throws MessagingException {
		this.sender = sender;

	}

	public void send(MessageVO message) {
		try {
			message.sendMessage(sender);
		} catch (MailAuthenticationException e) {
			e.printStackTrace();
		} catch (MailSendException e) {
			e.printStackTrace();
		}
	}
}
