package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.BlacklistDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BlacklistDefaultMapper {
    public int deleteByPrimaryKey(String blacklistId);

    public int insert(BlacklistDefaultVO row);

    public BlacklistDefaultVO selectByPrimaryKey(String blacklistId);

    public List<BlacklistDefaultVO> selectAll();

    public int updateByPrimaryKey(BlacklistDefaultVO row);

    public int checkMember(String memNo);
}