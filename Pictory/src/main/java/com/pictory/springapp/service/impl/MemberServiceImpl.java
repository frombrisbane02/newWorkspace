package com.pictory.springapp.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.SavePostDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService<MemberDTO>{
	@Autowired
	private MemberDAO dao;
	
	//로그인
	@Override
	public String isLogin(Map map) {
		
		return dao.isLogin(map);
	}

	public boolean isExist(String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		System.out.println("@@@@@");
		return dao.isExist(map);
	}
	//회원가입
	@Override
	public int signUp(MemberDTO dto) {
		int resultCnt=0;
		resultCnt = dao.signUp(dto);
		System.out.println("에러후 여기로 들어오나요???resultCnt:"+resultCnt);
		return resultCnt;
		
	}

	//회원정보보기
	@Override
	public MemberDTO readMember(String id) {
		MemberDTO dto = null;
		try {
		dto = dao.readMember(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원정보수정 
	@Override
	public MemberDTO updateMember(MemberDTO dto) {
		try {
			dao.updateMember(dto);
			return dao.readMember(dto.getUserId());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//회원 비밀번호 수정 
	@Override
	public int updateMemberPassword(MemberDTO dto) {

		try {
			dao.updateMemberPassword(dto);
		} catch (Exception e) {
			return 0;
		}
		return 1;
		
	}
	
	//카카오로그인 토큰 값 가져오기
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=864c0c83f5039090b5065e41a69f1f0f"); 
			sb.append("&redirect_uri=http://localhost:4040/springapp/member/kakaoLogin.do");
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
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

	public HashMap<String, Object> getUserInfo(String access_Token) {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
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
			System.out.println("#########account#####:"+kakao_account);
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String id = element.getAsJsonObject().get("id").getAsString();
			String profileimg = properties.getAsJsonObject().get("profile_image").getAsString();
			System.out.println("%%%%%%%id%%%%%:"+id);
			System.out.println("%%%%%%%profile_image_url%%%%%:"+profileimg);
			userInfo.put("userNickname", nickname);
			userInfo.put("userEmail", email);
			userInfo.put("userId", id);
			userInfo.put("userProfile", profileimg);
			userInfo.put("userPassword", "1234");
			userInfo.put("userName", "KAKAO");
			userInfo.put("userNo", "SEQ_USERS.CURRVAL");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
		
	public String kakaoLogIn(Model model ,Map<String, Object> userInfo){
		String mem = dao.isLogin(userInfo);
		System.out.println("!!!!!!!!!!!mem:"+mem);
		
		if(mem==null) {
			System.out.println("카카오비회원");
			int newUser = dao.kakaosignUp(userInfo);
			if(newUser > 0) {
				System.out.println("$$$$$$$$$$newUser:"+newUser);
				dao.isLogin(userInfo);
			}
		}
		
		else if(mem.equals("USER")) {
			System.out.println("카카오유저로 들어오면 여기");
		}
		model.addAttribute("userNo",userInfo.get("userNo"));
		model.addAttribute("userId",userInfo.get("userId"));
		model.addAttribute("userPassword",userInfo.get("userPassword"));

		
		return "auth/Login.tiles";
	}
	

	public void unlink(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("test"+result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	//용- 내가 좋아요 한 것들 조회
	@Override
	public List<SavePostDTO> selectLikePost(int memberNo) {
				
		List<SavePostDTO> dto = dao.selectLikePost(memberNo);
		return dto;
	}
	
	//용- 내가 구매 한 것들 조회
	@Override
	public List<SavePostDTO> selectBuyPost(int memberNo) {
		List<SavePostDTO> dto = dao.selectBuyPost(memberNo);
		for(SavePostDTO post : dto) {
			PostDTO p = dao.selectPost(post.getPostNo());
			MemberDTO m = dao.selectMember(p.getUserNo());
			post.setPostUserNickName(m.getUserNickname());
			post.setPostUserProfile(m.getUserProfile());
		}
		
		return dto;
	}
	
	//좋아요 저장소에서 취소
	@Override
	public void deleteLikePost(int postNo) {
		dao.deleteLikePost(postNo);
		System.out.println("서비스임플"+postNo);
	}

}
