const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const dbconfig = require('./config/database.js');
const session = require('express-session');
const FileStore = require('session-file-store')(session);
const bcrypt = require('bcrypt');
const nodemailer = require('nodemailer');

const conn = mysql.createConnection(dbconfig);
const app = express();
const PORT = 8000;

app.listen(PORT);

conn.connect();

app.use(cors({
  origin: 'http://localhost:3000',
  credentials: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(session({
  secret: 'your_secret_key',
  resave: false,
  saveUninitialized: true,
  store: new FileStore({
    path: path.join(__dirname, 'sessions')
  }),
  cookie: {
    secure: false,
    httpOnly: true,
    maxAge: 1000 * 60 * 30 
  }
}));

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'lee.yeony.19@gmail.com',
    pass: 'mjir pdtd feqg nqbk',
  },
});



// 로그인 라우트 설정
app.post('/login', (req, res) => {
  const { adminId, adminPw } = req.body;
  const query = 'SELECT * FROM admin WHERE admin_id = ?';

  conn.query(query, [adminId], async (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('로그인 쿼리 에러:', err);
      return res.status(500).json({ message: '서버 에러' });
    }

    if (results.length === 0) { // 아이디가 데이터베이스에 존재하지 않는 경우 가정
      return res.status(400).json({ message: '존재하지 않는 아이디입니다.' });
    }

    const admin = results[0];

    const match = await bcrypt.compare(adminPw, admin.admin_pw);
    if (!match) { // 비밀번호가 일치하지 않는 경우 가정
      return res.status(400).json({ message: '비밀번호가 일치하지 않습니다.' });
    }

    req.session.adminId = admin.admin_id;
    req.session.save(err => {
      if (err) { // 세션 저장 중 에러 발생 가정
        console.error('세션 저장 에러:', err);
        return res.status(500).json({ message: '서버 에러' });
      }
      res.json({ message: '로그인 성공', admin });
    });
  });
});

// 인증 확인 라우트
app.get('/check-auth', (req, res) => {
  if (req.session.adminId) { // 세션에 adminId가 존재하는 경우 가정
    const query = 'SELECT * FROM admin WHERE admin_id = ?';
    conn.query(query, [req.session.adminId], (err, results) => {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        console.error('인증 확인 쿼리 에러:', err);
        return res.status(500).json({ message: '서버 에러' });
      }

      if (results.length === 0) { // 데이터베이스에 해당 adminId가 존재하지 않는 경우 가정
        return res.status(401).json({ message: '인증 실패' });
      }

      res.json({ admin: results[0] });
    });
  } else { // 세션에 adminId가 존재하지 않는 경우 가정
    res.status(401).json({ message: '로그인 필요' });
  }
});

// 세션 확인 미들웨어
function checkSession(req, res, next) {
  if (!req.session.adminId) { // 세션에 adminId가 없는 경우 가정
    return res.status(401).json({ message: '로그인이 필요합니다.' });
  }
  next();
}

// 로그아웃 라우트
app.post('/logout', (req, res) => {
  req.session.destroy(err => {
    if (err) { // 세션 삭제 중 에러 발생 가정
      return res.status(500).send('로그아웃 실패');
    }
    res.clearCookie('connect.sid'); // 세션 쿠키 삭제
    res.send('로그아웃 성공');
  });
});

// 이미지 업로드 설정
const createStorage = (folder) => {
  return multer.diskStorage({
    destination: (req, file, cb) => {
      const dir = path.join(__dirname, `public/images/${folder}`);
      if (!fs.existsSync(dir)) { // 디렉토리가 존재하지 않는 경우 가정
        fs.mkdirSync(dir, { recursive: true });
      }
      cb(null, dir);
    },
    filename: (req, file, cb) => {
      cb(null, `${Date.now()}${path.extname(file.originalname)}`);
    }
  });
};

const uploadAdmin = multer({ storage: createStorage('admin') });
const uploadFestival = multer({ storage: createStorage('festival') });

// 날짜 변환 함수
const formatDate = (dateString) => {
  const date = new Date(dateString);
  const year = date.getFullYear();
  const month = (`0${date.getMonth() + 1}`).slice(-2);
  const day = (`0${date.getDate()}`).slice(-2);
  return `${year}-${month}-${day}`;
};

// 축제 데이터 불러오기  
app.get('/data/getallfestival', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 15;
  const offset = pageNumber * pageSize;

  const sql = `
    SELECT *
    FROM festival
    ORDER BY festival_id
    LIMIT ${pageSize} OFFSET ${offset}
  `;

  conn.query(sql, function(err, result) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('축제 데이터 불러오기 에러:', err);
      return res.status(500).send('Error fetching festival data');
    }
    res.send(result);
  });
});
// 설명: 축제 데이터 불러오기는 페이징을 적용하여 지정된 페이지의 축제 데이터를 데이터베이스에서 조회하여 반환합니다.

