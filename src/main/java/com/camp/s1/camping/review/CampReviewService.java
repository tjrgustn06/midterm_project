package com.camp.s1.camping.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardFileDTO;
import com.camp.s1.board.ReviewService;
import com.camp.s1.util.FileManager;
import com.camp.s1.util.Pager;

@Service
public class CampReviewService implements ReviewService {
	
	@Autowired
	private CampReviewDAO campReviewDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.setPerPage(5L);
		pager.makeRow();
		pager.makeNum(campReviewDAO.getTotalCount(pager));
		List<BbsDTO> ar = campReviewDAO.getBoardList(pager);
		ArrayList<BbsDTO> result = new ArrayList<BbsDTO>();
		for(BbsDTO bbsDTO:ar) {
			bbsDTO = campReviewDAO.getBoardDetail(bbsDTO);
			result.add(bbsDTO);
		}
		
		return result;
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = campReviewDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/camp/review");
		
		System.out.println(realPath);
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(bbsDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			result = campReviewDAO.setBoardFileAdd(boardFileDTO);
			
		}
		
		return result;
	}

	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return campReviewDAO.setBoardUpdate(bbsDTO);
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		List<BoardFileDTO> ar = campReviewDAO.getBoardFileList(bbsDTO);
		int result = campReviewDAO.setBoardDelete(bbsDTO);
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/camp/review");
			
			for(BoardFileDTO boardFileDTO:ar) {
				boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
		}
		
		return result;
	}

}
