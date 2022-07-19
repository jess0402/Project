# ⭐️Portfolio - 배우어때
### kh정보교육원 세미프로젝트 - 5GZO 배우 오디션 정보 프로그램
배우어때는 엔터테인먼트업에 종사하는 **배우, 제작사, 캐스팅매니저**가 사용할 수 있는 웹페이지입니다.

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
        <li><a href="#portfolio">배우 마이페이지 - 포트폴리오 등록 CRUD</a></li>
        <li><a href="#applyAnn">배우 마이페이지 - 지원한 공고 확인</a></li>
        <li><a href="#annWishlist">배우 마이페이지 - 공고 찜 목록</a></li>
        <li><a href="#myAnn">캐스팅 디렉터 마이페이지 - 내 공고 확인</a></li>
        <li><a href="#applyActor">캐스팅 디렉터 마이페이지 - 지원자 확인</a></li>
        <li><a href="#companyInfo">캐스팅 디렉터 마이페이지 - 담당자 정보 CRUD</a></li>
        <li><a href="#actorWishlist">캐스팅 디렉터 마이페이지 - 배우 찜 목록</a></li>
        <li><a href="#myBoard">마이페이지 공통기능 - 내가 쓴 게시글</a></li>
        <li><a href="#updateInfo">마이페이지 공통기능 - 회원정보 수정</a></li>
        <li><a href="#deleteMember">마이페이지 공통기능 - 회원 탈퇴</a></li>
        <li><a href="#memberList">관리자 기능 - 회원 관리</a></li>
        <li><a href="#reportList">관리자 기능 - 신고내역 관리</a></li>
      </ul>
    </li>
  </ol>
</details>

------------

# 📝개요

* 프로젝트 명 : audition-project

* 일정 : 2022년 06월 10일 ~ 2022년 06월 24일

* 개발 목적 : 배우는 오디션 정보를, 제작사나 캐스팅매니저는 배우들의 정보를 쉽게 공유하고 서로 소통할 수 있는 커뮤니티 사이트 제작

* 개발 환경
  - O/S : Windows 10
  - Server : Apache-tomcat-9.0
  - Java EE IDE : Eclipse ( version 2021-09 (4.21.0) )
  - Database : Oracle SQL Developer ( version 21.4.3 )
  - Programming Language : JAVA, HTML, CSS, JavaScript, JSP, SQL
  - Framework/flatform : jQuery 3.6.0, Bootstrap v5.1.3
  - Version management : Git

------------

# 📝내용
  
* 팀원별 역할
  - 공통 : 기획, 요구 사항 정의, 와이어 프레임, DB 설계
  - 권민지 : 배우찾기 카테고리 CRUD
  - 박민서 : 로그인, 회원가입
  - 박지수 : 게시판 카테고리 CRUD
  - 이은민 : 공고찾기 카테고리 CRUD
  - 장은성 : 배우 포트폴리오 CRUD, 마이페이지
  
* 구현 기능
  - 배우 마이페이지 (배우 포트폴리오 CRUD, 지원한 공고)
  - 캐스팅 디렉터 마이페이지 (내 공고 확인, 지원자 확인, 담당자 정보 등록 및 수정) 
  - 마이페이지 공통기능 (내가 쓴 게시글, 찜 목록, 회원정보 수정, 탈퇴)
  - 관리자 기능 (회원 관리, 신고내역 관리)


