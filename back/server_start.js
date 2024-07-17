const express = require('express'); 
const cors = require('cors'); // 다른 포트끼리 호환
const mysql = require('mysql'); // sql 연결
const multer = require('multer'); // 파일 업로드
const path = require('path'); // 경로 설정
const fs = require('fs'); // 날짜 설정
const dbconfig = require('./config/database.js'); 
const conn = mysql.createConnection(dbconfig); //데이터베이스 연결
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

// 로그인

app.post('/login', (req, res) => {
    const { adminId, adminPw } = req.body;
    const query = 'SELECT * FROM admin WHERE admin_id = ?';
  
    conn.query(query, [adminId], (err, results) => {
      if (err) throw err;
  
      if (results.length === 0) {
        return res.status(400).json({ message: '존재하지 않는 아이디입니다.' });
      }
  
      const admin = results[0];
  
      if (admin.admin_pw !== adminPw) {
        return res.status(400).json({ message: '비밀번호가 일치하지 않습니다.' });
      }
  
      res.json({ message: '로그인 성공', admin });
    });
  });
  
  

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
        cb(null, req.body.admin_id + path.extname(file.originalname))
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
        cb(null, `${Date.now()}${path.extname(file.originalname)}`);
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
      console.log(`Fetched ${result.length} items`); 
      res.send(result);
    });
});

// 축제 데이터 입력하기
app.post('/data/insert-festival', uploadFestival.single('festival_image'), (req, res) => {
    const { festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl } = req.body;
    const festival_imageurl = req.file ? `/images/festival/${req.file.filename}` : null;
    const formattedStartDate = formatDate(festival_startdate);
    const formattedEndDate = formatDate(festival_enddate);

    const param = [festival_name, festival_area, festival_address, festival_content, formattedStartDate, formattedEndDate, festival_siteurl, festival_imageurl];
    const sql = "INSERT INTO festival (festival_name, festival_area, festival_address, festival_content, festival_startdate, festival_enddate, festival_siteurl, festival_imageurl) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    conn.query(sql, param, function(err, result) {
        if (err) {
            res.status(500).send('Error');
        } else {
            res.status(201).send('success');
        }
    });
});

// 축제 데이터 수정
app.post('/data/update-festival', uploadFestival.single('festival_image'), (req, res) => {
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

// 축제 검색 기능
app.get('/data/search-festival', (req, res) => {
    const { category, keyword } = req.query;
  
    if (!category || !keyword) {
      return res.status(400).json({ error: '검색어를 입력하세요.' });
    }
  
    // 카테고리 설정
    let query = '';
    if (category === 'festival_name') {
      query = 'SELECT * FROM festival WHERE festival_name LIKE ?';
    } else if (category === 'festival_area') {
      query = 'SELECT * FROM festival WHERE festival_area LIKE ?';
    } else {
      return res.status(400).json({ error: '카테고리 오류.' });
    }
  
    conn.query(query, [`%${keyword}%`], (err, results) => {
      if (err) {
        console.error('검색 중 에러 발생:', err);
        return res.status(500).json({ error: '서버 에러' });
      }
      res.json(results);
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
            res.status(200).send('success');
        }
    });
});

app.get('/data/search-admin', (req, res) => {
    const { category, keyword } = req.query;
  
    if (!category || !keyword) {
      return res.status(400).json({ error: '검색어를 입력하세요.' });
    }
  
    // 카테고리 설정
    let query = '';
    if (category === 'name') {
      query = 'SELECT * FROM admin WHERE admin_name LIKE ?';
    } else if (category === 'id') {
      query = 'SELECT * FROM admin WHERE admin_id LIKE ?';
    } else if (category === 'email') {
      query = 'SELECT * FROM admin WHERE admin_email LIKE ?';
    } else if (category === 'tel') {
      query = 'SELECT * FROM admin WHERE admin_tel LIKE ?';
    } else {
      return res.status(400).json({ error: '카테고리 오류' });
    }
  
    conn.query(query, [`%${keyword}%`], (err, results) => {
      if (err) {
        console.error('검색 에러:', err);
        return res.status(500).json({ error: '서버 에러' });
      }
      res.json(results);
    });
  });

// 뉴스 데이터 불러오기 (페이징 포함)
app.get('/data/getallnews', (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  const sqlCount = 'SELECT COUNT(*) AS total FROM news';
  conn.query(sqlCount, (err, countResult) => {
    if (err) throw err;
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    const sql = `
      SELECT news_id, news_area, news_title, news_imageurl, news_link, news_content
      FROM news
      ORDER BY news_id
      LIMIT ${pageSize} OFFSET ${offset}
    `;
    
    conn.query(sql, function(err, result, fields) {
      if (err) throw err;
      res.send({
        news: result,
        totalPages
      });
    });
  });
});

// 뉴스 데이터 삭제
app.delete('/data/delete-news/:newsId', (req, res) => {
  const sql = "DELETE FROM news WHERE news_id = ? ";
  conn.query(sql, [req.params.newsId], (err, result, fields) => {
    if (err) {
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});

// 파일 경로
app.use(express.static('public'));