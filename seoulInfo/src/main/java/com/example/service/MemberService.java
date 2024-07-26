package com.example.service;

import java.util.List;

import com.example.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);	
	
	//회원가입 : DB입력
	public void insertMember(MemberVO vo);	
	//회원정보 수정
	public void updateMember(MemberVO vo);
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

}
