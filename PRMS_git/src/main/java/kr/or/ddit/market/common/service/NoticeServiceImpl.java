package kr.or.ddit.market.common.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.NoticeDefaultMapper;
import kr.or.ddit.commons.exception.BoardException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.AtchfiledtVO;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeDefaultMapper mapper;
	private final AtchFileService atchFileService;
	
	@Value("#{appInfo.atchSavePath}")
	private File saveFolder;// AppInfo 설정 및 properties 파일 빈 등록(root-context.xml)
	
	
	@PostConstruct
	public void init() throws IOException {
		if(!saveFolder.exists()) saveFolder.mkdirs();
		log.info("공지사항 이미지 저장 경로 : {}" , saveFolder.getAbsolutePath());
	}	
	

	/**
	 * 공지사항 등록
	 * @return 
	 */
	@Override
	public void registerNotice(NoticeDefaultVO row) {
		Optional.ofNullable(row.getAtchFile()) // 널이 아니면 vo의첨부파일 가져오기
			.ifPresent(af->{					// af(AtchFile)존재하면
				atchFileService.createAtchFile(af, saveFolder);// 파일 만들기
				row.setNoticeBbsAtch(af.getAtchFileId()); //가져온 아이디에 해당하는 파일저장
			});
		mapper.insertNotice(row); // 게시물 등록
	}
	

	/**
	 * 공지사항 게시글 상세조회
	 */
	@Override
	public NoticeDefaultVO retrieveByNoticeNo(String noticeBbsNo) {
		NoticeDefaultVO notice = mapper.selectByNoticeNo(noticeBbsNo);// 게시글 번호기준 공지사항 저장
		if(notice==null)
			throw new BoardException(String.format("%d 번 글이 없음.", noticeBbsNo));
		
		Optional.ofNullable(notice.getNoticeBbsAtch()) // 널이 아니면 vo의첨부파일id 가져오기
		.ifPresent(fid->{					// af(AtchFile)존재하면
			AtchfileVO atch = atchFileService.readAtchFile(fid, true, saveFolder);
			notice.setAtchFile(atch); // 해당하는 첨부파일저장
		});
		return notice;
	}

	/**
	 * 공지사항 전체 목록 조회
	 */
	@Override
	public List<NoticeDefaultVO> retrieveAllNotice(PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		return mapper.selectAllNotice(paging); // 전체 목록 가져오기
	}
	
	/**
	 * 기존의 첨부파일 그룹이 있는 경우, 신규 파일과 기존 파일 그룹을 병합해 저장함.
	 * @param atchFileId
	 */
//	private int mergeSavedDetailsAndNewDetails(AtchfileVO savedAtchFile, AtchfileVO newAtchFile) {
//		log.info("savedAtchFile 값은????",savedAtchFile);
//		log.info("newAtchFile 값은????",newAtchFile);
//		
//		AtchfileVO mergeAtchFile = new AtchfileVO(); // 새로운 파일병합 객체
//		List<AtchfiledtVO> fileDetails = new ArrayList<>(); // 파일 디테일들을 리스트로 만들고
//		mergeAtchFile.setFileDetails(fileDetails); // 이디테일들을 새로운 파일병합 객체에 저장
//		fileDetails.addAll(newAtchFile.getFileDetails()); // newAtchFile에서 가져온 디테일들 AtchfiledtVO에 저장
//		
//		if(savedAtchFile!=null && savedAtchFile.getFileDetails()!=null) { // 널이 아니라면
//			fileDetails.addAll(savedAtchFile.getFileDetails()); // 저장된 디테일들을 파일리스트에 저장
//			
//			// 기존 첨부파일 그룹은 비활성화
//			atchFileService.disableAtchFile(savedAtchFile.getAtchFileId());
//		}
//		
//		atchFileService.createAtchFile(mergeAtchFile, saveFolder); // 병합된 파일을 합쳐서 새로 만들기
//		
//		return mergeAtchFile.getAtchFileId();
//	}
	

	/**
	 * 공지사항 수정
	 */
	@Override
	public int modifyNotice(NoticeDefaultVO row) {		
		Optional.ofNullable(row.getAtchFile()) //널이아니면 파일 가져오기
				.filter(af->af.getFileDetails()!=null) // 파일 디테일이 널이아니라면
				.ifPresent(af->{
//					int newAtchFileId = mergeSavedDetailsAndNewDetails(row.getAtchFile(), af);
					// 새로운 파일아이디에 병합된 파일을 저장
//					row.setNoticeBbsAtch(newAtchFileId); // 새로운 아이디를 보드 넘버에 저장
					atchFileService.createAtchFile(af, saveFolder);// 파일 만들기
					row.setNoticeBbsAtch(af.getAtchFileId()); //가져온 아이디에 해당하는 파일저장
				});
		return mapper.updateNotice(row); // 업데이트
		
//		String existhit = notice.getNoticeBbsHit(); // 게시판 현재조회수 저장
//		notice.setNoticeBbsHit(existhit); // 조회수 세팅
		
	}
	
	/**
	 * 공지사항 삭제
	 * NoticeBbsAtch = atchfileid = fid
	 */
	@Override
	public int removeNotice(String noticeBbsNo) {
		NoticeDefaultVO saved = retrieveByNoticeNo(noticeBbsNo);
		// 게시글 번호기준 공지사항 저장
		Optional.ofNullable(saved.getNoticeBbsAtch()) // 널이 아니면 파일에서
//		.map(af->af.getAtchFileId())		     // 아이디를 가져오고(getNoticeBbsAtch)
		.ifPresent(fid->{						// 파일 아이디가 있다면
			atchFileService.disableAtchFile(fid); // 파일그룹 비활성화
			atchFileService.removeDiabledAtchFile(fid); // 파일그룹 제거
			});

		return mapper.deleteNotice(noticeBbsNo); // 게시물 삭제
	}

	/**
	 * 공지사항 조회수 증가
	 */
	@Override
	public int incrementHitNO(String noticeBbsNo) {
		return mapper.incrementHit(noticeBbsNo);
	}


	/**
	 * 공지사항 파일 다운로드
	 */
	@Override
	public AtchfiledtVO download(int atchFileId, int fileSn) {
		return Optional.ofNullable(atchFileService.readAtchFileDetail(atchFileId, fileSn, saveFolder)) 
				// 널이 아니면 저장된 폴더에서 파일 상세를 가져오고
						.filter(fd->fd.getSavedFile().exists()) // 존재한다면 저장된 파일을 가져온다
						.orElseThrow(()->new BoardException(String.format("[%d, %d]해당 파일이 없음.", atchFileId, fileSn)));
						//아니면 에러 출력
	}

	/**
	 * 파일 한건 삭제
	 */
	@Override
	public void removeFile(int atchFileId, int fileSn) {
		atchFileService.removeAtchFileDetail(atchFileId, fileSn, saveFolder);
	}


	/**
	 * 페이징 없는 공지사항 리스트 조회
	 */
	@Override
	public List<NoticeDefaultVO> retrieveAllNoticeNonPaging() {
		return mapper.selectAllNoticeNonPaging();
	}

}
