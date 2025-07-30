package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EducationDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EducationDefaultMapper {
    public int deleteEducation(String eduNo);

    public int insertEducation(EducationDefaultVO eduVO);

    public EducationDefaultVO selectEducation(String eduNo);

    public List<EducationDefaultVO> selectEducationList();

    public int updateEducation(EducationDefaultVO eduVO);

    public int CHeckEducation(String eduNo);
}