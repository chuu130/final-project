package kr.or.ddit.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/foundInsert.do")
public class FoundInsertController {

	@Autowired
	FoundService service;

	@PostMapping
	public String consultataionInsert(@Validated(InsertGroup.class) FoundDefaultVO found, @RequestParam(value = "foundAtchFile"
										, required = false) MultipartFile foundAtchFile){
		if (foundAtchFile != null && !foundAtchFile.isEmpty()) {
            String fileName = foundAtchFile.getOriginalFilename();
            found.setFoundAtch(fileName); // 파일 이름을 VO의 속성에 설정
        }
		service.createFound(found);
		return "redirect:/index.do";
	}
}
