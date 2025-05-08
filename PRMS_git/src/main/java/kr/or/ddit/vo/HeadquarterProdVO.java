package kr.or.ddit.vo;

import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.PartnersDefaultVO;
import kr.or.ddit.vo.def.PartprodDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;


@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class HeadquarterProdVO  extends ProdDefaultVO{

	private PartprodDefaultVO partprod;
	private PartnersDefaultVO partners;
	private CmmncodeDefaultVO cmmncode;
	private AdmininvDefaultVO adminInv;
}
