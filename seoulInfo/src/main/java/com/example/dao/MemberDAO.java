package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;


import com.example.domain.EVStationVO;
import com.example.domain.MemberVO;
import com.example.domain.MypageProductVO;
import com.example.domain.QuestionVO;

@Mapper
public interface MemberDAO {

	public List<MemberVO> getMemberList(MemberVO vo);

	public MemberVO getMember(MemberVO vo);

	//회원가입 : DB입력
	public void insertMember(MemberVO vo);	
	//회원정보 수정
	public void updateMember(MemberVO vo);
	// 회원 정보 조회
	public MemberVO getMemberById(String member_id);


	//회원탈퇴
	public void deleteMember(MemberVO vo);

	//로그인 : DB확인	
	public MemberVO loginCheck(MemberVO vo);
	//아이디찾기 : DB확인
	public MemberVO idSearch(MemberVO vo);
	//비밀번호찾기 : DB확인
	public MemberVO pwSearch(MemberVO vo);

	//아이디 중복체크
	public int idChk(MemberVO vo);
	//이메일 중복체크
	public int emailChk(MemberVO vo);


	//이메일인증
	public MemberVO findByEmail(String member_email);
	public MemberVO findMemberByEmail(String member_email);


	//임시비밀번호 전송
	Integer checkEmail(String member_email);
	void updatePassword(@Param("member_email") String member_email, @Param("newPassword") String newPassword);	


	//8/1(목) 네이버 로그인
	// 이메일로 사용자 등록 여부 확인
	boolean checkUserByEmail(@Param("member_email") String member_email);

	// 이메일로 사용자 이름 가져오기
	String getUserNameByEmail(@Param("member_email") String member_email); 

	// 이메일로 전체 사용자 정보 가져오기
	public MemberVO getMemberByEmail(@Param("member_email") String member_email);


	//8/6 프로필 사진 등록
	public void updateProfile(MemberVO vo);
	public void deleteProfile(MemberVO vo);


	// 8/7 마이페이지/전기차 즐겨찾기
	public List<EVStationVO> getEvList(String member_id);
	int deleteEv(@Param("evc_id") String evc_id, @Param("member_id") String member_id);


	// 8/7 마이페이지/관심상품
	public List<MypageProductVO> getProductList(String member_id);
	int deleteProduct(@Param("sale_id") String sale_id, @Param("member_id") String member_id);


	// 8/8 마이페이지/1:1문의 등록
	public void insertQuestion(QuestionVO vo);
	public List<QuestionVO> getQuestionList(String member_id);
	int deleteQuestion(@Param("question_no") String question_no, @Param("member_id") String member_id);
	public QuestionVO selectQuestion(QuestionVO qvo);


	//네이버로그인 이메일찾기
	public MemberVO findByEmail1(String email);





}
