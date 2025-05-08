package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class EventDefaultVO implements Serializable {
    private String eventId;

    private String eventNm;

    private String eventCn;
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate eventBeginDe;
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate eventEndDe;

    private String eventImage;

    private String empNo;

    private static final long serialVersionUID = 1L;
}