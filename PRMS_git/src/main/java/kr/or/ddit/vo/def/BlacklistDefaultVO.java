package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class BlacklistDefaultVO implements Serializable {
	private String blacklistId;

	private String memNo;

	private String blacklistResn;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate blacklistIn;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate blacklistDe;

	private static final long serialVersionUID = 1L;
}