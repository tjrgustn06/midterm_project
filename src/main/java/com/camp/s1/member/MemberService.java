package com.camp.s1.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//IDCheck
	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
		
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		
		boolean check = true;
		
		if(memberDTO != null) {
			check = false;
		}
		return check;
	}
	
	//Join
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberJoin(memberDTO);
		
		for(AddressDTO addressDTO:memberDTO.getAddressDTOs()) {
			addressDTO.setId(memberDTO.getId());
			result = memberDAO.setAddressJoin(addressDTO);
		}
		
		return result;
	}
	
	//Login
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{

		MemberDTO result = memberDAO.getMemberLogin(memberDTO);
		
		if(result != null && memberDTO.getPw().equals(result.getPw())) {
			
			memberDTO.setPw(null);
			memberDTO.setRoleName(result.getRoleName());
			return memberDTO;
			
		}else {
			
			return null;
		}	
	}
	
	//MemberPage
	public MemberDTO getMemberPage(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	//Update
	public int setMemberUpdate(AddressDTO addressDTO, MemberDTO memberDTO)throws Exception {
		
		int result = memberDAO.setMemberUpdate(memberDTO);
		
		addressDTO.setId(memberDTO.getId());
		
		result = memberDAO.setAddressUpdate(addressDTO);
		
		return result;
	}
	
	//Delete
	public int setMemberDelete(AddressDTO addressDTO, MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberDelete(memberDTO);
		
		addressDTO.setId(memberDTO.getId());
		
		result = memberDAO.setAddressDelete(addressDTO);
		
		return result;
	}
	
	//ID찾기
		public MemberDTO findId(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			PrintWriter out = response.getWriter();
			
			MemberDTO id = memberDAO.findId(memberDTO);
			
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				return id;
			}
		}
		
		//pw 찾기
		public MemberDTO findPw(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			PrintWriter out = response.getWriter();
			
			if(memberDTO.getId() == null) {
				 out.println("아이디가 없습니다");
				 out.close();
			}else if(!memberDTO.getEmail().equals(memberDAO.getMemberLogin(memberDTO))){
				 out.println("잘못된 이메일 입니다");
				 out.close();
			}else {
				String pw ="";
				for(int i=0; i<6; i++) {
					pw += (char) ((Math.random() * 26) + 97);		
				}
				memberDTO.setPw(pw);
				System.out.println(pw);
				memberDAO.sendMail(memberDTO, "findPw");
				 out.println("이메일로 임시 비밀번호를 발송하였습니다");
				 out.close();
			}
			return memberDTO;
			
		}
		
			//비밀 번호 변경
		public int setMemberPwChange(MemberDTO memberDTO, String oldPw, HttpServletResponse response)throws Exception{
			PrintWriter out = response.getWriter();
			
			if(oldPw.equals(memberDTO.getPw())){
				
			return memberDAO.setMemberPwChange(memberDTO);
			
			}else {	
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return 0;
			}			
		}
		
		public String getAccessToken (String authorize_code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
				sb.append("&client_id=a68e05dc27f7fb4288530cb001c55c40"); //본인이 발급받은 key
				sb.append("&redirect_uri=http://localhost:80"); // 본인이 설정한 주소
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}
		
		
		// 메서드 리턴타입 KakaoDTO로 변경 및 import.
		public KakaoDTO getUserInfo(String access_Token) {
				HashMap<String, Object> userInfo = new HashMap<String, Object>();
				String reqURL = "https://kapi.kakao.com/v2/user/me";
				try {
					URL url = new URL(reqURL);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					conn.setRequestMethod("GET");
					conn.setRequestProperty("Authorization", "Bearer " + access_Token);
					int responseCode = conn.getResponseCode();
					System.out.println("responseCode : " + responseCode);
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					String line = "";
					String result = "";
					while ((line = br.readLine()) != null) {
						result += line;
					}
					System.out.println("response body : " + result);
					JsonParser parser = new JsonParser();
					JsonElement element = parser.parse(result);
					JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
					JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
					String nickname = properties.getAsJsonObject().get("nickname").getAsString();
					String email = kakao_account.getAsJsonObject().get("email").getAsString();
					userInfo.put("nickname", nickname);
					userInfo.put("email", email);
				} catch (IOException e) {
					e.printStackTrace();
				}

				// catch 아래 코드 추가.
				KakaoDTO result = memberDAO.findKakao(userInfo);
				// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
				System.out.println("S:" + result);
				if(result==null) {
				// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
					memberDAO.KakaoLogin(userInfo);
					// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
					return memberDAO.findKakao(userInfo);
					// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
					//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
				} else {
					return result;
					// 정보가 이미 있기 때문에 result를 리턴함.
				}
		}
}
