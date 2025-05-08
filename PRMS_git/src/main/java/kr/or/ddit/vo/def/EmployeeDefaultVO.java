package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class EmployeeDefaultVO implements Serializable {

	private String empNo;
	private String empId;
	private String empPassword;
	private String empNm;
	private int empSalary;
	private String empZip;
	private String empAdres1;
	private String empAdres2;
	private String empEmail;
	private String empTelno;
	private String empCl;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate empBir;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate empDe;
	private String empLeaveAt;
	private String empLicenseAt;
	private String empProfile;
	private String empResume;
	private String hqId;
	private String franchiseId;

	// 직원분류 정보
	CmmncodeDefaultVO role;

	private static final long serialVersionUID = 1L;
}