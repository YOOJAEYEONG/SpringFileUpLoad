package com.kosmo.k12springapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.IAndroidDAO;
import mybatis.MemberVO;

@Controller
public class AndroidController {

	//mybatis 사용을 위한 자동 주입
	@Autowired
	private SqlSession sqlSession;
	
	//매개변수가 필요 없이 회원리스트 전체를 JSON으로 반환
	@RequestMapping("/android/memberList.do")
	@ResponseBody
	public ArrayList<MemberVO> memberList(HttpServletRequest req){
		System.out.println("/android/memberList.do => 컨트롤러 호출됨");
		
		//JSONObject로 받는 경우 Map을 쓴다
		Map<String, Object> map = new HashMap<String, Object>();
		
		//mybatis 에서 자동으로 리스트로 자동 변환해준다
		ArrayList<MemberVO> lists = sqlSession.getMapper(IAndroidDAO.class).memberList();

		map.put("memberList", lists);
		return lists;
	}


	

	/*
	 * 회원 아이디, 패스워드를 파라미터로 받아서 해당 회원정보를
	 * 반환하는 메소드. 만약 회원정보가 틀리면 isLogin:0을 반환함.
	 */
	@RequestMapping("/android/memberLogin.do")
	@ResponseBody
	public Map<String,Object> memberLogin(MemberVO memberVO){
		/*
		 * 매개변수로 커맨드객체(VO)를 사용하므로 파라미터명은 VO의 필드와
		 * 동일하게 id,pass, name과 같이 사용하면 된다
		 * 요청 URL 
		 *  ->http://localhost:8080/k12springapi/android/memberLogin.do?id=kosmo&pass=1234
		 * 반환값
		 * 	->{"isLogin":1,"memberInfo":{"id":"kosmo","pass":"1234","name":"홍길동","regidate":"2020-05-05"}}
		 */
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		MemberVO memberInfo =
				sqlSession.getMapper(IAndroidDAO.class).memberLogin(memberVO);
		
		
		//회원정보가 일치하지 않으면
		if(memberInfo==null) {
			returnMap.put("isLogin", 0);
		}else {
			
			
			//회원정보가 일치하면 회원정보 전체를 반환한다.
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("isLogin", 1);
		}
		return returnMap;
	}
}

















