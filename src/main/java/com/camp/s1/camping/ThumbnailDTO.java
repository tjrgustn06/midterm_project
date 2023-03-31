package com.camp.s1.camping;

import com.camp.s1.board.FileDTO;

public class ThumbnailDTO extends FileDTO{
	
	private Long campNum;
	
	public ThumbnailDTO() {
		
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}
	
}
