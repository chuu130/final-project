package kr.or.ddit.api.excel.service;

import org.springframework.stereotype.Service;

import kr.or.ddit.api.excel.dao.ExcelTestMapper;
import kr.or.ddit.vo.ExcelTestVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ExcelTestServiceImpl implements ExcelTestService {
	
	private final ExcelTestMapper excelTestDao;
	
	
	@Override
	public boolean uploadExcelFile(ExcelTestVO excelFile) {
		
		boolean status = false;
		
		// 엑셀 파일을 업로드한다.
		excelTestDao.insertExcelFile(excelFile);
		
		return status;
	}

}
