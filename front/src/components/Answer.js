import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import '../css/Answer.css';
import { useAuth } from './AuthContext';

function Answer() {
  const { question_no } = useParams();
  const [questionData, setQuestionData] = useState(null);
  const [answerContent, setAnswerContent] = useState('');
  const navigate = useNavigate();
  const { instance, admin } = useAuth();

  useEffect(() => {
    const questionView = async () => {
      try {
        const response = await instance.get(`/data/getquestion/${question_no}`);
        setQuestionData(response.data);
      } catch (error) {
      }
    };

    if (question_no) {
      questionView();
    }
  }, [question_no, instance]);

  const handleSubmit = async () => {
    try {
      await instance.post('/data/submit-answer', {
        question_no,
        answer_content: answerContent,
        admin_id: admin?.admin_id
      });
      alert('답변 작성 완료');
      navigate('/menubar/question');
    } catch (error) {
      console.error('Error submitting answer:', error);
      alert('답변 작성 실패');
    }
  };

  if (!questionData) {
    return <div>Loading...</div>; // 데이터 로딩 중에는 로딩 메시지를 표시합니다.
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
            {admin?.admin_id}
            </td>
          </tr>
          <tr>
            <td className='answer_content'>답변내용</td>
            <td className='questions'>
              <textarea
                className='answer-textarea'
                value={answerContent}
                onChange={(e) => setAnswerContent(e.target.value)}
              ></textarea>
            </td>
          </tr>
          <tr>
            <td colSpan="2" className="button-cell">
              <button onClick={handleSubmit}>답변작성</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

export default Answer;