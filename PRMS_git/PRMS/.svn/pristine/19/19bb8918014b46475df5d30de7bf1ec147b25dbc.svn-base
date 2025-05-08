package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EmergencyDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmergencyDefaultMapper {
    int deleteByPrimaryKey(String emerNo);

    int insert(EmergencyDefaultVO row);

    EmergencyDefaultVO selectByPrimaryKey(String emerNo);

    List<EmergencyDefaultVO> selectAll();

    int updateByPrimaryKey(EmergencyDefaultVO row);
}