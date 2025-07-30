package kr.or.ddit.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.def.FranchiseDefaultVO;
import lombok.Data;

@Data
public class CalendarVO {
	private String title;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate start;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate end;
	private String color;
	private String textColor;
	private int calNo;

	private FranchiseDefaultVO franchise;
}
