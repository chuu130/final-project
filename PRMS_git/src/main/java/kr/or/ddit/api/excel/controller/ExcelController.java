package kr.or.ddit.api.excel.controller;

import java.io.IOException;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.api.excel.service.ExcelTestService;
import kr.or.ddit.vo.ExcelTestVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/excel")
public class ExcelController {
	
	private final ExcelTestService excelTestService;
	
	@GetMapping("excelUI")
	public String excelUI() {
		return "tiles:/excel/excelUI";
	}
	
	
	@PostMapping("excelUpload")
	public String excelUploadProcess(
			@RequestParam("file") MultipartFile uploadFile
			,Model model
			,RedirectAttributes redirectAttributes
	) {
		
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(uploadFile.getInputStream());
			XSSFSheet workSheet = workbook.getSheetAt(0);
			
			for(int i = 1; i < workSheet.getPhysicalNumberOfRows(); i++) {
				
				DataFormatter formatter = new DataFormatter();
				XSSFRow row = workSheet.getRow(i);
				
				
				Integer userNo = Integer.parseInt(formatter.formatCellValue(row.getCell(0)));
				String userName = formatter.formatCellValue(row.getCell(1));
				String userEmail = formatter.formatCellValue(row.getCell(2));
				String userId = formatter.formatCellValue(row.getCell(3));
				String userPhone = formatter.formatCellValue(row.getCell(4));
				String userType = formatter.formatCellValue(row.getCell(5));
				
				
				ExcelTestVO  excelFile = new ExcelTestVO(userNo, userName, userEmail, userId, userPhone, userType);
				
				excelTestService.uploadExcelFile(excelFile);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		redirectAttributes.addFlashAttribute("msg","업로드 성공!");
		return "redirect:/excel/excelUI";
	}
	
	
}
