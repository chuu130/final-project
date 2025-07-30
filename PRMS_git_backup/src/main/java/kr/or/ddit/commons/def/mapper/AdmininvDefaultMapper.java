package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdmininvDefaultMapper {
    public int deleteAdminInv(String prodId);

    public int insertAdminInv(AdmininvDefaultVO invVO);

    public AdmininvDefaultVO selectAdminInv(String prodId);

    public List<AdmininvDefaultVO> selectAdminInvList(PaginationInfo paging);

    public int updateAdminInv(AdmininvDefaultVO invVO);
}