const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const dbconfig = require('./config/database.js');

const conn = mysql.createConnection(dbconfig);
const app = express();
const PORT = 8000;

app.listen(PORT, () => {
    console.log("Express 서버 시작 포트는 >>> : ", PORT);
});

conn.connect(err => {
    if (err) console.log("연결실패: ", err);
    console.log('연결성공');
});

app.use(cors());
app.use(express.json());

// 이미지 업로드 설정
const storageAdmin = multer.diskStorage({
    destination: (req, file, cb) => {
        const dir = path.join(__dirname, 'public/images/admin');
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }
        cb(null, dir);
    },
    filename: (req, file, cb) => {
        cb(null, req.body.admin_id + path.extname(file.originalname)); // 파일 이름을 admin_id + 확장자로 설정
    }
});
const uploadAdmin = multer({ storage: storageAdmin });

const storageFestival = multer.diskStorage({
    destination: (req, file, cb) => {
        const dir = path.join(__dirname, 'public/images/festival');
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }
        cb(null, dir);
    },
    filename: (req, file, cb) => {
        const festivalId = req.body.festival_id || Date.now();
        cb(null, festivalId + path.extname(file.originalname)); // 파일 이름을 festival_id + 확장자로 설정
    }
});
const uploadFestival = multer({ storage: storageFestival });

// 날짜 변환 함수
const formatDate = (dateString) => {
    const date = new Date(dateString);
    const year = date.getFullYear();
    const month = (`0${date.getMonth() + 1}`).slice(-2);
    const day = (`0${date.getDate()}`).slice(-2);
    return `${year}-${month}-${day}`;
};

// 축제 데이터 불러오기
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

// 축제 데이터 입력하기
app.post('/data/insert-festival', uploadFestival.single('festival_image'), (req, res) => {
    console.log('파일 정보:', req.file); // 업로드된 파일 정보 로그 출력
    console.log('본문 데이터:', req.body); // 본문 데이터 로그 출력

    const { festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl } = req.body;
    const festival_imageurl = req.file ? `/images/festival/${req.file.filename}` : null;
    const formattedStartDate = formatDate(festival_startdate);
    const formattedEndDate = formatDate(festival_enddate);

    const param = [festival_name, festival_area, festival_address, festival_content, formattedStartDate, formattedEndDate, festival_siteurl, festival_imageurl];
    const sql = "INSERT INTO festival (festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl, festival_imageurl) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    conn.query(sql, param, function(err, result) {
        if (err) {
            console.error('Error: ', err);
            res.status(500).send('Error');
        } else {
            console.log('파일 저장 경로:', festival_imageurl); // 파일 저장 경로 확인
            res.status(201).send('success');
        }
    });
});

// 축제 데이터 수정
app.post('/data/update-festival', uploadFestival.single('festival_image'), (req, res) => {
    console.log('파일 정보:', req.file); // 업로드된 파일 정보 로그 출력
    console.log('본문 데이터:', req.body); // 본문 데이터 로그 출력

    const { festival_id, festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl } = req.body;
    const festival_imageurl = req.file ? `/images/festival/${req.file.filename}` : null;
    const formattedStartDate = formatDate(festival_startdate);
    const formattedEndDate = formatDate(festival_enddate);

    let sql = "UPDATE festival SET festival_name = ?, festival_area = ?, festival_address = ?, festival_content = ?, festival_startdate = ?, festival_enddate = ?, festival_siteurl = ?";
    let params = [festival_name, festival_area, festival_address, festival_content, formattedStartDate, formattedEndDate, festival_siteurl];

    if (festival_imageurl) {
        sql += ", festival_imageurl = ?";
        params.push(festival_imageurl);
    }
    
    sql += " WHERE festival_id = ?";
    params.push(festival_id);

    conn.query(sql, params, function(err, result) {
        if (err) {
            console.error('Error: ', err);
            res.status(500).send('Error');
        } else {
            console.log('파일 저장 경로:', festival_imageurl); // 파일 저장 경로 확인
            res.status(200).send('success');
        }
    });
});

// 축제 데이터 삭제
app.delete('/data/delete-festival/:festivalId', (req, res) => {
    const sql = "DELETE FROM festival WHERE festival_id = ? ";
    conn.query(sql, [req.params.festivalId], (err, result, fields) => {
        if (err) {
            res.status(500).send('Error');
        } else {
            res.status(200).send('success');
        }
    });
});

// 관리자 데이터 불러오기
app.get('/data/getalladmin', (req, res) => {
    const sql = "SELECT admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_image FROM admin";
    conn.query(sql, function(err, result, fields) {
        if (err) throw err;
        res.send(result);
    });
});

// 관리자 데이터 입력
app.post('/data/insert-admin', uploadAdmin.single('admin_image'), (req, res) => {
    const { admin_id, admin_pw, admin_name, admin_tel, admin_email } = req.body;
    const admin_image = req.file ? `/images/admin/${req.file.filename}` : null;

    const param = [admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_image];
    const sql = "INSERT INTO admin (admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_image) VALUES (?, ?, ?, ?, ?, ?)";
    
    conn.query(sql, param, function(err, result) {
        if (err) {
            console.error('Error: ', err);
            res.status(500).send('Error');
        } else {
            console.log('파일 저장 경로:', admin_image); // 파일 저장 경로 확인
            res.status(201).send('success');
        }
    });
});

// 관리자 데이터 삭제
app.delete('/data/delete-admin/:adminId', (req, res) => {
    const sql = "DELETE FROM admin WHERE admin_id = ? ";
    conn.query(sql, [req.params.adminId], (err, result, fields) => {
        if (err) {
            res.status(500).send('Error');
        } else {
            res.status(200).send('success');
        }
    });
});

// 관리자 데이터 수정
app.post('/data/update-admin', uploadAdmin.single('admin_image'), (req, res) => {
    const { admin_id, admin_name, admin_email, admin_tel } = req.body;
    const admin_image = req.file ? `/images/admin/${req.file.filename}` : null;

    let sql = "UPDATE admin SET admin_name = ?, admin_email = ?, admin_tel = ?";
    let params = [admin_name, admin_email, admin_tel];

    if (admin_image) {
        sql += ", admin_image = ?";
        params.push(admin_image);
    }
    
    sql += " WHERE admin_id = ?";
    params.push(admin_id);

    conn.query(sql, params, function(err, result) {
        if (err) {
            console.error('Error: ', err);
            res.status(500).send('Error');
        } else {
            console.log('파일 저장 경로:', admin_image); // 파일 저장 경로 확인
            res.status(200).send('success');
        }
    });
});

// 정적 파일 제공
app.use(express.static('public'));