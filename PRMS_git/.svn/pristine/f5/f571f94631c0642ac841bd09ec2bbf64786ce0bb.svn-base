package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.WarehousingDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface WarehousingDefaultMapper {
    public int deleteWarehousing(@Param("warId") String warId, @Param("prodId") String prodId);

    public int insertWarehousing(WarehousingDefaultVO wareVO);

    public WarehousingDefaultVO selectWarehousing(@Param("warId") String warId, @Param("prodId") String prodId);

    public List<WarehousingDefaultVO> selectWarehousingList();

    public int updateWarehousing(WarehousingDefaultVO wareVO);
}