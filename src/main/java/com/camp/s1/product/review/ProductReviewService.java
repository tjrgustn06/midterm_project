package com.camp.s1.product.review;

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
public class ProductReviewService implements ReviewService {
	
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.setPerPage(5L);
		pager.makeRow();
		pager.makeNum(productReviewDAO.getTotalCount(pager));
		List<BbsDTO> ar = productReviewDAO.getBoardList(pager);
		ArrayList<BbsDTO> result = new ArrayList<BbsDTO>();
		for(BbsDTO bbsDTO:ar) {
			bbsDTO = productReviewDAO.getBoardDetail(bbsDTO);
			result.add(bbsDTO);
		}
		
		return result;
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = productReviewDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product/review");
		
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
			result = productReviewDAO.setBoardFileAdd(boardFileDTO);
			
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
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
