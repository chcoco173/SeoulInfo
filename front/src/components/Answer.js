import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import '../css/Answer.css';
import { useAuth } from './AuthContext';

function Answer() {
  const { question_no } = useParams();
  const [questionData, setQuestionData] = useState(null);
  const [answerContent, setAnswerContent] = useState('');
  const navigate = useNavigate();  
  const { instance } = useAuth(); // AuthContext에서 instance 가져오기

  useEffect(() => {
    console.log("question_no:", question_no); // 콘솔에 question_no 출력
    const fetchQuestionData = async () => {
      try {
        const response = await instance.get(`/data/getquestion/${question_no}`);
        setQuestionData(response.data);
      } catch (error) {
        console.error('Error fetching question data:', error);
      }
    };
  
    if (question_no) {
      fetchQuestionData();
    }
  }, [question_no, instance]);

  if (!questionData) {
    return <div>Loading...</div>;
  }

  const handleSubmit = async () => {
    try {
      const response = await instance.post('/data/submit-answer', {
        question_no,
        answer_content: answerContent,
      });
      alert('답변 작성 완료');
      navigate('/dashboard/question');
    } catch (error) {
      console.error('Error submitting answer:', error);
      alert('답변 작성 실패');
    }
  };

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
      <br/><br/>
      <table className="answer-table">
        <tbody>
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
