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
        <li><a href="#portfolio">배우 마이페이지 - 포트폴리오 배우정보 등록 CRUD</a></li>
        <li><a href="#work">배우 마이페이지 - 포트폴리오 경력 CRUD</a></li>
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

 1. <h3 id="portfolio">포트폴리오 배우 정보 CRUD</h3>



  **배우 마이페이지 내 포트폴리오 메뉴**
  * 포트폴리오 배우 정보 등록
  ![포트폴리오 등록](https://github.com/jess0402/Project/blob/master/audition-project/src/main/webapp/images/project-img/enroll_port.gif?raw=true)
  
  * 포트폴리오 배우 정보 수정
  ![포트폴리오 수정](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/edit_port.gif?raw=true)
   
  * 구현 기능 설명
    - 포트폴리오 등록
    - 이전에 저장해둔 포트폴리오가 없는 신규 회원은 포트폴리오 등록 버튼을, 포트폴리오가 존재하는 기존 회원은 해당 포트폴리오를 보여줌.
    - 포트폴리오 수정시엔 DB에 등록된 포트폴리오 내용 불러옴.
    - 포트폴리오 수정시엔 프로필사진을 삭제하고 새로운 프로필사진을 등록할 수 있음.

------------

2. <h3 id="work">포트폴리오 경력 CRUD</h3>

  **배우 마이페이지 내 포트폴리오 메뉴**
  * 포트폴리오 경력 등록 & 삭제
  ![포트폴리오 경력 등록 & 삭제](https://github.com/jess0402/Project/blob/master/audition-project/src/main/webapp/images/project-img/workEnrollDelete.gif?raw=true)
  
  * 포트폴리오 경력 상세보기
  ![포트폴리오 경력 상세보기](https://github.com/jess0402/Project/blob/master/audition-project/src/main/webapp/images/project-img/workDetail.gif?raw=true)

  * 구현 기능 설명   
    - 경력 등록시 저장 버튼을 누르면 비동기로 경력란에 방금 저장한 경력이 추가됨.
    - 포트폴리오 수정 화면에서 경력 사진을 클릭하면 경력 수정 팝업이 뜨며 DB에 등록된 경력 내용 불러옴.
    - 경력 삭제시에 뜨는 alert 창에서 확인 버튼을 누르면 비동기로 경력란에 해당 경력 내용 삭제됨.
    
------------

3. <h3 id="applyAnn">지원한 공고 확인</h3>

   ![지원한 공고 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/applylist.gif?raw=true)

**배우 마이페이지 내 지원한 공고 확인 메뉴**

  * 구현 기능 설명   
    - 내가 지원한 공고 조회
    - 지원한 공고 클릭 시, 해당 배우가 지원한 공고를 DB에서 불러옴. 
    - 기본 정렬은 등록일자가 최신인 공고이며, 마감순을 선택하면 마감이 임박한 공고부터 정렬됨.
    - 공고보러가기를 선택하면 해당 공고의 상세페이지로 이동함.
    - 기한이 지난 공고는 회색으로 처리됨.
    - 선택 버튼을 누르면 공고를 선택할 수 있으며 삭제할 공고를 선택하여 삭제할 수 있음.
    
------------

4. <h3 id="annWishlist">공고 찜 목록</h3>

  ![공고 찜 목록](https://github.com/jess0402/Project/blob/master/audition-project/src/main/webapp/images/project-img/annWishlist2.gif?raw=true)

  **배우 마이페이지 공고 찜 목록 메뉴**
 
  * 구현 기능 설명
    - 내가 찜한 공고 조회
    - 공고 상세페이지에서 하트 버튼을 누르면 공고찜이 되며, 마이페이지 공고 찜목록에서 확인할 수 있음.  
    - 찜한 경력이 없으면 '찜한 공고가 없습니다'라는 문구가 보임
    - 공고 찜목록에서 공고를 클릭하면 해당 공고의 상세페이지로 이동함.
    - 기본 정렬은 공고 일자 최신순이며, 마감순을 선택하면 마감이 임박한 공고부터 정렬됨.
    - 선택 버튼을 누르고 공고를 선택한 뒤 삭제를 누르면 공고찜을 취소할 수 있으며, 목록에서도 사라짐.
    - 페이징 처리

------------  

## 캐스팅 디렉터 마이페이지

1. <h3 id="myAnn">내 공고 확인</h3>

  ![내 공고 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/myAnn.gif?raw=true)

  **캐스팅 디렉터 마이페이지 내 지원한 공고 확인 메뉴**
  
  * 구현 기능 설명
    - 내가 올린 공고 조회
    - 기본 정렬은 공고 등록 최신순이며, 마감순을 선택하면 마감이 임박한 공고부터 정렬됨.
    - 마감일이 지난 공고는 회색 처리됨.
    - 공고등록을 누르면 공고 등록 페이지로 이동함.
    - 선택을 누른 뒤, 공고를 선택한 후 삭제를 누르면 내가 올린 공고가 삭제됨. 
    - 선택을 누른 뒤, 공고를 선택한 후 수정을 누르면 공고 수정 페이지로 이동함. 
    - 2개 이상의 공고를 선택한 뒤 수정을 누르면 수정은 한번에 한개의 공고만 가능하다는 알람이 뜸.
    - 페이징 처리

------------

2. <h3 id="applyActor">지원자 확인</h3>

  ![지원자 확인](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/applicant.gif?raw=true)

  **캐스팅 디렉터 마이페이지 내 지원자 확인 메뉴**
 
  * 구현 기능 설명
    - 내 공고에 지원한 지원자 확인
    - 내가 올린 공고 중 마감일자가 지나지 않은(모집중인) 공고들이 목록으로 보여지며 공고를 선택하면 해당 공고에 지원한 지원자를 위에서 내려오는 오프캔버스에서 확인할 수 있음.
    - 기본적으로 지원자의 프로필 사진이 보여지며 마우스를 호버하면 해당 배우의 기본 정보와 상세페이지로 이동할 수 있는 버튼이 보임.
    - 지원자가 없는 공고는 오프캔버스에 '지원자가 없습니다'라는 문구가 보임.
    - 페이징 처리
    
------------

3. <h3 id="companyInfo">담당자 정보 CRUD</h3>

  ![담당자 정보](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/companyinfo.gif?raw=true)

  **캐스팅 디렉터 마이페이지 내 담당자 정보 메뉴**
 
  * 구현 기능 설명
    - 캐스팅 디렉터의 정보 등록 및 수정
    - 저장된 담당자 정보가 없으면 등록폼으로 넘어갈 수 있는 버튼이 보임.
    - 유효성 검사

------------  

3. <h3 id="actorWishlist">배우 찜 목록</h3>

  ![배우 찜 목록](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/actorWishlist.gif?raw=true)

  **캐스팅 디렉터 마이페이지 배우 찜 목록 메뉴**
 
  * 구현 기능 설명
    - 내가 찜한 배우 조회
    - 배우 상세페이지에서 하트 버튼을 누르면 배우찜이 되며, 마이페이지 배우 찜목록에서 확인할 수 있음.  
    - 찜한 배우가 없으면 '찜한 배우가 없습니다'라는 문구가 보임
    - 배우 찜목록에서 배우를 클릭하면 해당 배우의 상세페이지로 이동함.
    - 기본 정렬은 찜 누른 날짜 최신순이며, 마감순을 선택하면 가장 예전에 찜한 배우부터 정렬됨.
    - 선택 버튼을 누르고 배우를 선택한 뒤 삭제를 누르면 배우찜을 취소할 수 있으며, 목록에서도 사라짐.
    - 페이징 처리

------------ 

## 마이페이지 공통 기능

1. <h3 id="myBoard">내가 쓴 게시글</h3>

  ![내가 쓴 게시글](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/myboard.gif?raw=true)


  **마이페이지 공통기능 - 내가 쓴 게시글 메뉴**
  
  * 구현 기능 설명
    - 내가 쓴 게시글 조회
    - 기본 정렬은 작성일 최신순이며, 오래된 순을 누르면 작성일 오래된 순으로 정렬됨. 
    - 제목 클릭 시, 게시글 상세조회 페이지로 넘어감
    - 가장 왼쪽의 체크박스를 선택한 뒤 삭제버튼을 누르면 삭제를 다시 한번 확인하는 alert 창이 뜨며, 확인을 누르면 게시글이 삭제됨.
    - 가장 아래에서는 제목 검색을 할 수 있으며, 단어를 입력 후 검색을 누르면 제목에 해당 단어를 포함한 게시글만 조회가 됨. 
    - 페이징 처리

------------  
  
2. <h3 id="updateInfo">회원정보 수정</h3>

  ![회원정보 수정](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/updateMember.gif?raw=true)

  **마이페이지 공통기능 - 회원정보 수정**
 
  * 구현 기능 설명
    - 비밀번호를 재확인 한 뒤, 일치하는 경우만 회원정보 수정 페이지로 넘어감.
    - 회원정보 수정 시, DB에 등록된 정보 불러옴.
    - 비밀번호는 조건에 맞지 않으면 빨간 테두리에 폼 제출이 불가한 상태이다가, 조건에 맞아지는 순간 초록테두리로 변하며 폼 제출이 가능한 상태가 됨. 
    - 비밀번호 확인은 바로 위에 입력한 비밀번호와 일치하지 않으면 빨간 테두리에 폼 제출이 불가한 상태이다가, 일치하는 순간 초록테두리로 변하고 폼 제출이 가능한 상태가 됨. 
    - 유효성 검사

------------  
  
3. <h3 id="deleteMember">회원 탈퇴</h3>

  ![회원 탈퇴](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/deleteMember.gif?raw=true)

  **마이페이지 공통기능 - 회원 탈퇴**
 
  * 구현 기능 설명
    - 비밀번호를 재확인 한 뒤, 일치하는 경우만 탈퇴할 수 있음.
    - '정말 탈퇴하시겠습니까?'라는 문구로 alert 창이 뜨며 사용자가 확인 버튼을 누르면 탈퇴처리가 완료됨.

------------  
  
## 관리자 마이페이지

1. <h3 id="memberList">회원목록 조회</h3>

  ![회원목록 조회](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/memberList.gif?raw=true)

  **관리자 마이페이지 회원목록 조회 메뉴**
  
  * 구현 기능 설명
    - 기본 조회는 전체 조회이며, 조건별로 회원을 검색할 수 있음.
    - 검색 조건에서 아이디를 선택하면 검색창이 뜨며 알파벳을 입력하면, 아이디에 해당 알파벳을 포함한 멤버들만 조회가 됨.
    - 검색 조건에서 회원 유형을 선택하면 P(배우회원)와 D(디렉터 회원)를 선택할 수 있는 라디오 버튼이 생기며 하나를 선택한 뒤 검색을 누르면 해당 유형의 회원만 조회가 됨.
    - 검색 조건에서 회원명을 선택하면 검색창이 뜨며 글자를 입력하면, 이름에 해당 글자를 포함한 멤버들만 조회가 됨.
    - 페이징 처리

------------

2. <h3 id="reportList">신고내역 조회</h3>

  ![신고내역 조회](https://github.com/jess0402/Project/blob/c2a39b1a2a1a0228cb1f6567f23ef6b339e084b1/audition-project/src/main/webapp/images/project-img/reportList.gif?raw=true)

  **관리자 마이페이지 - 신고내역 조회**
 
  * 구현 기능 설명
    -  신고가 들어온 게시글을 조회
    -  제목 클릭시 해당 게시글 상세페이지로 넘어감.
    -  기본 정렬은 최신순이며 처리상태별(접수, 처리중)별로 정렬할 수 있음
    -  페이징 처리

------------   



    
<p align="center">
지금까지 읽어주셔서 감사합니다:)<br><br>
추가적인 포트폴리오가 궁금하시다면 <br>
[포트폴리오 링크]() 를 클릭해주세요~
</p>
