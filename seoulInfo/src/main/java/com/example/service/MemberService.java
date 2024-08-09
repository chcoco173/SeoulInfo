package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.EVStationVO;
import com.example.domain.MailVO;
import com.example.domain.MemberVO;
import com.example.domain.MypageProductVO;
import com.example.domain.QuestionVO;

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
    
    
    // 8/7 마이페이지/전기차 즐겨찾기
    public List<EVStationVO> getEvList(String member_id);
    boolean deleteEv(String evc_id, String member_id);
    
    
    // 8/7 마이페이지/관심상품
    public List<MypageProductVO> getProductList(String member_id);
    boolean deleteProduct(String sale_id, String member_id);

    
    // 8/8 마이페이지/1:1문의
	public void insertQuestion(QuestionVO vo);
	public List<QuestionVO> getQuestionList(String member_id);
	boolean deleteQuestion(String question_no, String member_id);
	public QuestionVO selectQuestion(QuestionVO qvo);
    
    
    
}
