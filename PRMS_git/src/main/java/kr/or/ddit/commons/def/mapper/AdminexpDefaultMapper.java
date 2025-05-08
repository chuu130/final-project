package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AdminexpDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminexpDefaultMapper {
    public int deleteAdminexp(@Param("adminexpNo") String adminexpNo, @Param("hqId") String hqId);

    public int insertAdminexp(AdminexpDefaultVO adminExpVO);

    public AdminexpDefaultVO selectAdminexp(@Param("adminexpNo") String adminexpNo, @Param("hqId") String hqId);

    public List<AdminexpDefaultVO> selectAdminexpList();

    public int updateAdminexp(AdminexpDefaultVO adminExpVO);
}