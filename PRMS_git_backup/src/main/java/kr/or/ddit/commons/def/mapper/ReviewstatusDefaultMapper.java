package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ReviewstatusDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewstatusDefaultMapper {
    int deleteByPrimaryKey(String reviewReport);

    int insert(ReviewstatusDefaultVO row);

    ReviewstatusDefaultVO selectByPrimaryKey(String reviewReport);

    List<ReviewstatusDefaultVO> selectAll();

    int updateByPrimaryKey(ReviewstatusDefaultVO row);
}