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
        <li><a href="#addPoint">포인트 결제</a></li>
        <li><a href="#clubBoard">북클럽 게시판</a></li>
        <li><a href="#clubMissionDo">북클럽 미션</a></li>
        <li><a href="#clubMissionCheck">관리자의 미션 확인</a></li>
        <li><a href="#clubChat">북클럽 채팅</a></li>
        <li><a href="#clubDetail">북클럽 메인페이지</a></li>
        <li><a href="#clubStory">북클럽 스토리</a></li>
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
  - 북클럽 등록 (알라딘 API)
  - 북클럽 목록 조회
  - 북클럽 상세페이지
  - 북클럽 스토리 (풀캘린더)
  - 북클럽 미션 (미션 CRUD)
  - 북클럽 게시판 (글 CRUD, 댓글/대댓글 CRUD)
  - 북클럽 채팅 
  - 포인트 충전 (아임포트 API)


* DB 설계<br>
![bookie-project](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/images/erd0.png?raw=true)

* 일정<br>
![bookie-project](https://user-images.githubusercontent.com/84800644/187327684-4ed42084-88e8-4564-874d-23acd2853498.png)

------------

# 📝구현 기능

1. <h3 id="enrollClub">북클럽 등록</h3>

**관리자의 북클럽 등록** 
  * 구현 기능 설명
    - 책 추가시 알라딘 API를 통해 베스트셀러 목록을 불러옴
    - 키워드 / 제목 / 저자 / 출판사로 검색타입 설정하여 책 검색 가능
    - 등록한 미션 수정 및 삭제 가능
    
|제목 및 내용 등록|기본정보 등록(알라딘 API)|
|---|---|
| <img src="https://user-images.githubusercontent.com/84800644/192518311-7fdc323c-3e82-4748-92a4-114ac612df1c.JPG" width="500" height="320"/> | <img src="https://user-images.githubusercontent.com/84800644/192518374-cdf8d370-b448-4253-b779-f5c7a7dca8b0.JPG" width="500" height="320"/> |

|책 등록 모달|책 등록|
|---|---|
| <img src="https://user-images.githubusercontent.com/84800644/192519250-2fcf0c62-a98b-4ace-8f74-4d4f7d9184aa.JPG" width="500" height="700"/> | <img src="https://user-images.githubusercontent.com/84800644/192519182-ebcaa88b-4840-4f00-8ba4-fb07031cc37d.JPG" width="500" height="320"/> |

|미션 등록 모달|미션 등록|
|---|---|
| <img src="https://user-images.githubusercontent.com/84800644/192519479-c7412110-2793-4a89-adc2-958b5de90edb.png" width="500" height="550"/> | <img src="https://user-images.githubusercontent.com/84800644/192519527-543a3eff-4472-4739-a5e5-bf9aa39c0c00.JPG" width="500" height="320"/> |


------------

2. <h3 id="clubList">북클럽 조회</h3>

**북클럽 리스트 및 공고 조회** 
  * 구현 기능 설명
    - 현재 진행중인 북클럽 조회
    - 종료된 북클럽만을 조회 가능
    - 기본 정렬은 북클럽 모집일 최신순이며 북클럽 모집 마감일 순으로 정렬 가능
    - 회원은 북클럽 좋아요 가능
    - 북클럽 좋아요(하트)를 누르면 좋아요 수가 +1 오름
    - 회원은 북클럽 찜 가능
    - 페이징 처리
    
    - 회원은 북클럽 공고에서 북클럽 신청/취소를 할 수 있음
      - 만약 회원의 포인트가 북클럽 디파짓보다 적으면 신청 불가능
  
|북클럽 리스트 조회|북클럽 공고 조회|
|---|---|
| <img src="https://user-images.githubusercontent.com/84800644/192654110-454d1d18-b2bf-42f7-9a92-4207ecd856de.jpg" width="500" height="900"/> | <img src="https://user-images.githubusercontent.com/84800644/192654084-6d4e3073-2811-478a-b91d-e59fec577b91.jpg" width="500" height="1100"/> |

------------

3. <h3 id="addPoint">포인트 결제</h3>

![포인트 결제](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/3MyPoint.gif?raw=true)

  **포인트 결제**  
    
   * 구현 기능 설명
     - 사용자는 마이페이지에서 포인트를 결제할 수 있음. (북클럽 신청시 북클럽 디파짓 제출에 사용)
     - 아임포트 API를 이용해 결제 구현
     - 최근 3개월간의 결제 내역을 확인할 수 있음


------------

4. <h3 id="clubBoard">북클럽 게시판</h3>

    **북클럽 게시판**
     
      * 구현 기능 설명
        - 북클럽 게시판 글 작성 & 수정 & 삭제 가능
        - 글 작성시 첨부파일 등록 가능
        - 글 작성란 썸머노트 API 사용
        - 글에 댓글 작성 & 수정 & 삭제 가능
        - 댓글에 대댓글 작성 & 수정 & 삭제 가능
        - 기본 정렬은 작성일 최신순이며, 오래된 순을 선택하면 작성일 오래된 순으로 정렬됨.
        - 페이징 처리

  |북클럽 게시판 목록조회|
  |---|
  | <img src="https://user-images.githubusercontent.com/84800644/192657215-e63fd0c8-00d0-4fe9-af50-91652af1e8e0.jpg" width="550" height="600"/> |
     
  * 게시판 글 작성 
     ![북클럽 게시판 글 작성](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/14ClubBoardEnroll.gif?raw=true)
  
  * 게시판 글 수정
     ![북클럽 게시판 글 수정](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/15clubBoardUpdate.gif?raw=true)
  
  * 게시판 댓글/대댓글
    ![북클럽 게시판 댓글/대댓글](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/5Comment.gif?raw=true)


------------

5. <h3 id="clubMissionDo">북클럽 미션</h3>

**북클럽 미션** 
  * 사용자의 미션 제출
     ![북클럽 사용자 미션 제출](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/6MissionDo.gif?raw=true)
  
    * 구현 기능 설명
     -	미션 마감일 빠른 순으로 정렬됨.
     -	각 미션을 누르면 해당 미션의 내용이 반영된 모달이 열림
     -	모달에서 미션에 맞게 미션을 수행한 뒤 (첨부파일 첨부 or 내용 작성) 제출을 누르면 모달이 닫기며, 수행 전이었던 미션의 상태가 승인 대기중으로 바뀜. 

     
     
 ------------

6. <h3 id="clubMissionCheck">관리자의 미션 확인</h3>    
     
  * 관리자의 미션 확인
     ![북클럽 관리자 미션 확인](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/7MissionApprove.gif?raw=true)

    * 구현 기능 설명
     -	관리자는 회원이 제출한 미션 내역을 모아볼 수 있음.
     -	미션 내역을 선택하면 모달 창이 열려 사용자가 수행한 미션 내용이 보여지며 승인/반려를 선택할 수 있음. 
     -	승인/반려를 선택하면 모달창이 자동으로 닫기며, 상태를 처리한 미션이기 때문에 내역에서도 해당 미션이 지워짐.


------------

7. <h3 id="clubChat">북클럽 채팅</h3>

![북클럽 채팅](https://github.com/jess0402/Project/blob/master/bookie-project/src/main/webapp/resources/gifs/4clubChat.gif?raw=true)

  **북클럽 채팅**  
    
   * 구현 기능 설명
     - 실시간으로 접속된 사람들과 채팅할 수 있음
     - 내가 보낸 채팅은 오른쪽에, 상대가 보낸 채팅은 왼쪽에 나타남.
     - 이전 채팅 내용을 보고 있을 때 새로운 채팅이 올라오면 알림이 뜨며, 해당 알림을 클릭하면 가장 최근 채팅으로 이동함


------------

8. <h3 id="clubDetail">북클럽 메인페이지</h3>

    **북클럽 메인페이지**  
     * 구현 기능 설명
       - 사용자는 북클럽 메인페이지에서 해당 북클럽에 대한 간략한 내용을 확인할 수 있음.
       
|북클럽 메인페이지|
|---|
| <img src="https://user-images.githubusercontent.com/84800644/192655376-3f071733-647b-479e-8636-4fe9d71a58ea.jpg" width="550" height="900"/> |

------------

9. <h3 id="clubStory">북클럽 스토리</h3>

    **북클럽 스토리**  

     * 구현 기능 설명
       - 사용자는 북클럽 스토리 페이지에서 해당 북클럽에 대한 상세한 내용을 확인할 수 있음.
       - 알라딘 API를 사용해 읽을 책의 정보를 가져옴.
       - 풀 캘린더 API를 사용해 북클럽 스케줄을 보여줌

|북클럽 스토리|
|---|
| <img src="https://user-images.githubusercontent.com/84800644/192655059-70bb8062-a949-498f-be45-5b0baa6794fa.jpg" width="550" height="1400"/> |


------------


10. <h3 id="myClub">내가 가입한 북클럽 조회</h3>

    **내가 가입한 북클럽 조회**  
     * 구현 기능 설명
       - 사용자는 마이페이지에서 내가 가입한 북클럽을 조회할 수 있음.
       - 기본 정렬은 북클럽 시작일 최신순이며, 마감일순으로 정렬 가능
       - 기한이 종료된 북클럽은 회색 처리 
       - 페이징 처리
     
|내가 가입한 북클럽 조회|
|---|
| <img src="https://user-images.githubusercontent.com/84800644/192654885-c69b60f7-ea5c-4de0-84c4-13dee752aaaa.jpg" width="550" height="850"/> |

------------

<p align="center">
지금까지 읽어주셔서 감사합니다:)<br><br>
추가적인 포트폴리오가 궁금하시다면 <br>
[포트폴리오 링크](https://github.com/jess0402/Project) 를 클릭해주세요~
</p>


