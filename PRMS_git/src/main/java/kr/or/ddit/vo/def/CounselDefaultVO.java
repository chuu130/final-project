package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class CounselDefaultVO implements Serializable {
    private String counselNo;

    private String foundNo;

    @DateTimeFormat(iso=ISO.DATE)
    private LocalDate counselDe;

    private String counselCn;

    private String counselAt;

    private String eduNo;

    private List<FoundDefaultVO> foundList;

    private static final long serialVersionUID = 1L;
}