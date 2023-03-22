package com.camp.s1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
public class QnaService implements BoardService{
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		
		
		pager.makeNum(qnaDAO.getTotalCount(pager));
		
		pager.makeRow();
		
		return qnaDAO.getBoardList(pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = qnaDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/qna");
		
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
			result = qnaDAO.setBoardFileAdd(boardFileDTO);
		}
		
		
		return result;
	}



	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		List<BoardFileDTO> ar = qnaDAO.getBoardFileList(bbsDTO);
		System.out.println(ar.size());
		int result = qnaDAO.setBoardDelete(bbsDTO);
		
		 
			if(result > 0) {
				String realPath = session.getServletContext().getRealPath("resources/upload/qna");
				boolean check = false;
				
				for (BoardFileDTO boardFileDTO : ar) {
					check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
				}
			}
			
		
		
		return result;
	}

	@Override
	public BoardDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		return qnaDAO.getBoardDetail(bbsDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		return qnaDAO.getBoardFileDetail(boardFileDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		int result = qnaDAO.setBoardUpdate(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/qna");
		
		System.out.println(realPath);
		
		if(result > 0) {
			
		
		for (MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(bbsDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			result = qnaDAO.setBoardFileAdd(boardFileDTO);
			
			}
		
		}
		
		
		return result;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		int result = qnaDAO.setBoardFileDelete(fileNum);
		
		return result;
	}

	@Override
	public int setBoardHitCount(BoardDTO boardDTO) throws Exception {
		return qnaDAO.setBoardHitCount(boardDTO);
	}

	
}
