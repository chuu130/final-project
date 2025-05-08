package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class FoundDefaultVO implements Serializable {

    private String foundNo;
	@NotBlank
    private String foundNm;

    private String foundTelno;
    @Email
    private String foundEmail;
    @NotBlank
    private String foundZip;
    @NotBlank
    private String foundAdres1;
    @NotBlank
    private String foundAdres2;
    @NotBlank
    private String foundCn;

    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate foundDe;
    @NotBlank
    private String foundPlace;

    private String foundAtch;

    private String foundSideSe;

    private String foundLicenseAt;

    private String foundConfmAt;

    private String empNo;

    private String empNm;

    private EmployeeDefaultVO employee;

//    private List<CounselDefaultVO> counselList;



    private static final long serialVersionUID = 1L;
}