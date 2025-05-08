package kr.or.ddit.market.member.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.member.service.BeautyResService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class BeautyReviewController {
	
	@Value("#{appInfo.atchSavePath}") // 리뷰사진 저장경로지정
	private File saveFolder;
	
	@Autowired
	private AtchFileService atchFileService;
	
	@Autowired
	private BeautyResService resService;

	
	@GetMapping("/reviewBeautyUI")
	public String formUI() {
		
		
		return "market:/market/beautyRes;";
		
	}
}
