package com.camp.s1.camping;

import com.camp.s1.board.FileDTO;

public class CampFileDTO extends FileDTO{

	private Long campNum;
	
	public CampFileDTO() {
		
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}
	
}