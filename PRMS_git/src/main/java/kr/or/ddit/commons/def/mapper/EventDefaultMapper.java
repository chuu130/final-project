package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EventDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventDefaultMapper {
    public int deleteByPrimaryKey(String eventId);

    public int insert(EventDefaultVO row);

    public EventDefaultVO selectByPrimaryKey(String eventId);

    public List<EventDefaultVO> selectAll();

    public int updateByPrimaryKey(EventDefaultVO row);
}