package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.example.domain.MemberVO;

@Mapper
public interface MemberDAO {
	
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
	

	//이메일인증
	public MemberVO findByEmail(String member_email);
	public MemberVO findMemberByEmail(String member_email);
	
	
	//임시비밀번호 전송
	Integer checkEmail(String member_email);
    void updatePassword(@Param("member_email") String member_email, @Param("newPassword") String newPassword);	
	
}
