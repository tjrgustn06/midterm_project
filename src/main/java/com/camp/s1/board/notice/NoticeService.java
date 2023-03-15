package com.camp.s1.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;
import com.camp.s1.board.BoardService;
import com.camp.s1.util.FileManager;
import com.camp.s1.util.Pager;

@Service
public class NoticeService implements BoardService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
			
			Long totalCount = noticeDAO.getTotalCount(pager);
			
			
			
			pager.makeNum(totalCount);
			
			
			pager.makeRow();
			
			
		
				
		return noticeDAO.getBoardList(pager);		
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result =  noticeDAO.setBoardAdd(bbsDTO);
		
		//file HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/notice");
		

		System.out.println(realPath);
		

		
		for (MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(bbsDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = noticeDAO.setBoardFileAdd(boardFileDTO);
		}
		
		
		return result;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		
		
		List<BoardFileDTO> ar = noticeDAO.getBoardFileList(bbsDTO);
		int result = noticeDAO.setBoardDelete(bbsDTO);
	
		//HDD에서 삭제
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/notice");
				boolean check = false;
			for (BoardFileDTO boardFileDTO : ar) {
				check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
			
		}
		
		return result;
	}

	@Override
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		return noticeDAO.getBoardDetail(boardDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		return noticeDAO.getBoardFileDetail(boardFileDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session)
			throws Exception {
		int result = noticeDAO.setBoardUpdate(bbsDTO);
		
		if(result > 0) {

			
			//file HDD에 저장
			String realPath = session.getServletContext().getRealPath("resources/upload/notice");
			

			System.out.println(realPath);
			

			
			for (MultipartFile multipartFile : multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(multipartFile, realPath);
				
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setNum(bbsDTO.getNum());
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setOriName(multipartFile.getOriginalFilename());
				
				result = noticeDAO.setBoardFileAdd(boardFileDTO);
			}
		}
		
		return result;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		return noticeDAO.setBoardFileDelete(fileNum);
	}
	
	
	
	
	
	
}
