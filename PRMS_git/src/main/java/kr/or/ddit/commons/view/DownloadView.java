package kr.or.ddit.commons.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.vo.AtchfiledtVO;

//다운로드 용도
public class DownloadView extends AbstractView {
	// 첫번째 스프링 컨테이너의 객체를 빈으로 등록해줘야한다
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model
											, HttpServletRequest request
											, HttpServletResponse response) throws Exception {
		
		AtchfiledtVO fileDetail = (AtchfiledtVO) model.get("fileDetail");
		// 최프때 데이터베이스 vo 설계주의
		// 다운로드 처리를 한다는건 클라이언트가 1GB를 전송 미들티어(savefile폴더)
		// 어디에 저장되어있다는 fileDetail디비에 메타데이타
		// 그렇게 가지고 온아이가 AtchFileDetailVO 임 - 표그려주심
		
		String saveFilePath = fileDetail.getFileStreCours(); 
		//저장경로/ 어디에 어떤 데이터 / 저장 경로와 저장이름가져온다 
		
		// 파일을 공개된 영역에서 동작할수있도록 컨트롤러를 만들어줌 클라이언트 요청이 가능하게
		
		File saveFile = new File(saveFilePath); //AtchFileDetailVO fileDetail 파일 객체를 통해 저장
		
		// 공개 영역과 비공개 영역 / 어디에있다는건 받아왔으니까 비공개영역에서 공개영역에서 받은 응답을 읽어들일수
		// 있는 인풋 아웃풋 스트림이 필요하다 / 미디어 객체/ 1차 /2차
		// 파일 인풋스트림 필요 / 
		
		// 스트림 카피
		try(
		FileInputStream fis = new FileInputStream(saveFile);
		OutputStream os = response.getOutputStream(); 
		// 라이터랑 아웃풋 스트림으로 받아올수있는데 / 문자일지 이미지일지 잘모름 내보낼때 1바이트면 나갈때도
		){
			// 헤더구성*******
			// 생략했을때만 inline, 첨부된 형태로 다운로드 형태는 -? inline[attarchment];
			// 폼을통해서 저장을하는게 아니기때문에 파트는 필요없고 
			// 파일명은 해줘야함
			
			// 구체적인 메타데이터 3가지 세팅 해주고 내보내기 
			// 1. 타입 Content-Disposition
			// 2. MediaType 브라우저에 바로 보여줄건지 다운로드 attachment / 파일 이름을 통해서 / 한글 포함경우가 많아 밑처럼 지정
			// 3
			String filename = URLEncoder.encode(fileDetail.getOrignlFileNm(), "UTF-8")
					.replace("+", ""); // + 를 공백으로
			
			String ContentDisposition =
					String.format("attachment; filename=\"%s\"", filename);
			
			response.setHeader("Content-Disposition", ContentDisposition);
			
			// 컨텐츠가 나갈때 마임타입도 같이 나가야한다
//			response.setContentType(fileDetail.getContentType()); // 바로 그릴려고 할때
					// 우리는 다운로드 받아서 파일을 저장하려고 한다 이용 x
			
			
//			octet-stream 숫자8 / 바이트단위의 스트림데이터를 내보내는중 
			
			response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
			response.setContentLengthLong(fileDetail.getFileSize()); // chunk가 쪼개진다면 다운로드 퍼센트로 쪼개야되기때문에
			
			IOUtils.copy(fis, os); // 다운로드 처리 끝
			
			// 디스포지션 타입 길이
			
		}
		
	}

}
