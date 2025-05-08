package kr.or.ddit.vo;

import java.util.List;

import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.ExpenseDefaultVO;
import kr.or.ddit.vo.def.FranSellingDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;


@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FranchiseVO extends FranchiseDefaultVO{

	private CmmncodeDefaultVO cmmncode;
	private List<ExpenseDefaultVO> expense;
	private List<FranSellingDefaultVO> franselling;
	
	private int totalThisyearSelling;
	private int totalThisyearExpense;
	private int totalLastyearSelling;
	private int totalLastyearExpense;
}
