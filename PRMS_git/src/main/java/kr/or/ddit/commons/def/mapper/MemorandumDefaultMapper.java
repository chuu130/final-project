package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MemorandumDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemorandumDefaultMapper {
    public int deleteMemorandum(int memoranNo);

    public int insertMemorandum(MemorandumDefaultVO memoVO);

    public MemorandumDefaultVO selectMemorandum(int memoranNo);

    public List<MemorandumDefaultVO> selectMemoList();

    public int updateMemorandum(MemorandumDefaultVO memoVO);
}