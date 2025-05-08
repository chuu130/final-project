package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AtchfileVO;
import lombok.Data;

@Data
public class NoticeDefaultVO implements Serializable {
    private String noticeBbsNo; // 게시판 번호

    private String noticeBbsSe; // 게시판 구분

    private String noticeBbsNm; // 게시판명

    private String noticeBbsCn; // 게시판 내용
    
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate noticeBbsDe; // 게시판 등록일

    private String noticeBbsRegister; // 게시판 등록자

    private AtchfileVO atchFile; // 게시판 첨부파일 //파일의 메타데이터 역할
    
    private Integer noticeBbsAtch; // 게시판 첨부파일 atchFileId

    private String empNo; // 직원번호
    
    private String empId; // 직원아이디
    
    private String empNm; // 직원이름
    
    private String noticeBbsHit; // 게시판 내용

    //스프링 파일객체 배열
    //jsp 에서 submit할 때 파일객체들을 받을 때
    //<input type="file".. name="uploadFile" multiple /> 
    private MultipartFile[] uploadFile;
    //사용자가 업로드한 실제 파일을 담는 MultipartFile 객체입니다. 
    //이는 서버에서 직접 파일을 처리하고 저장하는 데 사용


    
    private static final long serialVersionUID = 1L;
}