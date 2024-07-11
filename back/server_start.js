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
	  SELECT fId, fName, fStartDate, fEndDate, fAddress, fImageUrl, fSiteUrl, fContent, fArea
	  FROM festival
	  ORDER BY fId
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
// app.use(express.json())  // *********************

// app.post('/api/insert', (req, res) => {
// 	console.log(req.body)
// 	const btitle = req.body.btitle;
// 	const bname = req.body.bname; 
// 	const bcontent = req.body.bcontent; 
// 	const mid = req.body.mid; 
// 	const bpw = req.body.bpw; 
// 	const param = [btitle, bname, bcontent, mid, bpw];
// 	const sql =   " INSERT INTO node_board (BTITLE, BNAME, BCONTENT, MID, BPW, INSERTDATE, UPDATEDATE) " 
// 	            + " VALUES (?, ?, ?, ?, ?, now(), now()) ";
// 	conn.query(sql, param,function(err, result, fields){
// 		if (err) throw err;
// 		console.log(result);	
// 		res.send('success')	;
// 	});
// });


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




