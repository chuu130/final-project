package kr.or.ddit.headquarter.master.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.AdminexpDefaultVO;

public interface AdminExpService {
	public int deleteAdminexp(@Param("adminexpNo") String adminexpNo, @Param("hqId") String hqId);

    public int insertAdminexp(AdminexpDefaultVO adminExpVO);

    public AdminexpDefaultVO selectAdminexp(@Param("adminexpNo") String adminexpNo, @Param("hqId") String hqId);

    public List<AdminexpDefaultVO> selectAdminexpList();

    public int updateAdminexp(AdminexpDefaultVO adminExpVO);
}
