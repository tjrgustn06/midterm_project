package com.camp.s1.board.story;

import java.util.ArrayList;
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
public class StoryService implements BoardService {

	@Autowired
	private StoryDAO storyDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		Long totalCount = storyDAO.getTotalCount(pager);
		
		pager.makeNum(totalCount);
		
		pager.makeRow();
		//글을 특정 갯수만큼 불러오고 싶은 경우 
		// file테이블과 join하는 쿼리문을 쓰면 파일 갯수만큼 rownum이 늘어나서 의도한 글 갯수만큼 불러오지 못함
		
		List<BbsDTO> bbsDTOs = storyDAO.getBoardList(pager);
	
		
		//특정 갯수의 글들을 먼저 가져오고 그다음 반복문으로 각 dto에 파일리스트를 넣어줌	
		for (BbsDTO bbsDTO : bbsDTOs) {
			//StoryDTO의 멤버변수 접근을 위해 형변환  
			//참조변수간에는 형변환을 해도 주소값은 그대로이다
//			 StoryDTO dto = (StoryDTO)bbsDTO;
			 ((StoryDTO)bbsDTO).setBoardFileDTOs(storyDAO.getBoardFileList(bbsDTO));;
			 

//			 dto.setBoardFileDTOs(storyDAO.getBoardFileList(dto));	 
			 	
		}
		
		//주소값은 그대로이므로 그대로 List<BbsDTO> 리턴
		return bbsDTOs; 
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = storyDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/story");
		
		System.out.println("RealPath : " + realPath);
		
		for (MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(bbsDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			result = storyDAO.setBoardFileAdd(boardFileDTO);
		}
		
		
		return result;
	}

	@Override
	public BoardDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		return storyDAO.getBoardDetail(bbsDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		return storyDAO.getBoardFileDetail(boardFileDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		
		int result = storyDAO.setBoardUpdate(bbsDTO);
		
		if(result > 0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/story");
			
			for (MultipartFile multipartFile : multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(multipartFile, realPath);
				
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setNum(bbsDTO.getNum());
				boardFileDTO.setOriName(multipartFile.getOriginalFilename());
				
				result = storyDAO.setBoardFileAdd(boardFileDTO);
				
				
				
			}
		}
		
		return result;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		
		List<BoardFileDTO> ar = storyDAO.getBoardFileList(bbsDTO);
		int result = storyDAO.setBoardDelete(bbsDTO);
		
		
		String realPath = session.getServletContext().getRealPath("resources/upload/story");
		
		if(result > 0) {
			boolean check = false;
			
			for (BoardFileDTO boardFileDTO : ar) {
				check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
			
		}
		
		return result;
	}

	@Override
	public int setBoardFileDelete(Long fileNum, HttpSession session) throws Exception {
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		boardFileDTO.setFileNum(fileNum);
		
		boardFileDTO = storyDAO.getBoardFileDetail(boardFileDTO);
		int result = storyDAO.setBoardFileDelete(fileNum);
		
		if(result > 0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/story");
			
			boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
				
		}
		
		
				
		return result;
	}

	@Override
	public int setBoardHitCount(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
