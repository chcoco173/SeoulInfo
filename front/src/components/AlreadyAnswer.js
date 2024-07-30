import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import '../css/Answer.css';
import { useAuth } from './AuthContext';

function AlreadyAnswer() {
  const { question_no } = useParams(); // URL 파라미터에서 질문 번호를 가져옴
  const [questionData, setQuestionData] = useState(null); // 질문 데이터를 저장할 상태
  const [answerContent, setAnswerContent] = useState(''); // 답변 내용을 저장할 상태
  const [adminId, setAdminId] = useState(''); // 답변 작성자의 아이디를 저장할 상태
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수
  const { instance, admin } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옴

  useEffect(() => {
    const questionView = async () => {
      try {
        const questionResponse = await instance.get(`/data/getquestion/${question_no}`);
        setQuestionData(questionResponse.data); // 질문 데이터를 상태에 저장

        const answerResponse = await instance.get(`/data/getanswer/${question_no}`);
        setAnswerContent(answerResponse.data.answer_content); // 답변 내용을 상태에 저장
        setAdminId(answerResponse.data.admin_id); // 답변 작성자의 아이디를 상태에 저장
      } catch (error) {
        console.error('Error fetching question or answer data:', error);
      }
    };

    if (question_no) {
      questionView(); // 질문 번호가 있을 때 질문과 답변 데이터를 가져옴
    }
  }, [question_no, instance]);

  const handleSubmit = async () => {
    try {
      await instance.post('/data/submit-answer', {
        question_no,
        answer_content: answerContent,
      });
      alert('답변 작성 완료');
      navigate('/menubar/question'); // 답변 작성 후 질문 목록 페이지로 이동
    } catch (error) {
      alert('답변 작성 실패');
    }
  };

  if (!questionData) {
    return <div>Loading...</div>; // 질문 데이터가 로딩 중일 때 표시
  }

  return (
    <div className="question">
      <h1>답변 작성</h1>
      <table className="question-table">
        <tbody>
          <tr>
            <td className='question_no'>질문번호</td>
            <td className='questions'>{questionData.question_no}</td>
          </tr>
          <tr>
            <td className='question_cate'>질문카테고리</td>
            <td className='questions'>{questionData.question_cate}</td>
          </tr>
          <tr>
            <td className='question_title'>질문제목</td>
            <td className='questions'>{questionData.question_title}</td>
          </tr>
          <tr>
            <td className='question_content'>질문내용</td>
            <td className='questions question-content'>{questionData.question_content}</td>
          </tr>
        </tbody>
      </table>
      <br /><br />
      <table className="answer-table">
        <tbody>
          <tr>
            <td className='answer_admin'>답변작성자</td>
            <td className='admin_id'>
              {adminId}
            </td>
          </tr>
          <tr>
            <td className='answer_content'>답변내용</td>
            <td className='questions'>
              <textarea
                className='answer-textarea'
                value={answerContent}
                onChange={(e) => setAnswerContent(e.target.value)}
                disabled // 답변 내용은 수정 불가능
              ></textarea>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

export default AlreadyAnswer;

/*
 * 1. useState를 통해 질문 데이터, 답변 내용, 답변 작성자의 아이디를 상태로 저장
 * 2. useEffect를 통해 컴포넌트가 마운트될 때 질문 번호를 기반으로 질문 및 답변 데이터를 서버에서 가져옴.
 * 3. questionView 함수는 서버에서 질문 및 답변 데이터를 가져와서 상태를 업데이트합니다.
 * 4. handleSubmit 함수는 답변 내용을 서버에 전송하고, 성공 시 질문 목록 페이지로 이동합니다.
 * 5. 질문 정보와 답변 내용을 테이블 형태로 렌더링합니다.
 * 6. 답변 내용은 수정할 수 없도록 textarea를 비활성화합니다.
 */