// 축제 데이터 입력하기  
app.post('/data/insert-festival', checkSession, uploadFestival.single('festival_image'), (req, res) => {
  const { festival_name, festival_area, festival_loc, festival_startdate, festival_enddate, festival_siteurl, festival_fee, festival_type, festival_target, festival_host, festival_appdate, festival_lat, festival_long, festival_free } = req.body;
  const festival_imageurl = req.file ? `/images/festival/${req.file.filename}` : null;
  const formattedStartDate = formatDate(festival_startdate);
  const formattedEndDate = formatDate(festival_enddate);

  const param = [festival_name, festival_area, festival_loc, formattedStartDate, formattedEndDate, festival_siteurl, festival_imageurl, festival_fee, festival_type, festival_target, festival_host, festival_appdate, festival_lat, festival_long, festival_free];
  const sql = "INSERT INTO festival (festival_name, festival_area, festival_loc, festival_startdate, festival_enddate, festival_siteurl, festival_imageurl, festival_fee, festival_type, festival_target, festival_host, festival_appdate, festival_lat, festival_long, festival_free) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

  conn.query(sql, param, function (err) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error(err);
      res.status(500).send('Error');
    } else {
      res.status(201).send('success');
    }
  });
});
// 설명: 축제 데이터 입력하기는 클라이언트에서 받은 축제 데이터를 데이터베이스에 삽입합니다.

// 축제 데이터 수정  
app.post('/data/update-festival', checkSession, uploadFestival.single('festival_image'), (req, res) => {
  const { festival_id, festival_name, festival_area, festival_address, festival_startdate, festival_enddate, festival_siteurl, festival_fee, festival_type, festival_target, festival_host } = req.body;
  const festival_imageurl = req.file ? `/images/festival/${req.file.filename}` : null;
  const formattedStartDate = formatDate(festival_startdate);
  const formattedEndDate = formatDate(festival_enddate);

  let sql = "UPDATE festival SET festival_name = ?, festival_area = ?, festival_loc = ?, festival_startdate = ?, festival_enddate = ?, festival_siteurl = ?, festival_fee = ?, festival_type = ?, festival_target = ?, festival_host = ?";
  let params = [festival_name, festival_area, festival_address, formattedStartDate, formattedEndDate, festival_siteurl, festival_fee, festival_type, festival_target, festival_host];

  if (festival_imageurl) {
    sql += ", festival_imageurl = ?";
    params.push(festival_imageurl);
  }

  sql += " WHERE festival_id = ?";
  params.push(festival_id);

  conn.query(sql, params, function (err) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error: ', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 축제 데이터 수정는 클라이언트에서 받은 축제 데이터를 기반으로 기존 데이터를 수정합니다.

// 축제 데이터 삭제  
app.delete('/data/delete-festival/:festivalId', checkSession, (req, res) => {
  const sql = "DELETE FROM festival WHERE festival_id = ?";
  conn.query(sql, [req.params.festivalId], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 축제 데이터 삭제는 지정된 축제 데이터를 데이터베이스에서 삭제합니다.

// 축제 검색  
app.get('/data/search-festival', checkSession, (req, res) => {
  const { category, keyword } = req.query;

  let query = 'SELECT * FROM festival';
  const params = [];

  if (keyword) {
    query += ` WHERE ${category} LIKE ?`;
    params.push(`%${keyword}%`);
  }

  conn.query(query, params, (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('검색 중 에러 발생:', err);
      return res.status(500).json({ error: '서버 에러' });
    }
    res.json(results);
  });
});
// 설명: 축제 검색는 지정된 검색 조건에 따라 축제 데이터를 검색하여 반환합니다.

// 축제 게시물 리스트  
app.get('/data/getallfestivalboard', checkSession, (req, res) => {
  const { page = 0, area = 'all', type = 'all', festival = 'all' } = req.query;
  const pageSize = 10;
  const offset = page * pageSize;

  let query = `
    SELECT fr.fr_id, fr.fr_title, fr.fr_regdate, fr.festival_id, f.festival_name, fr.member_id
    FROM festival_review fr
    JOIN festival f ON fr.festival_id = f.festival_id
    WHERE 1=1
  `;
  let countQuery = `
    SELECT COUNT(*) AS total
    FROM festival_review fr
    JOIN festival f ON fr.festival_id = f.festival_id
    WHERE 1=1
  `;
  const params = [];

  if (area !== 'all') {
    query += ' AND f.festival_area = ?';
    countQuery += ' AND f.festival_area = ?';
    params.push(area);
  }

  if (type !== 'all') {
    query += ' AND f.festival_type = ?';
    countQuery += ' AND f.festival_type = ?';
    params.push(type);
  }

  if (festival !== 'all') {
    query += ' AND f.festival_name = ?';
    countQuery += ' AND f.festival_name = ?';
    params.push(festival);
  }

  query += ' LIMIT ? OFFSET ?';
  params.push(pageSize, offset);

  conn.query(query, params, (err, boardRows) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error fetching festival board data:', err);
      return res.status(500).send('Error fetching festival board data');
    }

    const formattedBoardRows = boardRows.map(row => ({
      ...row,
      fr_regdate: formatDate(row.fr_regdate)
    }));

    conn.query(countQuery, params.slice(0, -2), (err, countRows) => {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        console.error('Error fetching festival board data:', err);
        return res.status(500).send('Error fetching festival board data');
      }

      const totalPages = Math.ceil(countRows[0].total / pageSize);

      res.json({
        festivalboard: formattedBoardRows,
        totalPages
      });
    });
  });
});
// 설명: 축제 게시물 리스트는 페이징과 필터링을 적용하여 축제 게시물 데이터를 조회하여 반환합니다.

// 축제 게시물 검색  
app.get('/data/search-festivalboard', checkSession, (req, res) => {
  const { category, keyword, page = 0, area = 'all', type = 'all', festival = 'all' } = req.query;
  const pageSize = 10;
  const offset = page * pageSize;

  let query = `
    SELECT fr.fr_id, fr.fr_title, fr.fr_regdate, fr.festival_id, f.festival_name, fr.member_id
    FROM festival_review fr
    JOIN festival f ON fr.festival_id = f.festival_id
    WHERE 1=1
  `;
  let countQuery = `
    SELECT COUNT(*) AS total
    FROM festival_review fr
    JOIN festival f ON fr.festival_id = f.festival_id
    WHERE 1=1
  `;
  const params = [];

  if (area !== 'all') {
    query += ' AND f.festival_area = ?';
    countQuery += ' AND f.festival_area = ?';
    params.push(area);
  }

  if (type !== 'all') {
    query += ' AND f.festival_type = ?';
    countQuery += ' AND f.festival_type = ?';
    params.push(type);
  }

  if (festival !== 'all') {
    query += ' AND f.festival_name = ?';
    countQuery += ' AND f.festival_name = ?';
    params.push(festival);
  }

  if (category && keyword) {
    if (category === 'title') {
      query += ' AND fr.fr_title LIKE ?';
      countQuery += ' AND fr.fr_title LIKE ?';
      params.push(`%${keyword}%`);
    } else if (category === 'content') {
      query += ' AND fr.fr_content LIKE ?';
      countQuery += ' AND fr.fr_content LIKE ?';
      params.push(`%${keyword}%`);
    }
  }

  query += ' LIMIT ? OFFSET ?';
  params.push(pageSize, offset);

  conn.query(query, params, (err, boardRows) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error searching festival board data:', err);
      return res.status(500).send('Error searching festival board data');
    }

    const formattedBoardRows = boardRows.map(row => ({
      ...row,
      fr_regdate: formatDate(row.fr_regdate)
    }));

    conn.query(countQuery, params.slice(0, -2), (err, countRows) => {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        console.error('Error searching festival board data:', err);
        return res.status(500).send('Error searching festival board data');
      }

      const totalPages = Math.ceil(countRows[0].total / pageSize);

      res.json({
        festivalboard: formattedBoardRows,
        totalPages
      });
    });
  });
});
// 설명: 축제 게시물 검색는 지정된 검색 조건에 따라 축제 게시물을 검색하여 반환합니다.

