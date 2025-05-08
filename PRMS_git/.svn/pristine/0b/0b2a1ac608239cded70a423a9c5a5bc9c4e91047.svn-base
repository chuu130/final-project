package kr.or.ddit.headquarter.master.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.market.common.service.NoticeService;
import kr.or.ddit.vo.AtchfiledtVO;

@Controller
@RequestMapping("/main/masterNotice/atch")
public class DownloadAndDeleteAtchController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("{atchFileId}/{fileSn}")
	public ResponseEntity<Resource> download(AtchfiledtVO target) throws IOException {
		AtchfiledtVO atch = service.download(target.getAtchFileId(), target.getFileSn());
		
		Resource savedFile = atch.getSavedFile();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentLength(atch.getFileSize());
		ContentDisposition disposition = ContentDisposition.attachment()
											.filename(atch.getOrignlFileNm(), Charset.forName("UTF-8"))
											.build();
		headers.setContentDisposition(disposition);
		return ResponseEntity.ok()
						.headers(headers)
						.body(savedFile);
	}
	
	/**
	 * 파일 삭제용
	 * @param atchFileId
	 * @param fileSn
	 * @return
	 */
	@DeleteMapping("{atchFileId}/{fileSn}")
	@ResponseBody
	public Map<String, Object> deleteAttatch(@PathVariable int atchFileId, @PathVariable int fileSn) {
		service.removeFile(atchFileId, fileSn);
		return Collections.singletonMap("success", true);
	}
	
}
















