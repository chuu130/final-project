package kr.or.ddit.franchise.franchisee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Mapper
public interface FranMemoRandumMapper{

	/**
	 * franchiseId를 이용해 memoList 출력
	 */
	public List<FranchiseDefaultVO> selectfranmemoList(String franchiseId);
}
