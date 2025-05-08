package kr.or.ddit.market.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class chkeditorUploadController {

	 @Autowired
	    private ServletContext servletContext;

	    @Value("D:/saveFiles")
	    private File saveFolder; // 실제 파일 시스템 경로 설정

	    @PostConstruct
	    public void init() throws IOException {
	        if (!saveFolder.exists()) {
	            saveFolder.mkdirs();
	        }
	        log.info("파일 저장 경로: {}", saveFolder.getAbsolutePath());
	    }

	    @PostMapping(value = "/prod/file/upload", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public Map<String, Object> uploadFile(@RequestPart MultipartFile upload) throws IOException {
	        Map<String, Object> result = new HashMap<>();

	        if (upload.isEmpty()) {
	            result.put("error", Collections.singletonMap("message", "파일이 비어있음."));
	            return result;
	        }

	        // 파일 확장자 체크 로직 제거
	        String originalFilename = upload.getOriginalFilename();
	        String fileExtension = originalFilename != null ? originalFilename.substring(originalFilename.lastIndexOf(".")) : "";
	        String saveName = UUID.randomUUID().toString() + fileExtension;
	        File saveFile = new File(saveFolder, saveName);
	        upload.transferTo(saveFile);

	        String url = String.format("%s/files/%s", servletContext.getContextPath(), saveName);
	        result.put("url", url);
	        return result;
	    }

	    @PostMapping(value = "/prod/file/update", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public Map<String, Object> updateFile(
	            @RequestParam("fileId") String fileId, 
	            @RequestPart(value = "newFile", required = false) MultipartFile newFile) throws IOException {
	        
	        Map<String, Object> result = new HashMap<>();

	        // 기존 파일이 있는 경우
	        if (fileId != null && !fileId.isEmpty()) {
	            File existingFile = new File(saveFolder, fileId);
	            if (existingFile.exists()) {
	                // 파일이 새로 업로드 되지 않은 경우(삭제만)
	                if (newFile == null || newFile.isEmpty()) {
	                    if (existingFile.delete()) {
	                        result.put("message", "파일이 성공적으로 삭제되었습니다.");
	                    } else {
	                        result.put("error", Collections.singletonMap("message", "파일 삭제에 실패했습니다."));
	                        return result;
	                    }
	                } else {
	                    // 파일이 새로 업로드 된 경우(기존 파일 대체)
	                    String fileExtension = newFile.getOriginalFilename() != null 
	                                           ? newFile.getOriginalFilename().substring(newFile.getOriginalFilename().lastIndexOf(".")) 
	                                           : "";
	                    File updatedFile = new File(saveFolder, fileId + fileExtension);
	                    newFile.transferTo(updatedFile);

	                    String url = String.format("%s/files/%s", servletContext.getContextPath(), updatedFile.getName());
	                    result.put("url", url);
	                }
	            } else {
	                result.put("error", Collections.singletonMap("message", "기존 파일을 찾을 수 없습니다."));
	                return result;
	            }
	        } else if (newFile != null && !newFile.isEmpty()) {
	            // 파일이 처음 업로드되는 경우
	            String originalFilename = newFile.getOriginalFilename();
	            String fileExtension = originalFilename != null 
	                                   ? originalFilename.substring(originalFilename.lastIndexOf(".")) 
	                                   : "";
	            String saveName = UUID.randomUUID().toString() + fileExtension;
	            File saveFile = new File(saveFolder, saveName);
	            newFile.transferTo(saveFile);

	            String url = String.format("%s/files/%s", servletContext.getContextPath(), saveName);
	            result.put("url", url);
	        } else {
	            result.put("message", "업로드할 파일이 없습니다.");
	        }

	        return result;
	    }
	}
    
//    @Controller
//    public class PostController {
//
//        @Value("D:/saveFiles")
//        private File saveFolder; // 파일 저장 경로
//
//        @PostMapping("/post/{id}/delete")
//        public String deletePost(@PathVariable String id, RedirectAttributes redirectAttributes) {
//   
//            List<String> imageFiles = getImageFilesForPost(id); // 게시물에 연결된 이미지 파일명을 가져오는 메소드
//            for (String imageFile : imageFiles) {
//                File file = new File(saveFolder, imageFile);
//                if (file.exists()) {
//                    file.delete(); // 파일 삭제
//                }
//            }
//
//            // 3. 리다이렉트
//            redirectAttributes.addFlashAttribute("message", "게시물이 삭제되었습니다.");
//            return "redirect:/posts";
//        }

