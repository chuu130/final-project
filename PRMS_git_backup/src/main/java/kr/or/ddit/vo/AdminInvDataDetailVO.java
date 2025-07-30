package kr.or.ddit.vo;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdminInvDataDetailVO {
	private String prodId;
	private String admininvNm;
	private int admininvQy;
	private String partprodImage;
	private String partnersCorNm;
	private String cmmnCodeNm;
	private int partprodPc; //입고단가
	private int prodSlePc; //상품가격
	private int warQy;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private LocalDateTime warDe;
	
}
