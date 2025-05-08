package kr.or.ddit.franchise.franchisee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.def.mapper.CmmncodeDefaultMapper;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;

@Mapper
public interface HotelTypeMapper extends CmmncodeDefaultMapper{

	List<CmmncodeDefaultVO> selectHotel();

    CmmncodeDefaultVO selectHotelInfo(String cmmnCodeNm);
}
