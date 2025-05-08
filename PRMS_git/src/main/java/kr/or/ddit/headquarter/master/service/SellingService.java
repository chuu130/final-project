package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.SellingDefaultVO;

public interface SellingService {
	public int deleteByPrimaryKey(@Param("selngNo") String selngNo, @Param("hqId") String hqId);

    public int insert(SellingDefaultVO row);

    public SellingDefaultVO selectByPrimaryKey(@Param("selngNo") String selngNo, @Param("hqId") String hqId);

    public List<SellingDefaultVO> selectAll();

    public int updateByPrimaryKey(SellingDefaultVO row);

    public int insertSelling(SellingDefaultVO selVO);
}
