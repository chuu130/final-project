package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AlermVO {
	private Integer alermNo;
	private String alermSenderId;
	private String alermReciverId;
	private String alermKind;
	private String alermContent;
	private String alermStatus;
	private LocalDate alermSendDt;
}

