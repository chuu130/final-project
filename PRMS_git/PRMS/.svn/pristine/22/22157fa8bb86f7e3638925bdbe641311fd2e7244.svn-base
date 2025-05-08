package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.QnaanswerDefaultMapper;
import kr.or.ddit.vo.def.QnaanswerDefaultVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaanswerDefaultMapper mapper;

	@Override
	public int removeQnaBoard(String qnaAnswerId) {
		return mapper.deleteQnaBoard(qnaAnswerId);
	}

	@Override
	public int registerQnaBoard(QnaanswerDefaultVO row) {
		return mapper.insertQnaBoard(row);
	}

	@Override
	public QnaanswerDefaultVO retrieveByqnaId(String qnaAnswerId) {
		return mapper.selectByQnaId(qnaAnswerId);
	}

	@Override
	public List<QnaanswerDefaultVO> retrieveAllQnaBoard() {
		return mapper.selectAllQnaBoard();
	}

	@Override
	public int modifyQnaBoard(QnaanswerDefaultVO row) {
		return mapper.updateQnaBoard(row);
	}

	@Override
	public QnaanswerDefaultVO retrieveByctrBbsNo(String ctrBbsNo) {
		return mapper.selectByctrBbsNo(ctrBbsNo);
	}

	@Override
	public List<QnaanswerDefaultVO> retrieveQnaBoardList(String ctrBbsNo) {
	     return mapper.selectQnaBoardList(ctrBbsNo);
	}
	



}
