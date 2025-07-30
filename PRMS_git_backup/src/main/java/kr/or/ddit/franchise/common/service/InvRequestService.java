package kr.or.ddit.franchise.common.service;

import java.util.List;

import kr.or.ddit.vo.def.InvrequestDefaultVO;

public interface InvRequestService {
	public int deleteInvrequest(String fireqId);

    public int insertInvrequest(InvrequestDefaultVO reqVO);

    public InvrequestDefaultVO selectInvrequest(String fireqId);

    public List<InvrequestDefaultVO> selectInvrequestList();

    public int updateInvrequest(InvrequestDefaultVO reqVO);

	public int updateStatus(InvrequestDefaultVO reqVO);
}
