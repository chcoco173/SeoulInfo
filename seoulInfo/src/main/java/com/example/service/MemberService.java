package com.example.service;

import java.util.List;

import com.example.domain.MailVO;
import com.example.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);	
	
	//회원가입 : DB입력
	public void insertMember(MemberVO vo);	
	//회원정보 수정
	public MemberVO updateMember(MemberVO vo);
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

	
	//이메일인증(확인코드 전송)
    public MemberVO findByEmail(String member_email);
    
    //임시비빌번호 변경
    Integer mailCheck(String member_email);
    void changePass(String member_email, String newPassword);
    
    //네이버 로그인
    public boolean isUserRegistered(String member_email);
    public MemberVO getMemberByEmail(String member_email);
//    public String getUserName(String member_email);
    
    
    //8/6 프로필 사진 등록
    public void updateProfile(MemberVO vo);
    public void deleteProfile(MemberVO vo);

}
