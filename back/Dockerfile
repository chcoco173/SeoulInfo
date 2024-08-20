# Node.js의 특정 버전을 사용하여 기본 이미지로 설정
FROM node:16

# 컨테이너 내에서 작업 디렉토리 설정
WORKDIR /app

# package.json과 package-lock.json 파일을 컨테이너의 작업 디렉토리로 복사
COPY package*.json ./

# 프로젝트의 의존성 설치
RUN npm install

# 모든 소스 코드를 컨테이너의 작업 디렉토리로 복사
COPY . .

# 백엔드 서버가 사용하는 포트를 노출 (예: 5000번 포트)
EXPOSE 8000

# 애플리케이션 실행 명령어
CMD ["node", "server_start.js"]