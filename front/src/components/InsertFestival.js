import '../css/InsertFestival.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';

function InsertFestival() {
    const [festivalName, setFestivalName] = useState('');
    const [festivalStartDate, setFestivalStartDate] = useState('');
    const [festivalEndDate, setFestivalEndDate] = useState('');
    const [festivalAddress, setFestivalAddress] = useState('');
    const [festivalArea, setFestivalArea] = useState('');
    const [festivalImage, setFestivalImage] = useState(null);
    const [festivalSiteUrl, setFestivalSiteUrl] = useState('');
    const [festivalContent, setFestivalContent] = useState('');
    const navigate = useNavigate();  
  
    const handleInsertfestival = () => {

      navigate('/dashboard/festival-info/');
    };

    const handleImageChange = (e) => {
        setFestivalImage(e.target.files[0]);
    };
  
    return (
        <div className="insert-festival-container">
            <div className="insert-festival-form">
                <h3>축제 등록</h3>
                <input
                    type="text"
                    placeholder="축제 이름"
                    value={festivalName}
                    onChange={(e) => setFestivalName(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="축제 지역"
                    value={festivalArea}
                    onChange={(e) => setFestivalArea(e.target.value)}
                />
 <input
                    type="text"
                    placeholder="축제 주소"
                    value={festivalAddress}
                    onChange={(e) => setFestivalAddress(e.target.value)}
                />
                <span>
                축제 시작일 : <input
                    type="date"
                    placeholder="축제 시작일"
                    value={festivalStartDate}
                    onChange={(e) => setFestivalStartDate(e.target.value)}
                /></span>
                <span>
                    축제 종료일 : <input
                    type="date"
                    placeholder="축제 종료일"
                    value={festivalEndDate}
                    onChange={(e) => setFestivalEndDate(e.target.value)}
                /></span>

                 <textarea
                    placeholder="축제 내용"
                    value={festivalContent}
                    onChange={(e) => setFestivalContent(e.target.value)}
                    rows="10"
                />
                <br/>
                <input
                    type="text"
                    placeholder="축제 사이트 url"
                    value={festivalSiteUrl}
                    onChange={(e) => setFestivalSiteUrl(e.target.value)}
                />
               <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageChange}
                />
         
                <button onClick={handleInsertfestival}>축제등록</button>
            </div>
        </div>
    );
}

export default InsertFestival;