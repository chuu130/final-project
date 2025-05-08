package kr.or.ddit.franchise.franchisee.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ExpenseDefaultVO;

@Mapper
public interface FranExpenseMapper {

	public int insertExpense(ExpenseDefaultVO expenseVO);
}
