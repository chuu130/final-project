package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MonthRevenue {
	private String monthDt;
	private long selling;
	private long refund;
}
