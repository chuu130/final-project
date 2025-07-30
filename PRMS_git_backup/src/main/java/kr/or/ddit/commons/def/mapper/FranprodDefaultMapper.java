package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.FranprodDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FranprodDefaultMapper {
    int deleteByPrimaryKey(String franprodId);

    int insert(FranprodDefaultVO row);

    FranprodDefaultVO selectByPrimaryKey(String franprodId);

    List<FranprodDefaultVO> selectAll();

    int updateByPrimaryKey(FranprodDefaultVO row);
}