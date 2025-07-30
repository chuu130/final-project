package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.InvrequestDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InvrequestDefaultMapper {
    public int deleteInvrequest(String fireqId);

    public int insertInvrequest(InvrequestDefaultVO reqVO);

    public InvrequestDefaultVO selectInvrequest(String fireqId);

    public List<InvrequestDefaultVO> selectInvrequestList();

    public int updateInvrequest(InvrequestDefaultVO reqVO);

    public int updateStatus(InvrequestDefaultVO reqVO);
}