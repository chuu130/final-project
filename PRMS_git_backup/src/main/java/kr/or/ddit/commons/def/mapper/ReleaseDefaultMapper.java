package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ReleaseDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReleaseDefaultMapper {
    public int insertRelease(ReleaseDefaultVO relVO);

    public List<ReleaseDefaultVO> selectReleaseList(PaginationInfo paging);

    public ReleaseDefaultVO selectRelease(String orderdetailNo);

	public int countRelease();

	public ReleaseDefaultVO selectReleaseDetail(String orderdetailNo);

	public int updaterelStatus(String orderdetailNo);

	public String checkYn(String orderdetailNo);
}