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
	public MemberVO updateMember(MemberVO vo) {
		
	    // 회원 정보 업데이트
	    memberDAO.updateMember(vo);

	    // 업데이트된 회원 정보 반환 (업데이트 후 조회)
	    return memberDAO.getMemberById(vo.getMember_id());		
		
	}
    // 회원 정보 조회
    public MemberVO getMemberById(String member_id) {
        // SQL 조회 쿼리 실행
        return memberDAO.getMemberById(member_id); // 조회된 MemberVO 객체 반환
    }	
		
//	public MemberVO getMemberById(String member_id) {
//		return memberDAO.findByMemberId(member_id);
//	}
	
	
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
    
    
    //네이버 로그인
    public boolean isUserRegistered(String member_email) {
        return memberDAO.checkUserByEmail(member_email);
    }    
    public MemberVO getMemberByEmail(String member_email) {
        return memberDAO.getMemberByEmail(member_email);
    }    
//    public String getUserName(String member_email) {
//        return memberDAO.getUserNameByEmail(member_email);
//    }    
    
	

}
