package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class SellingDefaultVO implements Serializable {
	private String selngAmount;
	private String selngNo;
	private String hqId;
	private String selngSe;
	private String selngNm;
	private String selngCn;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate selngDe;

    private static final long serialVersionUID = 1L;
}