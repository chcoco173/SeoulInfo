package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDAO;
import com.example.domain.MailVO;
import com.example.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	
	public List<MemberVO>getMemberList(MemberVO vo){
		return memberDAO.getMemberList(vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}	
	
	//회원가입 : DB입력
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}
	//회원정보 수정
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}
	//회원탈퇴
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}	
	
	
	//로그인 : DB확인	
	public MemberVO loginCheck(MemberVO vo) {
		return memberDAO.loginCheck(vo);
	}	    
	
	//아이디찾기 : DB확인
	public MemberVO idSearch(MemberVO vo) {
		return memberDAO.idSearch(vo);
	}
	//비밀번호찾기 : DB확인
	public MemberVO pwSearch(MemberVO vo) {
		return memberDAO.pwSearch(vo);
	}
	
	
	//아이디 중복체크
	public int idChk(MemberVO vo) {
		return memberDAO.idChk(vo);
	}
	//이메일 중복체크
	public int emailChk(MemberVO vo) {
		return memberDAO.emailChk(vo);
	}

	
	//이메일인증(확인코드 전송)
    public MemberVO findByEmail(String member_email) {
        return memberDAO.findMemberByEmail(member_email);
    }
    
    
    
    //임시 비밀번호 변경
    public Integer mailCheck(String member_email) {
        return memberDAO.checkEmail(member_email);
    }   
    public void changePass(String member_email, String newPassword) {
        memberDAO.updatePassword(member_email, newPassword);
    }    
        
	

}
