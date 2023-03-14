package com.camp.s1.util;

public class Pager {

	// 검색
	
	// 검색을 위한 num
	private Long num;
	
	// 검색종류(사용할 colunm
	private String kind;
	// 검색어
	private String search;
	
	public String getKind() {
		return kind;
	}

	// 검색 getter, setter
	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search==null) {
			search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}
	
	// Pageing
	
	//Table에서 초회할 시작번호
	private Long startRow;
	//Table에서 조회할 끝번호
	private Long lastRow;
	
	// Page 번호(parameter)
	private Long page;
	// 한페이지에 출력할 Row의 갯수
	private Long perPage;
	// 전체 page 갯수
	private Long totalPage;
	
	// 한블럭당 출력할 번호의 갯수
	private Long perBlock;
	
	// curBlock의 시작번호
	private Long startNum;
	// curBlock의 끝번호
	private Long lastNum;
	
	// 첫페이지가기 위한 before
	private boolean before;
	// 끝페이지가기 위한 after
	private boolean after;

	// startRow, LastRow 계산하는 메서드
	public void makeRow() {
		this.startRow=(this.getPage()-1)*this.getPerPage()+1;
		this.lastRow=this.getPage()*this.getPerPage();
		
	}
	
	// startNum, LastNum 계한하는 메서드
	public void makeNum(Long totalCount) {
		// 1. 전체 row의 갯수 구하기
		// 2. 총 page의 갯수 구하기
		this.totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			totalPage++;
		}
		if(this.getPage()>totalPage ) {
			this.setPage(totalPage);
		}
		// 3. 한 블럭에 출력할 번호의 갯수
		// 4. 총 블럭의 수 구하기
		Long totalBlock = totalPage/this.getPerBlock();
		if(totalPage%getPerBlock()!=0) {
			totalBlock++;
		}
		// 5. page 번호로 현재 블럭 번호 구하기
		Long curBlock = this.getPage()/this.getPerBlock();
		if(this.getPage()%this.getPerBlock()!=0) {
			curBlock++;
		}
		// 6. curBlock의 시작번호와 끝번호를 계산
		this.startNum = (curBlock-1)*this.getPerBlock()+1;
		this.lastNum = curBlock*this.getPerBlock();
		
		// 7. 첫페이지 끝페이지를 위한 before, after
		if(curBlock==1) {
			this.before=true;
		}
		if(curBlock==totalBlock) {
			lastNum=totalPage;
			this.after=true;
		}
		
	}
	
	// paging getter, setter
	public Long getPage() {
		if(this.page==null || this.page<1) {
			this.page=1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getPerPage() {
		if(this.perPage==null || this.perPage==0) {
			this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}

	public Long getTotalPage() {
		return totalPage;
	}
	public Long getPerBlock() {
		if(this.perBlock==null || this.perBlock<1) {
			this.perBlock=5L;
		}
		return perBlock;
	}

	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}
	
	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	
	public boolean isBefore() {
		return before;
	}

	public void setBefore(boolean before) {
		this.before = before;
	}

	public boolean isAfter() {
		return after;
	}

	public void setAfter(boolean after) {
		this.after = after;
	}
	
}
