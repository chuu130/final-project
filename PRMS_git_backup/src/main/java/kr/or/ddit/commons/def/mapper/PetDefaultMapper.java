package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PetDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PetDefaultMapper {
    int deleteByPrimaryKey(String petNo);

    int insertPet(PetDefaultVO petInfo);

    PetDefaultVO selectByPrimaryKey(String petNo);

    List<PetDefaultVO> selectAll();

    int updateByPrimaryKey(PetDefaultVO petInfo);

    PetDefaultVO selectByMemNo(@Param("memNo") String memNo);
}