package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import kr.or.ddit.vo.def.CancleDefaultVO;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.FranprodDefaultVO;
import kr.or.ddit.vo.def.FranprodsetlDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;
import kr.or.ddit.vo.def.SetldtDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SetlDtVO  extends SetldtDefaultVO{
	
	private FranprodsetlDefaultVO franprodsetl;
	private List<FranprodDefaultVO> franprod;
	
	private CancleDefaultVO cancle;
	private int cntProd;

}
