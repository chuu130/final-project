package kr.or.ddit.api.excel.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ExcelTestVO;

@Mapper
public interface ExcelTestMapper {
	
	/**
	 * 엑셀 데이터를 DB에 등록하는 로직 
	 * @param excelFile
	 * @return
	 */
	public int insertExcelFile(ExcelTestVO excelFile);
}