// 지역 목록 불러오기  
app.get('/data/get-area-names', checkSession, (req, res) => {
  const query = `
    SELECT DISTINCT festival_area
    FROM festival
  `;
  conn.query(query, (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error retrieving area names:', err);
      return res.status(500).send('Error retrieving area names');
    }
    res.json(results.map(row => row.festival_area));
  });
});
// 설명: 지역 목록 불러오기는 축제 데이터베이스에서 지역 목록을 조회하여 반환합니다.

// 타입 목록 불러오기  
app.get('/data/get-type-names', checkSession, (req, res) => {
  const query = `
    SELECT DISTINCT festival_type
    FROM festival
  `;
  conn.query(query, (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error retrieving type names:', err);
      return res.status(500).send('Error retrieving type names');
    }
    res.json(results.map(row => row.festival_type));
  });
});
// 설명: 타입 목록 불러오기는 축제 데이터베이스에서 타입 목록을 조회하여 반환합니다.

// 축제 이름 목록 불러오기  
app.get('/data/get-festival-names', checkSession, (req, res) => {
  const { area, type } = req.query;
  let query = `
    SELECT festival_name
    FROM festival
    WHERE 1=1
  `;
  const params = [];

  if (area && area !== 'all') {
    query += ' AND festival_area = ?';
    params.push(area);
  }

  if (type && type !== 'all') {
    query += ' AND festival_type = ?';
    params.push(type);
  }

  conn.query(query, params, (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error retrieving festival names:', err);
      return res.status(500).send('Error retrieving festival names');
    }
    res.json(results.map(row => row.festival_name));
  });
});
// 설명: 축제 이름 목록 불러오기는 지정된 조건에 따라 축제 이름 목록을 조회하여 반환합니다.

