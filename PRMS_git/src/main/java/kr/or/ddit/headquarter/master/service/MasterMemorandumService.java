package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.MemorandumDefaultVO;

public interface MasterMemorandumService {
	public int deleteMemorandum(int memoranNo);

    public int insertMemorandum(MemorandumDefaultVO memoVO);

    public MemorandumDefaultVO selectMemorandum(int memoranNo);

    public List<MemorandumDefaultVO> selectMemoList();

    public int updateMemorandum(MemorandumDefaultVO memoVO);
}
