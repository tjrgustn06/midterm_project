package com.camp.s1.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.cart.CartDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.util.FileManager;
import com.camp.s1.util.Pager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	// List출력
	public List<ProductDTO> getProductList(Pager pager) throws Exception {
		
		pager.makeRow();
		
		
		pager.makeNum(productDAO.getTotalCount(pager));
		List<ProductDTO> ar = productDAO.getProductList(pager);
		
		for(ProductDTO productDTO:ar) {
			productDTO.setProductFileDTOs(productDAO.getProductDetail(productDTO).getProductFileDTOs());
		}
		
		return ar;
	}
	
	// productListTop 출력
	public List<ProductDTO> getProductListTop(Pager pager) throws Exception {
		pager.setPerPage(4L);
		pager.makeRow();
		
		List<ProductDTO> ar = productDAO.getProductList(pager);
		for(ProductDTO productDTO:ar) {
			productDTO.setProductFileDTOs(productDAO.getProductDetail(productDTO).getProductFileDTOs());
		}
		
		return ar;
		
	}
	
	// CartBar 출력
	public List<CartDTO> getCartBarList(CartDTO cartDTO) throws Exception {
		List<CartDTO> ar = productDAO.getCartBarList(cartDTO);
		for(CartDTO cartDTO2:ar) {
			cartDTO2.setProductFileDTO(productDAO.getCartBarFileDetail(cartDTO2));
		}
		
		return ar; 
	}
	
	// Detail 상세페이지 출력
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		productDTO = productDAO.getProductDetail(productDTO);
		return productDTO;
	}
	
	// Add 물품 추가
	public int setProductAdd(ProductDTO productDTO, MultipartFile [] files, HttpSession session) throws Exception {
		int result = productDAO.setProductAdd(productDTO);
		
		for(ProductGradeDTO productGradeDTO:productDTO.getProductGradeDTOs()) {
			productGradeDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setProductGradeAdd(productGradeDTO);
			
		}
		
		
		//file HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/product");
		
		System.out.println(realPath);
		
		for (MultipartFile multipartFile : files) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			ProductFileDTO productFileDTO = new ProductFileDTO();
			productFileDTO.setProductNum(productDTO.getProductNum());
			productFileDTO.setFileName(fileName);
			productFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = productDAO.setProductFileAdd(productFileDTO);
		}
		
		return result;
	}
	
	// Update 물품 수정
	public int setProductUpdate(ProductDTO productDTO, MultipartFile [] files, HttpSession session) throws Exception {
		int result = productDAO.setProductUpdate(productDTO);
		for(ProductGradeDTO productGradeDTO:productDTO.getProductGradeDTOs()) {
			productGradeDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setProductGradeUpdate(productGradeDTO);			
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product");
		
		System.out.println(realPath);
		
		for (MultipartFile multipartFile : files) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			ProductFileDTO productFileDTO = new ProductFileDTO();
			productFileDTO.setProductNum(productDTO.getProductNum());
			productFileDTO.setFileName(fileName);
			productFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = productDAO.setProductFileAdd(productFileDTO);
		}
		return result;
	}
	
	public int setProductFileDelete(Long fileNum) throws Exception {
		return productDAO.setproductFileDelete(fileNum);
	}
	
	// Delete 물품 삭제
	public int setProductDelete(ProductDTO productDTO, HttpSession session) throws Exception {
		
		List<ProductFileDTO> ar = productDAO.getProductFileList(productDTO);
		int result = productDAO.setProductDelete(productDTO);
		
		//HDD에서 삭제
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/product");
			boolean check = false;
			for(ProductFileDTO productFileDTO : ar) {
				check = fileManager.fileDelete(realPath, productFileDTO.getFileName());
			}
		}
		return result;
	}

}
