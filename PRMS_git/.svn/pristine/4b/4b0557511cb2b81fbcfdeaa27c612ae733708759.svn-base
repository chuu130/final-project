package kr.or.ddit.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommaMoney {

	private String commaMoney;

	public CommaMoney(int money) {
		this.commaMoney = CommaUtils.formatIntComma(money);
	}
}
