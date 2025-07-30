package kr.or.ddit.vo;

import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import kr.or.ddit.vo.def.PartnersDefaultVO;
import kr.or.ddit.vo.def.PartprodDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class AdminDeliveryVO extends DeliveryDefaultVO{

	
	public MemorderDefaultVO memorder;
	public MemberDefaultVO member;
	private OrderdtDefaultVO orderdt;
}