// 축제 게시글 삭제  
app.delete('/data/delete-festivalboard/:fr_id', checkSession, (req, res) => {
  const sql = "DELETE FROM festival_review WHERE fr_id = ?";
  conn.query(sql, [req.params.fr_id], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error deleting festival board:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 축제 게시글 삭제는 지정된 축제 게시글을 데이터베이스에서 삭제합니다.

// 관리자 데이터 불러오기  
app.get('/data/getalladmin', checkSession, (req, res) => {
  const sql = "SELECT admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_image FROM admin";
  conn.query(sql, function(err, result) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      throw err;
    }
    res.send(result);
  });
});
// 설명: 관리자 데이터 불러오기는 모든 관리자 데이터를 조회하여 반환합니다.

// 관리자 데이터 입력  
app.post('/data/insert-admin', checkSession, uploadAdmin.single('admin_image'), async (req, res) => {
  const { admin_id, admin_pw, admin_name, admin_tel, admin_email } = req.body;
  const admin_image = req.file ? `/images/admin/${req.file.filename}` : null;

  try {
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(admin_pw, saltRounds);

    const param = [admin_id, hashedPassword, admin_name, admin_tel, admin_email, admin_image];
    const sql = "INSERT INTO admin (admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_image) VALUES (?, ?, ?, ?, ?, ?)";

    conn.query(sql, param, function(err) {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        console.error('Error: ', err);
        res.status(500).send('Error');
      } else {
        res.status(201).send('success');
      }
    });
  } catch (error) { // 비밀번호 해싱 중 에러 발생 가정
    console.error('Error during hashing or database operation: ', error);
    res.status(500).send('Internal Server Error');
  }
});
// 설명: 관리자 데이터 입력는 클라이언트에서 받은 관리자 데이터를 데이터베이스에 삽입합니다.

