package kr.or.ddit.market.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class summernoteController {
	
	
	  @PostMapping("/uploadImage")
	    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) {
	        try {
	            // 파일 저장 경로 설정 (원하는 경로로 변경 가능)
	            String uploadDir = "D:/saveFiles/";
	            // 파일 이름 생성
	            String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            // 파일 저장
	            file.transferTo(new File(uploadDir + filename));
	            // 파일 접근 가능한 URL 반환
	            String fileUrl = "/files/" + filename;
	            
	            return ResponseEntity.ok(fileUrl);
	        } catch (IOException e) {
	            return ResponseEntity.status(500).body("File upload failed");
	        }
	    }
	}

