package com.camp.s1.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.camp.s1.board.BoardFileDTO;

@Component("fileDownView")
public class FileDownView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		BoardFileDTO boardFileDTO = (BoardFileDTO)model.get("boardFile");
		
		//Key : boardName, boardFile
		
		System.out.println("FileDown View 들어옴");
		
		//경로 준비
		
		//model에서 boardName 가져오기
		String path = (String)model.get("boardName");
		path = "resources/upload/"+path+"/";
		//매개변수로 받은 request 내장객체에서 Application 내장객체까지 가져온 후 realPath까지 가져옴
		path = request.getSession().getServletContext().getRealPath(path);
		
		//실제경로와 파일정보가 담긴 dto를 담아서 파일객체 생성 
		File file = new File(path, boardFileDTO.getFileName());
		
		//응답시 한글 Encoding 처리
		response.setCharacterEncoding("UTF-8");
		//파일의 크기
		response.setContentLength((int)file.length());
		
		//파일 다운로드시 파일 이름 지정 및 인코딩 설정
		String downName = boardFileDTO.getOriName();
		downName = URLEncoder.encode(downName, "UTF-8");
		
		//header 정보 설정
		response.setHeader("Content-disposition","attachment;fileName=\"" + downName +"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//전송
		FileInputStream is = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		//자원 해제
		is.close();
		os.close();
	}

	
}
