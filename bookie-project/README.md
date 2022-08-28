# 북이온앤온 by 북끄북끄
### kh정보교육원 파이널 프로젝트 - 북끄북끄의 책 관리 웹페이지
북이온앤온은 내가 읽었던, 읽고 있는 책들을 더 완벽하게 읽기를 도와주는 웹 페이지 입니다.
내 서재의 기록을 돌아보며 한 주, 1개월, 1년을 특별하게 채워보세요.

<!-- contents -->
<details open="open">
  <summary>Contents</summary>
  <ol>
    <li>
      <a href="#개요">개요</a>
    </li>
    <li>
      <a href="#내용">내용</a>
    </li>
    <li><a href="#구현-기능">구현 기능</a>
      <ul>
        <li><a href="#enrollClub">북클럽 등록</a></li>
        <li><a href="#clubList">북클럽 조회</a></li>
        <li><a href="#clubBoard">북클럽 게시판</a></li>
        <li><a href="#clubMissionDo">북클럽 미션</a></li>
        <li><a href="#clubMissionCheck">관리자의 미션 확인</a></li>
        <li><a href="#clubChat">북클럽 채팅</a></li>
        <li><a href="#clubMainPage">북클럽 메인페이지</a></li>
        <li><a href="#clubStory">북클럽 스토리</a></li>
        <li><a href="#addPoint">포인트 결제</a></li>
        <li><a href="#myClub">내가 가입한 북클럽 조회</a></li>
      </ul>
    </li>
  </ol>
</details>

------------

# 📝개요

* 프로젝트 명 : audition-project

* 일정 : 2022년 07월 13일 ~ 2022년 8월 29일

* 개발 환경
  - 운영체제 : Windows 10
  - 서버 : Apache-tomcat-9.0
  - 프레임 워크: Spring, Mybatis, Maven, Bootstrap, Spring Security
  - DBMS: Oracle SQL Developer ( version 21.4.3 )
  - 개발 언어: Java, HTML5, CSS, JavaScript, jQuery, AJAX
  - API : 알라딘 API, 아임포트(결제) API, summernote, 풀캘린더
  - 협업 툴: Git, ERD Cloud, Google Drive

## 대표 기능 📙
> **피드** - 내가 좋아하는 책과 내용을 공유해요
> 
> **독후감** - 책에 대한 나만의 생각을 남겨요
> 
> **북클럽** - 다른 사람과 의견을 나누고, 미션을 달성하여 책을 더 재밌게 읽어봐요
>

## 북이온앤온에서는 이런 것들이 가능합니다.
### 가상 서재

책을 빌려서 보거나, 
본인 책이 훼손되는 것이 속상한 독자들에게
기록하고 싶은 구절 & 다시 보고싶은 부분에 밑줄을 그어 표시할 수 있는 공간,  
가상 서재 북이온앤온 ✍️
감명깊은 페이지와 구절의 사진을 업로드 하여 기록 해보자

### 기록형 독서

올해 내가 책을 얼마나 봤을까?
몇 권을 목표로 할 수 있을까?
나의 독서 기록을 눈에 들어오게
수치화, 시각화하여 보여주는 연간 책 기능
나의 독서 취향을 파악🤔 하고, 연간 통계 📊 를 확인해보자

### 소셜 미디어

단순히 기록 기능을 넘어서 
피드, 북클럽 기능을 통해 다른사람과 교류할 수 있고, 
책을 함께 읽어가는 감성 👨‍👨‍👦
북이온앤온은 독서라는 같은 취미를 가진 사람들을 만나게한다.  책에 대해 소통하고, 나와 독서 취향이 비슷한 사람이 읽은 다른 책들은 무엇이 있는지 알아보자 !

------------

# 📝내용

* 팀원별 역할
  - 공통 : 기획, 요구 사항 정의, 와이어 프레임, DB 설계
  - 이은민 : 로그인, 회원가입, 책 검색 & 책 등록, 독후감, 피드, 관리자
  - **장은성** : 북클럽 개설, 북클럽 개별 게시판 관리 및 진행, 포인트 충전 및 내역 조회
  - 고두현 : 마이페이지 정보 관리, 연간 책 그래프, 월간 독서 달력
  - 김경한 : 아이디찾기, 비밀번호찾기
  
* 나의 구현 기능
  - 북클럽 등록
  - 북클럽 목록 조회
  - 북클럽 상세페이지
  - 북클럽 스토리
  - 북클럽 미션, 
  - 북클럽 게시판
  - 북클럽 채팅
  - 포인트 충전 


* DB 설계<br>
![bookie-project]()

* 일정<br>
![bookie-project]()

------------

# 📝구현 기능

1. <h3 id="enrollClub">북클럽 등록</h3>

**관리자의 북클럽 등록** 
 * 북클럽 기본정보 및 책 등록(알라딘 API)
  ![기본정보 및 책 등록](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/1enrollClubInfo.gif?raw=true)
  
  * 북클럽 미션 등록
  ![북클럽 미션 등록](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/2enrollClubMission.gif?raw=true)
   
  * 구현 기능 설명
    - 책 추가시 알라딘 API를 통해 베스트셀러 목록을 불러옴
    - 키워드 / 제목 / 저자 / 출판사로 검색타입 설정하여 책 검색 가능
    - 등록한 미션 수정 및 삭제 가능


------------

2. <h3 id="clubList">북클럽 조회</h3>

  ![북클럽 조회](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/8ClubList.gif?raw=true)

**북클럽 조회**

  * 구현 기능 설명
    - 현재 진행중인 북클럽 조회
    - 종료된 북클럽만을 조회 가능
    - 기본 정렬은 북클럽 모집일 최신순이며 북클럽 모집 마감일 순으로 정렬 가능
    - 회원은 북클럽 좋아요 가능
    - 북클럽 좋아요(하트)를 누르면 좋아요 수가 +1 오름
    - 회원은 북클럽 찜 가능
    - 페이징 처리



------------

