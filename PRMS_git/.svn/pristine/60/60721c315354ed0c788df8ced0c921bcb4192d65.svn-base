package kr.or.ddit.market.common.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 파일테스트용 컨트롤러입니다 -------------------------------------------------------
 * @author PC-12
 *
 */
@Slf4j
@Controller
@RequestMapping("/upload")
public class FileUploadController {
	
	@Autowired
	private AtchFileService service;


	@GetMapping("/uploadUI")
	public String uploadUI() {
		return "market:/notice/fileTest";
		
	}

	@PostMapping("{atchFileId}/{fileSn}")
	public String uploadFile(
			@RequestParam("uploadFile") MultipartFile[] uploadFiles 
			, RedirectAttributes redirectAttributes
	) throws FileNotFoundException, IOException {
		
		  String path ="D:/saveFiles";
//		  = AtchfileVO.UPLOAD_ROOT_PATH;

		    File saveFolder = new File(path); // 경로에 폴더 없으면 생성
		    if (!saveFolder.exists()) {
		        saveFolder.mkdirs();
		    }

		    AtchfileVO atchFile = new AtchfileVO();
		    List<AtchfiledtVO> fileDetails = new ArrayList<>();
		    
		    for (MultipartFile uploadFile : uploadFiles) {
		        if (!uploadFile.isEmpty()) {
		            AtchfiledtVO fileDetail = new AtchfiledtVO(uploadFile);
//		            fileDetail.uploadFileSaveTo(saveFolder); // 업로드한파일 폴더에 저장하기
		            fileDetails.add(fileDetail); //상세파일정보를 리스트에 넣는다
		        }
		    }

		    atchFile.setFileDetails(fileDetails); 

		    service.createAtchFile(atchFile, saveFolder);

		    redirectAttributes.addFlashAttribute("uploadFile", fileDetails);
		
		return "market:/notice/fileTest";
		
	}

}
