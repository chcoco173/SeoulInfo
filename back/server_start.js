const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const dbconfig = require('./config/database.js');
const conn = mysql.createConnection(dbconfig);
const app = express();

const PORT = 8000
app.listen(PORT, () => {
	console.log("Express 서버 시작 포트는 >>> : ", PORT)
});

// [1] 실행확인
//		node  server_start.js
// =========================================================


// [2] 디비연결확인
conn.connect( err => {
	if(err) console.log("연결실패: ", err)
	console.log('연결성공')
})

// =========================================================
// 다른 주소와 데이타를 주고 받기 위해
app.use(cors()) // *********************


// [3] 전체 조회
app.get('/data/getallfestival', (req, res) => {
	const pageNumber = parseInt(req.query.page) || 0;
	const pageSize = 15;
	const offset = pageNumber * pageSize;
  
	const sql = `
	  SELECT festival_id, festival_name, festival_startdate, festival_enddate, festival_address, festival_imageurl, festival_siteurl, festival_content, festival_area
	  FROM festival
	  ORDER BY festival_id
	  LIMIT ${pageSize} OFFSET ${offset}
	`;
  
	conn.query(sql, function(err, result, fields) {
	  if (err) throw err;
	  console.log(`Fetched ${result.length} items`);  // 반환된 데이터 수 로깅
	  res.send(result);
	});
  });

// =========================================================
// [4] 입력 화면 

// json 객체로 주고받기 위해?
// app.use(cors()) - 위에 코드함
app.use(express.json())  // *********************

app.post('/data/insert-festival', (req, res) => {
    console.log('Request body:', req.body);  // 요청 바디 확인을 위한 로그
    const { festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl } = req.body;
    const param = [festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl];
    const sql = "INSERT INTO festival (festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    conn.query(sql, param, function(err, result) {
        if (err) {
            console.error(err);
            res.send('fail');
        } else {
            res.send('success'); // 상태 코드 201과 성공 메시지 전송
        }
    });
});


// ==================================================
// [5] 삭제
// app.delete('/api/delete/:bnum', (req, res) => {
// 	const sql = "DELETE FROM  node_board WHERE bnum = ? ";
// 	conn.query(sql, [req.params.bnum], (err, result, fields) => {
// 		if (err) throw err;
// 		console.log('delete:' + req.params.bnum)
// 		console.log(result);
// 		res.send('success')
// 	});
// });


// 조회
// app.get('/edit/:bnum', (req, res) => {
// 	const sql =   " SELECT 	BNUM, BTITLE, BNAME, "
// 				+ " 		BCONTENT, MID, BPW, "
// 				+ " 		DATE_FORMAT(INSERTDATE,'%Y-%m-%d') INSERTDATE,"
// 				+ " 		DATE_FORMAT(UPDATEDATE,'%Y-%m-%d') UPDATEDATE " 
// 				+ " FROM 	node_board "
// 				+ " WHERE 	BNUM = ? " ;	
// 	const bnum = req.params.bnum;	
// 	console.log("bnum >>> : " + bnum);						
// 	conn.query(sql, [bnum], (err, result, fields) => {
// 		if (err) throw err;
// 		console.log("조회 >>> : ", result);
// 		res.render('board_edit', {users: result});
// 	});
// });

// 수정
// app.post('/update/:bnum', (req, res) => {	
// 	const bnum = req.body.bnum;
// 	const btitle = req.body.btitle; 
// 	const bname = req.body.bname; 
// 	const bcontent = req.body.bcontent; 
// 	const sql =     " UPDATE node_board SET btitle = ?, bname = ?, bcontent = ?, UPDATEDATE=now() WHERE bnum = ? " ;
// 	conn.query(sql, [btitle, bname, bcontent, bnum], (err, result, fields) => {
// 		if (err) throw err;
// 		console.log(result);
// 		res.redirect('/');
// 	});
// });




