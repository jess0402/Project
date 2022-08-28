<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dokooEnroll.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="피드등록" name="title"/>
</jsp:include>
<sec:authentication property="principal" var="loginMember"/>
<!-- 책선택, 공개여부선택 -->
<div id="pheed-enroll-container">
<section id="section">
	<div id="top-title" class="text-center">
		<h1>피드 등록🤳</h1>
	</div>
		<form:form
			name="pheedEnrollFrm"
			method="POST"
			enctype="multipart/form-data"
			action = "${pageContext.request.contextPath}/pheed/pheedEnroll.do">
		<div id="nickname-div" class="mb-2">
			<label for="nickname">작성자</label>
			<input type="text" name="nickname" id="nickname" value="${loginMember.nickname}" readonly />
		</div>
		<div id="book-div">
			<button class="custom-btn btn-5" data-toggle="modal" 
				data-target="#bookListModal" type="button">책 선택</button>
			<div id="book-info">
				
			</div>
			<label for="page" class="m-2">페이지</label>
			<input type="number" name="page" id="page" class="form-control w-25 mr-1 d-inline"/>P
		</div>
		<div id="file-div">
			<div id="file-div-title">
				<label for="upFile">첨부파일</label>
			</div>
			<div>
				<img src="" alt="미리보기" id="profileImg" style="display: none; width: 300px;"/>
			</div>
			<input type="file" name="upFile" id="upFile" onchange="loadImage(this);" />
		</div>
		<div id="content-div">
			<label for="editorData">내용</label>
			<textarea class="summernote" name="content" id="content"></textarea>
		</div>

		<input type="hidden" name="memberId" value="${loginMember.memberId}" />
		<input type="hidden" name="itemId" id="itemId" value="" />
		
		<div id="open-div">
			<label class="open">공개여부</label>				
			<input type="radio" name="isOpened" value="O" class="ml-5" checked/>
			<label for="O" class="ml-1">전체공개</label>
			<input type="radio" name="isOpened" value="F" class="ml-5" />
			<label for="O" class="ml-1">팔로워공개</label>
			<input type="radio" name="isOpened" value="C" class="ml-5"/>
			<label for="C" class="ml-1">비공개</label>
		</div>
		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<div id="btn-div">
			<button type="submit">작성</button>
		</div>
		
		</form:form>
</section>
</div>
<%-- 책 추가 모달 --%>
<div class="modal fade" id="bookListModal" tabindex="-1" role="dialog" aria-labelledby="bookListModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookListModalLabel">나의 책 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body m-2 p-2" >
		<ul class="list-group" id="bookList">
		</ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script>
<%-- 책 추가 스크립트 --%>
// load 시 등록된 책 list 가져와서 뿌려
window.addEventListener('load', () => {
	const container = document.querySelector("#bookList");
	$.ajax({
		url : '${pageContext.request.contextPath}/dokoo/getReadBookList.do',
		method : 'GET',
		data : {
			memberId : '${loginMember.memberId}'
		},
		success(resp){
			//console.log(resp);
			if(resp.length == 0){
				container.insertAdjacentHTML('beforeend', '<li class="list-group-item item">등록된 책이 없습니다.</li>');
			}
			// 가져온 리스트를 화면에 뿌려
			resp.forEach((book) => {
				const {itemId} = book;
				// 커버랑 제목 가져올 알라딘 책 1권 조회
				$.ajax({
					url : '${pageContext.request.contextPath}/search/selectBook.do',
					data : {
						ttbkey : 'ttbiaj96820130001',
						itemIdType : 'ISBN13', 
						ItemId : `\${itemId}`,
						output : 'js',
						Cover : 'mini',
						Version : '20131101'
					},
					success(response){
						const {item} = response;
						//console.log(item);
						let {title, author, pubDate, description, isbn13, cover, categoryId, categoryName, publisher} = item[0];
						// ul하위에 li tag로 리스트 추가
						const li = `<li class="list-group-item item" onclick="bookSelect(this);" data-imgSrc=\${cover} data-itemid=\${isbn13}>
									<img src=\${cover} alt="책표지" />
									\${title}</li>`;
						container.insertAdjacentHTML('beforeend', li);
						
					}
				});
			});
		},
		error : console.log
	});
});

<%-- 책 클릭 시   --%>
const bookSelect = (e) => {
	const bookInfo = document.querySelector("#book-info"); 
	bookInfo.innerHTML = "";
	bookInfo.insertAdjacentHTML('beforeend','<img src="" alt="책표지" id="book-img"/><span id="book-title"></span>');

	document.querySelector('#book-img').src = e.dataset.imgsrc;
	document.querySelector('#book-title').innerText = e.innerText;
	document.querySelector('#itemId').value = e.dataset.itemid;
	
	// 모달 닫기
	$('#bookListModal').modal('hide');
};
<%-- img 미리보기 --%>
const loadImage = (input) => {
    console.log(input.files);
    if(input.files[0]){
       const fr = new FileReader();
       fr.readAsDataURL(input.files[0]);
       fr.onload = (e) => {
          console.log(e.target.result);
          const profileImg = document.querySelector("#profileImg"); 
          profileImg.src = e.target.result
          profileImg.style.display = "inline";
		}
	}
}   


$(document).ready(function() {
	$('.summernote').summernote();
});

$('.summernote').summernote({
	  // 에디터 높이
	  height: 300,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		
	});


document.pheedEnrollFrm.addEventListener('submit', (e) => {
	const content = document.querySelector("#content");
	const bookInfo = document.querySelector("#book-info");
	const page = document.querySelector("#page");
	if(bookInfo.innerText == ''){
		e.preventDefault();
		alert("책을 등록해주세요.")
		return;
	}
	// 페이지 숫자만 1글자 이상
	if(!/^[0-9]{1,}$/.test(page.value)){
		e.preventDefault();
		alert("페이지를 작성해주세요.")
		return;
	}
	if(!/^.+$/.test(content.value)){
		e.preventDefault();
		alert("내용을 작성해주세요.")
		return;
	}
	if(content.value.length > 600){
		e.preventDefault();
		alert('600자 이상 입력할 수 없습니다.')
		return;
	}
	e.submit();
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>