package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class FrreviewstDefaultVO implements Serializable {
    private String franreviewReport;

    private LocalDateTime franreviewReportDe;

    private String franreviewReportResn;

    private String reviewNo;

    private static final long serialVersionUID = 1L;
}