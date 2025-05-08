package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CartDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CartDefaultMapper {
    int deleteByPrimaryKey(@Param("cartNo") String cartNo, @Param("prodId") String prodId, @Param("memNo") String memNo);

    int insert(CartDefaultVO row);

    CartDefaultVO selectByPrimaryKey(@Param("cartNo") String cartNo, @Param("prodId") String prodId, @Param("memNo") String memNo);

    List<CartDefaultVO> selectAll();

    int updateByPrimaryKey(CartDefaultVO row);
}