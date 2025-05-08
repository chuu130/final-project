package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.MemorandumDefaultMapper;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.def.MemorandumDefaultVO;

@Service
public class MasterMemorandumServiceImpl implements MasterMemorandumService{
	
	@Autowired
	private MemorandumDefaultMapper mapper;

	@Override
	public int deleteMemorandum(int memoranNo) {
		int cnt = mapper.deleteMemorandum(memoranNo);
		return cnt;
	}

	@Override
	public int insertMemorandum(MemorandumDefaultVO memoVO) {
		int cnt = mapper.insertMemorandum(memoVO);
		return cnt;
	}

	@Override
	public MemorandumDefaultVO selectMemorandum(int memoranNo) {
		MemorandumDefaultVO memoVO = mapper.selectMemorandum(memoranNo);
		if(memoVO==null) {
			throw new PkNotFoundException(memoVO.getMemoranNo());
		}
		return memoVO;
	}

	@Override
	public List<MemorandumDefaultVO> selectMemoList() {
		return mapper.selectMemoList();
	}

	@Override
	public int updateMemorandum(MemorandumDefaultVO memoVO) {
		int cnt = mapper.updateMemorandum(memoVO);
		return cnt;
	}
}
