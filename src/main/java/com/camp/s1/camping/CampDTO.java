package com.camp.s1.camping;

import java.util.List;

public class CampDTO {
	
	private Long campNum;
	private String campName;
	private String phone;
	private String address;
	private String lineIntro;
	private String intro;
	private String feature;
	private String induty;
	private String doName;
	private String sigunguName;
	private String glampFacility;
	private String caravFacility;
	private String service;
	private String posblFacility;
	private String petAllow;
	private String useInfo;
	private String homePage;
	private String thumbnail;
	private String regDate; //date
	private String modiDate; //date
	private Long hit;
	private List<CampFileDTO> campFileDTOs;
	private List<CampSiteDTO> campSiteDTOs;
	private ThumbnailDTO thumbnailDTO;
	private LayoutDTO layoutDTO;
	
	public CampDTO() {
		
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLineIntro() {
		return lineIntro;
	}

	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getInduty() {
		return induty;
	}

	public void setInduty(String induty) {
		this.induty = induty;
	}

	public String getDoName() {
		return doName;
	}

	public void setDoName(String doName) {
		this.doName = doName;
	}

	public String getSigunguName() {
		return sigunguName;
	}

	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}

	public String getGlampFacility() {
		return glampFacility;
	}

	public void setGlampFacility(String glampFacility) {
		this.glampFacility = glampFacility;
	}

	public String getCaravFacility() {
		return caravFacility;
	}

	public void setCaravFacility(String caravFacility) {
		this.caravFacility = caravFacility;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getPosblFacility() {
		return posblFacility;
	}

	public void setPosblFacility(String posblFacility) {
		this.posblFacility = posblFacility;
	}

	public String getPetAllow() {
		return petAllow;
	}

	public void setPetAllow(String petAllow) {
		this.petAllow = petAllow;
	}

	public String getUseInfo() {
		return useInfo;
	}

	public void setUseInfo(String useInfo) {
		this.useInfo = useInfo;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModiDate() {
		return modiDate;
	}

	public void setModiDate(String modiDate) {
		this.modiDate = modiDate;
	}

	public Long getHit() {
		return hit;
	}

	public void setHit(Long hit) {
		this.hit = hit;
	}

	public List<CampFileDTO> getCampFileDTOs() {
		return campFileDTOs;
	}

	public void setCampFileDTOs(List<CampFileDTO> campFileDTOs) {
		this.campFileDTOs = campFileDTOs;
	}

	public List<CampSiteDTO> getCampSiteDTOs() {
		return campSiteDTOs;
	}

	public void setCampSiteDTOs(List<CampSiteDTO> campSiteDTOs) {
		this.campSiteDTOs = campSiteDTOs;
	}

	public ThumbnailDTO getThumbnailDTO() {
		return thumbnailDTO;
	}

	public void setThumbnailDTO(ThumbnailDTO thumbnailDTO) {
		this.thumbnailDTO = thumbnailDTO;
	}

	public LayoutDTO getLayoutDTO() {
		return layoutDTO;
	}

	public void setLayoutDTO(LayoutDTO layoutDTO) {
		this.layoutDTO = layoutDTO;
	}	
	
}
