package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AtchfiledtDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AtchfiledtDefaultMapper {
    int deleteByPrimaryKey(@Param("atchFileDetailId") String atchFileDetailId, @Param("atchFileClId") String atchFileClId);

    int insert(AtchfiledtDefaultVO row);

    AtchfiledtDefaultVO selectByPrimaryKey(@Param("atchFileDetailId") String atchFileDetailId, @Param("atchFileClId") String atchFileClId);

    List<AtchfiledtDefaultVO> selectAll();

    int updateByPrimaryKey(AtchfiledtDefaultVO row);
}