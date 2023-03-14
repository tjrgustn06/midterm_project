package com.camp.s1.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	public String fileSave(MultipartFile multipartFile, String path) throws Exception {
		//1. 저장경로 매개변수(path) 
		//resources/upload/notice/...
		
		//2. 저장관리는 OS(windows)가 담당한다
		//os와의 통신이 필요한데 이것을 Apllication 내장객체가 담당. java에서는 ServletContext가 담당
		
		//폴더경로의 정보만 가지고있는  File객체 
		File file = new File(path);
		
		if(!file.mkdir()) {
			file.mkdirs();
		}
		
		//3. 파일명 생성
		
		//절대 중복되지 않는 이름을 만드는 클래스. UUID(Universial Unique IDentified Name)
		String name = UUID.randomUUID().toString();
		
		//4.확장자 추가.
		//1) OriginalName을 그냥 붙여넣는 방법
		name = name + "_" + multipartFile.getOriginalFilename();
		
		System.out.println(name);
		
		//5. 파일 저장
		//정보 준비 - File타입 생성자의 매개변수로 경로정보를 담은 file객체와 파일명 정보가 담긴 name변수를 넘겨줌 
		file = new File(file, name);
		
		//1) Spring API FileCopyUtils 객체의 copy 메서드 사용
		//multipartFile에서 byte 배열을 꺼내고, file에 저장된 정보로 파일을 올리기
		FileCopyUtils.copy(multipartFile.getBytes(), file); 
		
		
		//저장을 마치고 DB에 저장할 파일이름을 리턴 
		return name;
		
		
		
				
		
		
		
		
		
	}
}
