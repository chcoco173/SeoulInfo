package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.MemberDAO;
import com.example.domain.EVStationVO;
import com.example.domain.MailVO;
import com.example.domain.MemberVO;
import com.example.domain.MypageProductVO;
import com.example.domain.QuestionVO;

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

    
    //8/6 프로필 사진 등록
	@Transactional	
	public void updateProfile(MemberVO vo) {
		System.out.println("저장할 데이터: " + vo);
		
		// 데이터베이스에 멤버 정보 저장
        if (vo.getMember_imagePath() != null) {
            // 파일 첨부가 있는 경우
            memberDAO.updateProfile(vo);
        } else {
            // 파일 첨부가 없는 경우에도 기본 정보 업데이트
            memberDAO.updateProfile(vo);
        }
	}	
	
	public void deleteProfile(MemberVO vo) {
		memberDAO.deleteProfile(vo);
	} 
	
	
    // 8/7 마이페이지/전기차 즐겨찾기
    public List<EVStationVO> getEvList(String member_id){
    	return memberDAO.getEvList(member_id);
    }	
    public boolean deleteEv(String evc_id, String member_id) {
        int rowsAffected = memberDAO.deleteEv(evc_id, member_id);
        return rowsAffected > 0; // 삭제 성공 여부 반환
    }
    
    // 8/7 마이페이지/관심상품
    public List<MypageProductVO> getProductList(String member_id) {
        return memberDAO.getProductList(member_id);
    }
    public boolean deleteProduct(String sale_id, String member_id) {
        int rowsAffected = memberDAO.deleteProduct(sale_id, member_id);
        return rowsAffected > 0; // 삭제 성공 여부 반환
    }
    

    // 8/8 마이페이지/1:1문의
	public void insertQuestion(QuestionVO vo) {
		memberDAO.insertQuestion(vo);
	}
	public List<QuestionVO> getQuestionList(String member_id){
		return memberDAO.getQuestionList(member_id);
	}
	public boolean deleteQuestion(String question_no, String member_id){
		int rowsAffected = memberDAO.deleteQuestion(question_no, member_id);
        return rowsAffected > 0; // 삭제 성공 여부 반환
	}
	public QuestionVO selectQuestion(QuestionVO qvo) {
		return memberDAO.selectQuestion(qvo);
	}

	@Override
	public MemberVO findByEmail1(String email) {
		MemberVO user = memberDAO.findByEmail1(email);
		return user;

	}
	

}
