package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.vo.def.QnaanswerDefaultVO;

public interface QnaService {
    public int removeQnaBoard(String qnaAnswerId);

    public int registerQnaBoard(QnaanswerDefaultVO row);

    public QnaanswerDefaultVO retrieveByqnaId(String qnaAnswerId);
    
    public QnaanswerDefaultVO retrieveByctrBbsNo(String ctrBbsNo);

    public List<QnaanswerDefaultVO> retrieveAllQnaBoard();
    
    public List<QnaanswerDefaultVO> retrieveQnaBoardList(String ctrBbsNo);

    public int modifyQnaBoard(QnaanswerDefaultVO row);

}
