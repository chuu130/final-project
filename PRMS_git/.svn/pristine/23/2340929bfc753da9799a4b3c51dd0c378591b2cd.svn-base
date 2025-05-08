package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.WarehousingDefaultVO;

public interface WarehousingService {
	public int deleteWarehousing(@Param("warId") String warId, @Param("prodId") String prodId);

    public int insertWarehousing(WarehousingDefaultVO wareVO);

    public WarehousingDefaultVO selectWarehousing(@Param("warId") String warId, @Param("prodId") String prodId);

    public List<WarehousingDefaultVO> selectWarehousingList();

    public int updateWarehousing(WarehousingDefaultVO wareVO);
}
