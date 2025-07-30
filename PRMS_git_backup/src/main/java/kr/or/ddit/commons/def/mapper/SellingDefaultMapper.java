package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.SellingDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SellingDefaultMapper {
    public int deleteByPrimaryKey(@Param("selngNo") String selngNo, @Param("hqId") String hqId);

    public int insert(SellingDefaultVO row);

    public SellingDefaultVO selectByPrimaryKey(@Param("selngNo") String selngNo, @Param("hqId") String hqId);

    public List<SellingDefaultVO> selectAll();

    public int updateByPrimaryKey(SellingDefaultVO row);

    public int insertSelling(SellingDefaultVO selVO);
}