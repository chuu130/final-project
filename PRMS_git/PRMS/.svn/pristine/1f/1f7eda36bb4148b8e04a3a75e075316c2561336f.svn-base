package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.PartprodDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartprodDefaultMapper {
    public int deletePartProd(String prodId);

    public int insertPartProd(PartprodDefaultVO prodVO);

    public PartprodDefaultVO selectPartProd(String prodId);

    public List<PartprodDefaultVO> selectPartProdList();

    public int updatePartProd(PartprodDefaultVO prodVO);

    public List<PartprodDefaultVO> selectPartProdListPaging(PaginationInfo paging);

    public int countedPartProd();
}