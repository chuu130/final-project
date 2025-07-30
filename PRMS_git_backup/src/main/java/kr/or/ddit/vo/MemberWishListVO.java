package kr.or.ddit.vo;

import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.FavoritesDefaultVO;
import kr.or.ddit.vo.def.PartnersDefaultVO;
import kr.or.ddit.vo.def.PartprodDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class MemberWishListVO extends FavoritesDefaultVO{
	
	private ProdDefaultVO prod;
	private CmmncodeDefaultVO cmmncode;
	private AdminInvVO admininv;
	

}
