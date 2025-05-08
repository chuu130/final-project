package kr.or.ddit.franchise.franchisee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.franchise.franchisee.mapper.FranExpenseMapper;
import kr.or.ddit.vo.def.ExpenseDefaultVO;

@Service
public class FranExpenseServiceImpl implements FranExpenseService{

	@Autowired
	private FranExpenseMapper mapper;

	@Override
	public int insertExpense(ExpenseDefaultVO expenseVO) {
		int cnt = mapper.insertExpense(expenseVO);
		return cnt;
	}


}
