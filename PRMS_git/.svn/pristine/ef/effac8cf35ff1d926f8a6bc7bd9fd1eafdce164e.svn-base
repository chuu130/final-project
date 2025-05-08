package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.QnaanswerDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaanswerDefaultMapper {
    public int deleteQnaBoard(String qnaAnswerId);

    public int insertQnaBoard(QnaanswerDefaultVO row);

    public QnaanswerDefaultVO selectByQnaId(String qnaAnswerId);
    
    public QnaanswerDefaultVO selectByctrBbsNo(String ctrBbsNo);

    public List<QnaanswerDefaultVO> selectAllQnaBoard();
    
    public List<QnaanswerDefaultVO> selectQnaBoardList(String ctrBbsNo);

    public int updateQnaBoard(QnaanswerDefaultVO row);
    
}