# SeoulInfo ( Seoul Area Info )
## 프로젝트 설명
서울 지역 안내 서비스는
서울 지역을 중심으로 다양한 서비스를 제공하는 웹사이트를 제작했습니다.

이 사이트를 통해 최근의 축제와 문화 행사, 
그리고 최신 뉴스를 손쉽게 접할 수 있으며, 
이전에 해당 축제에 참여했던 사람들의 후기를 참고해 
서울에서 더욱 폭넓은 활동을 즐길 수 있도록 하였습니다.

뿐만 아니라, 사용자의 편의를 위해 근처 주차장과 편의 시설 정보를 제공하고,
위치 기반으로 전기차 충전소의 위치와 실시간 충전 상태, 길찾기 서비스를 제공합니다. 
전기차 충전 시간이 오래 걸리는 점을 고려해, 편의시설, 지역안내, 뉴스를 통해
대기 시간을 효율적으로 활용할 수 있도록 했습니다.

또한, 지역 경제 활성화를 위해 사용자 맞춤형 상품을 추천하는 중고거래 플랫폼도 구축했습니다.
구매자와 판매자가 실시간으로 소통할 수 있는 채팅 시스템도 함께 지원합니다.

## 화면 ( 사용자 )
- 메인페이지
![image](https://github.com/user-attachments/assets/db51a620-345b-4e87-a08a-936cda956a08)
- 지역안내 페이지
![image](https://github.com/user-attachments/assets/169b035d-133e-4b77-9724-54a551ff44ef)
- 전기차 충전소 페이지
![image](https://github.com/user-attachments/assets/eea13b32-0a81-4102-9ea6-919608c1524a)
- 중고거래 페이지
![image](https://github.com/user-attachments/assets/5a6c1cbb-d83f-4b73-8905-c0754f35d6a2)

## 화면 ( 관리자 )
- 행사관리 페이지 ( 무한 스크롤 기능 )
![image](https://github.com/user-attachments/assets/d3f042e5-ea9c-4ff4-b896-d4446edd7b55)
- 신고관리 페이지 ( 신고 승인시, 해당 사용자에게 이메일 전송)
![image](https://github.com/user-attachments/assets/8128137b-c659-4f7d-80ab-b08d72088e4b)
- ELK + Kibana ( 전체 데이터 )
![image](https://github.com/user-attachments/assets/3e5687e5-31c1-4c73-adee-8fcdedbbe570)
- ELK + Kibana ( 구별 필터링한 데이터 )
![image](https://github.com/user-attachments/assets/a5d6758d-7b9c-46ac-867c-01bdc7d3b658)
- ELK + Kibana ( 지도 구별 전체 데이터 )
![image](https://github.com/user-attachments/assets/dfae91d2-c8bc-4cde-bf8b-e336f8773fd8)


## 주요기능
- 크롤링
![image](https://github.com/user-attachments/assets/e9fc25c7-a752-4aee-b1b9-9ded2137c9c9)
- 베이지안 필터
![image](https://github.com/user-attachments/assets/2c323c66-a371-4a7d-bbdb-35b607abab7e)
- 머신러닝 + Flask
![image](https://github.com/user-attachments/assets/03598b47-1120-4409-bc49-acbfd4cee4db)
- 웹소켓 통신
![image](https://github.com/user-attachments/assets/c0fc70f6-b48d-400c-9093-7a788babfa18)
- 지도 API 
![image](https://github.com/user-attachments/assets/c94db30a-2d87-474b-9b72-637ee168dbef)
- ELK + Kibana
![image](https://github.com/user-attachments/assets/bc81e184-00b6-4934-bce3-dd3ae34ef026)


## 사용기술
![image](https://github.com/user-attachments/assets/c1c05e52-64c5-4cc6-bcc0-608b089bc269)
![image](https://github.com/user-attachments/assets/f44bf0a7-b2d8-4012-b8ec-14c208e4ec20)

## DB - ERD
![image](https://github.com/user-attachments/assets/0149be72-e49a-4567-ad88-fc304331edef)
![image](https://github.com/user-attachments/assets/b63e8d2b-ad82-414d-ba9e-95d94be0786a)
![image](https://github.com/user-attachments/assets/0a297607-052d-4ad6-bdac-23994886aaf1)

## 시연영상
- 웹버전
[![유튜브 시연영상](https://github.com/user-attachments/assets/70dac0f8-e09e-403a-b197-be859ee4d0c4)](https://www.youtube.com/watch?v=hYL68JBf-s8)
- 모바일버전
[![유튜브 시연영상](https://github.com/user-attachments/assets/26dbe43e-f4c2-450f-a957-517f434af721)](https://www.youtube.com/watch?v=xDBnuexwwJc)

## notion ( 협업툴 )
https://www.notion.so/7ac3c69857bd4efdbd4e2ef3e6f6c0f8

## 팀원 역할
### PM - 이재연
### PL - 강채은

#### 강채은
- BeautifulSoup와 Selenium 을 사용한 중고거래 데이터 정보 추출 및 가공
- BayesianFilter를 사용하여 각 카테고리별로 ML 모델 학습하여
 사용자 추천상품, 유사 추천 상품, 검색어 추천 상품 알고리즘 구현

#### 이재연 
- react와 node 사용하여 관리자 페이지 구축
- Logstash를 활용한 데이터 정제 후 Elasticsearch, Kibana를 활용한 데이터 시각화 

#### 천지원
- 웹소켓을 사용한 실시간 양방향 채팅 시스템 구현
- BeautifulSoup와 Selenium 을 사용한 지역 구별 뉴스 데이터 정보 추출
  
#### 한기진
- T Map API를 활용한 길찾기 기능 구현
- 한국 전력 API를 활용한 충전소 실시간 정보 업데이트

#### 한남희
- 네이버 로그인 구현
