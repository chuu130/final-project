package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.vo.def.CounselDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CounselDefaultMapper {
    public int deleteCounsel(String counselNo);

    public int insertCounsel(CounselDefaultVO couVO);

    public CounselDefaultVO selectCounsel(String counselNo);

    public List<CounselDefaultVO> selectCounselList();

    public int updateCounsel(CounselDefaultVO couVO);

    public int CHeckCounsel(String counselNo);

    public List<CounselDefaultVO> counselAtList();

	public int counselAtUpdate(String counselNo);

	public String selectCounselMax();

	public CounselDefaultVO selectCounselNo(String foundNo);
}