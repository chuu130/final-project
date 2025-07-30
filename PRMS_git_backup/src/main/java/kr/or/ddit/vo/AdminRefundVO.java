package kr.or.ddit.vo;

import kr.or.ddit.vo.def.ExchangeDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class AdminRefundVO extends ExchangeDefaultVO{

	private MemorderDefaultVO memorder;
	private MemberDefaultVO member;
}
