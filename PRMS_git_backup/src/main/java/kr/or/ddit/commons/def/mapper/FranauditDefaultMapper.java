package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.FranauditDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FranauditDefaultMapper {
    public int deleteFranAudit(String auditNo);

    public int insertFranAudit(FranauditDefaultVO auditVO);

    public FranauditDefaultVO selectFranAudit(String auditNo);
 
    public List<FranauditDefaultVO> selectFranAuditList();

    public int updateFranAudit(FranauditDefaultVO auditVO);
}