// 관리자 데이터 삭제  
app.delete('/data/delete-admin/:adminId', checkSession, (req, res) => {
  const sql = "DELETE FROM admin WHERE admin_id = ?";
  conn.query(sql, [req.params.adminId], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 관리자 데이터 삭제는 지정된 관리자 데이터를 데이터베이스에서 삭제합니다.

// 관리자 데이터 수정  
app.post('/data/update-admin', checkSession, uploadAdmin.single('admin_image'), (req, res) => {
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

  conn.query(sql, params, function(err) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error: ', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 관리자 데이터 수정는 클라이언트에서 받은 관리자 데이터를 기반으로 기존 데이터를 수정합니다.

// 관리자 데이터 검색  
app.get('/data/search-admin', checkSession, (req, res) => {
  const { category, keyword } = req.query;

  let query = 'SELECT * FROM admin';
  const params = [];

  if (keyword) {
    query += ` WHERE ${category} LIKE ?`;
    params.push(`%${keyword}%`);
  }

  conn.query(query, params, (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('검색 에러:', err);
      return res.status(500).json({ error: '서버 에러' });
    }
    res.json(results);
  });
});
// 설명: 관리자 데이터 검색는 지정된 검색 조건에 따라 관리자 데이터를 검색하여 반환합니다.

// 뉴스 데이터 불러오기 (페이징 포함)  
app.get('/data/getallnews', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  const sqlCount = 'SELECT COUNT(*) AS total FROM news';
  conn.query(sqlCount, (err, countResult) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      throw err;
    }
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    const sql = `
      SELECT news_id, news_area, news_title, news_imageurl, news_link, news_content, news_date
      FROM news
      ORDER BY news_id
      LIMIT ${pageSize} OFFSET ${offset}
    `;

    conn.query(sql, function(err, result) {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        throw err;
      }
      const formattedResult = result.map(news => ({
        ...news,
        news_date: formatDate(news.news_date)
      }));
      res.send({
        news: formattedResult,
        totalPages
      });
    });
  });
});
// 설명: 뉴스 데이터 불러오기는 페이징을 적용하여 뉴스 데이터를 조회하여 반환합니다.

// 뉴스 데이터 삭제  
app.delete('/data/delete-news/:newsId', checkSession, (req, res) => {
  const sql = "DELETE FROM news WHERE news_id = ?";
  conn.query(sql, [req.params.newsId], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 뉴스 데이터 삭제는 지정된 뉴스 데이터를 데이터베이스에서 삭제합니다.

// 뉴스 검색  
app.get('/data/search-news', checkSession, (req, res) => {
  const { category, keyword, page } = req.query;
  const pageNumber = parseInt(page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  let query = 'SELECT * FROM news';
  let countQuery = 'SELECT COUNT(*) AS total FROM news';
  const params = [pageSize, offset];

  if (keyword) {
    query += ` WHERE ${category} LIKE ? LIMIT ? OFFSET ?`;
    countQuery += ` WHERE ${category} LIKE ?`;
    params.unshift(`%${keyword}%`);
  }

  conn.query(countQuery, params.slice(0, -2), (err, countResult) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('카운트 에러:', err);
      return res.status(500).json({ error: '서버 에러' });
    }
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    conn.query(query, params, (err, results) => {
      if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
        console.error('검색 에러:', err);
        return res.status(500).json({ error: '서버 에러' });
      }
      const formattedResults = results.map(news => ({
        ...news,
        news_date: formatDate(news.news_date)
      }));
      res.json({ news: formattedResults, totalPages });
    });
  });
});
// 설명: 뉴스 검색는 지정된 검색 조건에 따라 뉴스 데이터를 검색하여 반환합니다.

app.get('/data/getallev', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;
  const { category, keyword } = req.query;

  let sqlCount = 'SELECT COUNT(*) AS total FROM evc';
  let sql = `
    SELECT evc_id, evc_area, evc_address, evc_name
    FROM evc
  `;
  const params = [];

  if (keyword) {
    sqlCount += ` WHERE ${category} LIKE ?`;
    sql += ` WHERE ${category} LIKE ?`;
    params.push(`%${keyword}%`);
  }

  sql += ' ORDER BY evc_id LIMIT ? OFFSET ?';
  params.push(pageSize, offset);

  conn.query(sqlCount, params.slice(0, 1), (err, countResult) => {
    if (err) {
      console.error('데이터베이스 쿼리 실행 중 에러 발생:', err);
      return res.status(500).json({ error: '서버 에러' });
    }
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    conn.query(sql, params, (err, result) => {
      if (err) {
        console.error('데이터베이스 쿼리 실행 중 에러 발생:', err);
        return res.status(500).json({ error: '서버 에러' });
      }
      res.send({
        ev: result,
        totalPages
      });
    });
  });
});

// 전기차 데이터 삭제  
app.delete('/data/delete-ev/:evc_id', checkSession, (req, res) => {
  const sql = "DELETE FROM evc WHERE evc_id = ?";
  conn.query(sql, [req.params.evc_id], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 전기차 데이터 삭제는 지정된 전기차 데이터를 데이터베이스에서 삭제합니다.

// 전기차 데이터 수정  
app.post('/data/update-ev', checkSession, (req, res) => {
  const { evc_id, evc_name, evc_area, evc_address } = req.body;
  const sql = 'UPDATE evc SET evc_name = ?, evc_area = ?, evc_address = ? WHERE evc_id = ?';
  const params = [evc_name, evc_area, evc_address, evc_id];

  conn.query(sql, params, (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error updating ev:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 전기차 데이터 수정는 클라이언트에서 받은 전기차 데이터를 기반으로 기존 데이터를 수정합니다.

// 전기차 데이터 추가  
app.post('/data/insert-ev', checkSession, (req, res) => {
  console.log('Request Body:', req.body); // req.body 출력
  const { evc_id, evc_area, evc_address, evc_name, evc_lat, evc_long } = req.body;

  const sql = "INSERT INTO evc (evc_id, evc_area, evc_address, evc_name, evc_lat, evc_long) VALUES (?, ?, ?, ?, ?, ?)";
  const params = [evc_id, evc_area, evc_address, evc_name, evc_lat, evc_long];

  conn.query(sql, params, function(err) {
    if (err) {
      console.error('Error: ', err);
      res.status(500).send('Error');
    } else {
      res.status(201).send('success');
    }
  });
});
// 설명: 전기차 데이터 추가는 클라이언트에서 받은 전기차 데이터를 데이터베이스에 삽입합니다.



// 충전기 데이터 불러오기  
app.get('/data/getallevc', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  const sqlCount = 'SELECT COUNT(*) AS total FROM evc_cg';
  conn.query(sqlCount, (err, countResult) => {
    if (err) {
      console.error('Error fetching total count:', err);
      res.status(500).send('Error');
      return;
    }
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    const sql = `
      SELECT 
        evc.evc_name,
        evc_cg.charger_id,
        evc_cg.charger_userlimit,
        evc_cg.charger_type,
        evc_cg.charger_facsmall
      FROM 
        evc_cg
      LEFT JOIN 
        evc
      ON 
        evc.evc_id = evc_cg.evc_id
      ORDER BY 
        evc.evc_id
      LIMIT 
        ${pageSize} OFFSET ${offset}
    `;

    conn.query(sql, (err, result) => {
      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).send('Error');
        return;
      }
      res.send({
        evc: result,
        totalPages
      });
    });
  });
});
// 설명: 충전기 데이터 불러오기는 페이징을 적용하여 충전기 데이터를 조회하여 반환합니다.

// 충전기 데이터 수정  
app.post('/data/update-evc', checkSession, (req, res) => {
  const { charger_id, charger_type, charger_userlimit, charger_facsmall } = req.body;
  const sql = 'UPDATE evc_cg SET charger_type = ?, charger_userlimit = ?, charger_facsmall = ? WHERE charger_id = ?';
  const params = [charger_type, charger_userlimit, charger_facsmall, charger_id];

  conn.query(sql, params, (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error updating evc:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 충전기 데이터 수정는 클라이언트에서 받은 충전기 데이터를 기반으로 기존 데이터를 수정합니다.

// 충전기 데이터 삭제  
app.delete('/data/delete-evc/:charger_id', checkSession, (req, res) => {
  const sql = "DELETE FROM evc_cg WHERE charger_id = ?";
  conn.query(sql, [req.params.charger_id], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 충전기 데이터 삭제는 지정된 충전기 데이터를 데이터베이스에서 삭제합니다.

// 충전기 데이터 추가  
app.post('/data/insert-evc', checkSession, (req, res) => {
  const { evc_id, charger_no, charger_type, charger_facsmall, charger_userlimit, charger_opbig, charger_opsmall, charger_mechine, charger_facbig } = req.body;

  const sql = "INSERT INTO evc_cg (evc_id, charger_no, charger_type, charger_facbig, charger_facsmall, charger_userlimit, charger_opbig, charger_opsmall, charger_mechine) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
  const params = [evc_id, charger_no, charger_type, charger_facbig, charger_facsmall, charger_userlimit, charger_opbig, charger_opsmall, charger_mechine];

  conn.query(sql, params, function(err) {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error: ', err);
      res.status(500).send('Error');
    } else {
      res.status(201).send('success');
    }
  });
});
// 설명: 충전기 데이터 추가는 클라이언트에서 받은 충전기 데이터를 데이터베이스에 삽입합니다.

// 회원 데이터 불러오기 및 검색
app.get('/data/getallmember', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;
  const { category, keyword } = req.query;

  let sqlCount = 'SELECT COUNT(*) AS total FROM member';
  let sql = `
    SELECT member_id, member_area, member_name, member_tel, member_status, member_email
    FROM member
  `;
  const params = [];

  if (category && keyword) {
    sqlCount += ` WHERE ${category} LIKE ?`;
    sql += ` WHERE ${category} LIKE ?`;
    params.push(`%${keyword}%`);
  }

  sql += ' ORDER BY member_id LIMIT ? OFFSET ?';
  params.push(pageSize, offset);

  conn.query(sqlCount, params.slice(0, 1), (err, countResult) => {
    if (err) {
      console.error('데이터베이스 쿼리 실행 중 에러 발생:', err);
      return res.status(500).json({ error: '서버 에러' });
    }
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    conn.query(sql, params, (err, result) => {
      if (err) {
        console.error('데이터베이스 쿼리 실행 중 에러 발생:', err);
        return res.status(500).json({ error: '서버 에러' });
      }
      res.send({
        member: result,
        totalPages
      });
    });
  });
});

// 설명: 회원 데이터 검색은 지정된 검색 조건에 따라 회원 데이터를 검색하여 반환합니다.

app.post('/data/update-member-status/:member_id', checkSession, (req, res) => {
  const { status } = req.body;
  const { member_id } = req.params;
  const sql = 'UPDATE member SET member_status = ? WHERE member_id = ?';

  conn.query(sql, [status, member_id], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error updating member status:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('success');
    }
  });
});
// 설명: 회원 상태 업데이트는 회원의 상태를 업데이트합니다.

app.get('/data/reports', checkSession, (req, res) => {
  const { page = 1, search = '', filter = 'member_id' } = req.query;
  const limit = 10;
  const offset = (page - 1) * limit;

  let searchSql = `
    SELECT m.member_id, IFNULL(r.report_count, 0) AS report_count
    FROM member m
    LEFT JOIN (
        SELECT member_id, COUNT(*) AS report_count
        FROM report
        GROUP BY member_id
    ) r ON m.member_id = r.member_id
  `;
  
  let countSql = `
    SELECT COUNT(*) as total
    FROM member m
    LEFT JOIN (
        SELECT member_id, COUNT(*) AS report_count
        FROM report
        GROUP BY member_id
    ) r ON m.member_id = r.member_id
  `;

  const searchQuery = `%${search}%`;
  const reportCountSearch = !isNaN(search) ? parseInt(search, 10) : null;

  if (search) {
    if (filter === 'member_id') {
      searchSql += ` WHERE m.member_id LIKE ? `;
      countSql += ` WHERE m.member_id LIKE ? `;
    } else if (filter === 'report_count' && reportCountSearch !== null) {
      searchSql += ` WHERE IFNULL(r.report_count, 0) = ? `;
      countSql += ` WHERE IFNULL(r.report_count, 0) = ? `;
    }
  }

  searchSql += ' ORDER BY report_count DESC, m.member_id LIMIT ? OFFSET ?';

  const params = search ? (filter === 'member_id' ? [searchQuery, limit, offset] : [reportCountSearch, limit, offset]) : [limit, offset];

  conn.query(countSql, search ? (filter === 'member_id' ? [searchQuery] : [reportCountSearch]) : [], (err, countResult) => {
    if (err) {
      console.error('Error counting reports:', err);
      res.status(500).send('Error');
      return;
    }

    const total = countResult[0].total;

    conn.query(searchSql, params, (err, results) => {
      if (err) {
        console.error('Error fetching reports:', err);
        res.status(500).send('Error');
      } else {
        res.json({ results, total });
      }
    });
  });
});

// 신고 사유 리스트  
app.get('/data/reports/:member_id', checkSession, (req, res) => {
  const memberId = req.params.member_id;
  const sql = 'SELECT report_id, report_cate, report_reason, member_id, is_processed FROM report WHERE member_id = ?';

  conn.query(sql, [memberId], (err, results) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error fetching report details: ', err);
      res.status(500).send('Error fetching report details');
      return;
    }
    if (results.length > 0) { // 지정된 회원에 대한 신고가 존재하는 경우 가정
      res.json(results);
    } else { // 지정된 회원에 대한 신고가 존재하지 않는 경우 가정
      res.status(404).send('No reports found for this member');
    }
  });
});
// 설명: 신고 사유 리스트는 지정된 회원에 대한 신고 사유 데이터를 조회하여 반환합니다.

// 신고 횟수 증가 및 처리 완료 상태 업데이트  
app.post('/data/increase-report-count/:memberId', (req, res) => {
  const { memberId } = req.params;
  const { reportId, reportCate, reportReason } = req.body;

  const updateReportCountSql = `
    UPDATE member 
    SET member_reportcount = member_reportcount + 1 
    WHERE member_id = ?;
  `;

  const markReportsProcessedSql = `
    UPDATE report 
    SET is_processed = TRUE 
    WHERE report_id = ?;
  `;

  const getEmailAndReportCountSql = `
    SELECT member_email, member_reportcount 
    FROM member 
    WHERE member_id = ?;
  `;

  conn.beginTransaction((err) => {
    if (err) {
      return res.status(500).send('Transaction start failed');
    }

    conn.query(updateReportCountSql, [memberId], (err) => {
      if (err) {
        return conn.rollback(() => {
          res.status(500).send('신고 횟수 업데이트 실패');
        });
      }

      conn.query(markReportsProcessedSql, [reportId], (err) => {
        if (err) {
          return conn.rollback(() => {
            res.status(500).send('신고 처리 완료 상태 업데이트 실패');
          });
        }

        conn.commit((err) => {
          if (err) {
            return conn.rollback(() => {
              res.status(500).send('Transaction commit failed');
            });
          }

          // member_email과 member_reportcount 조회
          conn.query(getEmailAndReportCountSql, [memberId], (err, results) => {
            if (err) {
              return res.status(500).send('회원 이메일 및 신고 횟수 조회 실패');
            }

            const memberEmail = results[0].member_email;
            const reportCount = results[0].member_reportcount;

            const mailOptions = {
              from: '"서울 지역 안내 서비스" <your-email@gmail.com>',
              to: memberEmail,
              subject: '서울 지역 안내 서비스 신고 승인 알림',
              html: `
                <div style="font-family: Arial, sans-serif; line-height: 1.6; max-width: 600px; margin: auto; border: 1px solid #ddd; padding: 20px; border-radius: 10px;">
                  <h2 style="color: #4CAF50; text-align: center;">신고 승인 알림</h2>
                  <p>안녕하세요, 서울 지역 안내 서비스입니다.</p>
                  <p>귀하에 대한 신고가 승인되었습니다. 다음은 신고에 대한 상세 내용입니다:</p>
                  <ul style="background-color: #f9f9f9; padding: 15px; border-radius: 5px;">
                    <li><strong>신고 카테고리:</strong> ${reportCate}</li>
                    <li><strong>신고 사유:</strong> ${reportReason}</li>
                    <li><strong>신고 승인 횟수:</strong> ${reportCount}</li>
                  </ul>
                  <p>신고 승인 횟수가 3회가 될 시 사이트 이용이 제한됩니다.</p>
                  <p>감사합니다.</p>
                  <br/>
                  <p style="font-size: 12px; color: #888;">발신 전용 이메일입니다.</p>
                </div>
              `,
            };

            transporter.sendMail(mailOptions, (error, info) => {
              if (error) {
                return res.status(500).send('메일 전송 오류');
              }
              res.send({ message: '신고 승인 처리 완료' });
            });
          });
        });
      });
    });
  });
});
// 설명: 신고 횟수 증가 및 처리 완료 상태 업데이트는 지정된 회원의 신고 횟수를 증가시키고, 해당 신고를 처리 완료 상태로 업데이트합니다.

// 신고 내용 삭제  
app.delete('/data/delete-report/:reportId', checkSession, (req, res) => {
  const { reportId } = req.params;

  const sql = "DELETE FROM report WHERE report_id = ?";

  conn.query(sql, [reportId], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('신고 내용 삭제 중 오류 발생:', err);
      res.status(500).send('신고 내용 삭제 실패');
    } else {
      res.send({ message: '신고 내용이 성공적으로 삭제되었습니다' });
    }
  });
});
// 설명: 신고 내용 삭제는 지정된 신고 내용을 데이터베이스에서 삭제합니다.

// 회원 삭제  
app.delete('/data/delete-member/:memberId', checkSession, (req, res) => {
  const memberId = req.params.memberId;
  const sql = "DELETE FROM member WHERE member_id = ?";

  conn.query(sql, [memberId], (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error deleting member:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('Member deleted successfully');
    }
  });
});
// 설명: 회원 삭제는 지정된 회원 데이터를 데이터베이스에서 삭제합니다.

// 회원 수정  
app.post('/data/update-member', checkSession, (req, res) => {
  const { member_id, member_name, member_email, member_tel, member_area } = req.body;

  const sql = "UPDATE member SET member_name = ?, member_email = ?, member_tel = ?, member_area = ? WHERE member_id = ?";
  const params = [member_name, member_email, member_tel, member_area, member_id];

  conn.query(sql, params, (err) => {
    if (err) { // 데이터베이스 쿼리 실행 중 에러 발생 가정
      console.error('Error updating member:', err);
      res.status(500).send('Error');
    } else {
      res.status(200).send('Member updated successfully');
    }
  });
});
// 설명: 회원 수정는 클라이언트에서 받은 회원 데이터를 기반으로 기존 데이터를 수정합니다.

// 문의 테이블 리스트  
app.get('/data/getallquestion', checkSession, (req, res) => {
  const pageNumber = parseInt(req.query.page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  const sqlCount = 'SELECT COUNT(*) AS total FROM question';
  conn.query(sqlCount, (err, countResult) => {
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    const sql = `
      SELECT question_no, question_cate, question_title, question_status, question_date, member_id
      FROM question
      ORDER BY question_no DESC
      LIMIT ${pageSize} OFFSET ${offset}
    `;

    conn.query(sql, function(err, result) {
      const formattedResult = result.map(question => ({
        ...question,
        question_date: formatDate(question.question_date)
      }));
      res.send({
        questions: formattedResult,
        totalPages
      });
    });
  });
});

// 문의 검색  
app.get('/data/search-question', checkSession, (req, res) => {
  const { category, keyword, page } = req.query;
  const pageNumber = parseInt(page) || 0;
  const pageSize = 10;
  const offset = pageNumber * pageSize;

  let query = 'SELECT * FROM question';
  let countQuery = 'SELECT COUNT(*) AS total FROM question';
  const params = [pageSize, offset];

  if (keyword) {
    query += ` WHERE ${category} LIKE ? LIMIT ? OFFSET ?`;
    countQuery += ` WHERE ${category} LIKE ?`;
    params.unshift(`%${keyword}%`);
  }

  conn.query(countQuery, params.slice(0, -2), (err, countResult) => {
    const totalItems = countResult[0].total;
    const totalPages = Math.ceil(totalItems / pageSize);

    conn.query(query, params, (err, results) => {
      const formattedResults = results.map(question => ({
        ...question,
        question_date: formatDate(question.question_date)
      }));
      res.json({ questions: formattedResults, totalPages });
    });
  });
});

// 질문 내용 답변 페이지에서 띄우기  
app.get('/data/getquestion/:question_no', checkSession, (req, res) => {
  const questionNo = req.params.question_no;
  const sql = 'SELECT * FROM question WHERE question_no = ?';

  conn.query(sql, [questionNo], (err, results) => {
    res.json(results[0]);
  });
});

// 답변 내용 가져오기  
app.get('/data/getanswer/:question_no', checkSession, (req, res) => {
  const questionNo = req.params.question_no;
  const sql = 'SELECT answer_content, admin_id FROM answer WHERE question_no = ?';

  conn.query(sql, [questionNo], (err, results) => {
    res.json(results[0]);
  });
});

// 답변 작성  
app.post('/data/submit-answer', checkSession, (req, res) => {
  const { question_no, answer_content, admin_id } = req.body;

  const insertAnswer = 'INSERT INTO answer (question_no, answer_content, admin_id) VALUES (?, ?, ?)';
  conn.query(insertAnswer, [question_no, answer_content, admin_id], (err) => {

    const updateQuestionStatus = 'UPDATE question SET question_status = "처리완료" WHERE question_no = ?';
    conn.query(updateQuestionStatus, [question_no], (err) => {
      res.send('답변 작성 처리 완료');
    });
  });
});


// 파일 경로 설정
app.use(express.static('public'));