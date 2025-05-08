package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ProdDefaultVO;

@Mapper
public interface ProdDefaultMapper {
    int deleteProd(String prodId);

    int insertProd(ProdDefaultVO prod);

    ProdDefaultVO selectProd(String prodId);

    List<ProdDefaultVO> selectProdList();

    int updateProd(ProdDefaultVO prod);
    
}