* DB 설계<br>
![audition-project](https://raw.githubusercontent.com/jess0402/Project/master/audition-project/src/main/webapp/images/project-img/erd.png)

------------

# 📝구현 기능

## 배우 마이페이지

 1. <h3 id="portfolio">배우 포트폴리오 CRUD</h3>



  **배우 마이페이지 내 포트폴리오 메뉴**
  * 포트폴리오 등록
  ![포트폴리오 등록](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/actorWishlist.gif?raw=true)
  
  * 포트폴리오 수정
  ![포트폴리오 수정](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/edit_port.gif?raw=true)
   
  * 구현 기능 설명
    - 포트폴리오 등록
    - 포트폴리오 수정시엔 DB에 등록된 포트폴리오 내용 불러옴.
    - 경력 등록시 저장 버튼을 누르면 비동기로 경력란에 방금 저장한 내용 추가됨.
    - 경력 수정시엔 DB에 등록된 경력 내용 불러옴.
    - 경력 삭제시에 뜨는 alert 창에서 확인 버튼을 누르면 비동기로 경력란에 해당 경력 내용 삭제됨.
    - 
    - 
    - 공지사항 게시판 글 목록 조회
    - 페이징을 통해 게시글 목록 넘기기
    - 공지사항 | 이벤트 탭을 통해 페이지 이동 가능
    - 관리자 회원만 글쓰기 가능
    - 게시글 상세 조회 (제목, 내용, 날짜, 조회수)
    - 관리자 회원만 수정/삭제 가능
    - 목록으로 이동


------------

2. <h3 id="applyAnn">지원한 공고 확인</h3>

   ![지원한 공고 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/applylist.gif?raw=true)

**배우 마이페이지 내 지원한 공고 확인 메뉴**

  * 구현 기능 설명   
      - 지원한 공고 클릭 시, 해당 배우가 지원한 공고를 DB에서 불러옴. 
      - 기본 정렬은 등록일자가 최신인 공고이며, 마감순을 선택하면 마감이 임박한 공고부터 정렬됨.
      - 공고보러가기를 선택하면 해당 공고의 상세페이지로 이동함.
      - 기한이 지난 공고는 회색으로 처리됨.
      - 선택 버튼을 누르면 공고를 선택할 수 있으며 삭제할 공고를 선택하여 삭제할 수 있음.
    
------------

3. <h3 id="annWishlist">공고 찜 목록</h3>

![공고 찜 목록](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/annWishlist.gif?raw=true)

  **배우 마이페이지 공고 찜 목록 메뉴**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------  

## 캐스팅 디렉터 마이페이지

1. <h3 id="myAnn">내 공고 확인</h3>

![내 공고 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/myAnn.gif?raw=true)


  **캐스팅 디렉터 마이페이지 내 지원한 공고 확인 메뉴**
  
  * 구현 기능 설명
    - 이벤트 게시판 글 목록 조회
    - 사진이 등록된 게시글은 첫번째 사진으로 썸네일 등록
    - 썸네일이 없는 게시글은 기본 이미지로 대체
    - 클릭 시, 게시글 상세조회 페이지로 넘어감
    - 페이징 처리
    - 관리자 회원만 글쓰기 가능
    - 이미지가 등록된 게시글은 이미지도 함께 조회됨.

------------

2. <h3 id="applyActor">지원자 확인</h3>

![지원자 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/applicant.gif?raw=true)

  **캐스팅 디렉터 마이페이지 내 지원자 확인 메뉴**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.
    
------------

3. <h3 id="companyInfo">담당자 정보 CRUD</h3>

![담당자 정보](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/companyinfo.gif?raw=true)

  **캐스팅 디렉터 마이페이지 내 담당자 정보 메뉴**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------  

3. <h3 id="actorWishlist">배우 찜 목록</h3>

![배우 찜 목록](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/actorWishlist.gif?raw=true)

  **배우 마이페이지 공고 찜 목록 메뉴**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------ 

## 마이페이지 공통 기능

1. <h3 id="myBoard">내가 쓴 게시글</h3>

![내가 쓴 게시글](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/myboard.gif?raw=true)


  **마이페이지 공통기능 - 내가 쓴 게시글 메뉴**
  
  * 구현 기능 설명
    - 이벤트 게시판 글 목록 조회
    - 사진이 등록된 게시글은 첫번째 사진으로 썸네일 등록
    - 썸네일이 없는 게시글은 기본 이미지로 대체
    - 클릭 시, 게시글 상세조회 페이지로 넘어감
    - 페이징 처리
    - 관리자 회원만 글쓰기 가능
    - 이미지가 등록된 게시글은 이미지도 함께 조회됨.


------------  
  
2. <h3 id="updateInfo">회원정보 수정</h3>

![회원정보 수정](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/updateMember.gif?raw=true)

  **마이페이지 공통기능 - 회원정보 수정**
 
  * 구현 기능 설명
    - 비밀번호를 재확인 한 뒤, 일치하는 경우만 회원정보 수정 페이지로 넘어감.
    - 회원정보 수정 시, DB에 등록된 정보 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------  
  
3. <h3 id="deleteMember">회원 탈퇴</h3>

![회원 탈퇴](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/deleteMember.gif?raw=true)

  **마이페이지 공통기능 - 회원 탈퇴**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------  
  
## 관리자 마이페이지

1. <h3 id="memberList">회원목록 조회</h3>

![회원목록 조회](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/memberList.gif?raw=true)


  **관리자 마이페이지 회원목록 조회 메뉴**
  
  * 구현 기능 설명
    - 이벤트 게시판 글 목록 조회
    - 사진이 등록된 게시글은 첫번째 사진으로 썸네일 등록
    - 썸네일이 없는 게시글은 기본 이미지로 대체
    - 클릭 시, 게시글 상세조회 페이지로 넘어감
    - 페이징 처리
    - 관리자 회원만 글쓰기 가능
    - 이미지가 등록된 게시글은 이미지도 함께 조회됨.


------------

2. <h3 id="reportList">신고내역 조회</h3>

![신고내역 조회](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/reportList.gif?raw=true)

  **관리자 마이페이지 - 신고내역 조회**
 
  * 구현 기능 설명
    -  SummerNote를 활용한 게시글 작성 구현.
    -  게시글 수정 시, DB에 등록된 게시글 제목, 내용 불러옴.
    - SummerNote Toolbar를 이용하여 글꼴 및 내용 수정.
    - 이미지가 등록된 게시글의 경우, 이미지도 함께 수정 가능.
    - 등록 클릭 시, 해당 내용으로 DB에 등록.


------------   



    
<p align="center">
지금까지 읽어주셔서 감사합니다:)<br><br>
추가적인 포트폴리오가 궁금하시다면 <br>
[포트폴리오 링크](https://techhyeondev.github.io/) 를 클릭해주세요~
</p>
