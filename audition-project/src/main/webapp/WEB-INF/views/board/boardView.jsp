<%@page import="board.model.dto.BoardComment"%>
<%@page import="board.model.dto.Attachment"%>
<%@page import="board.model.dto.BoardExt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	BoardExt board = (BoardExt) request.getAttribute("board");
	
	List<BoardComment> comments = board.getBoardComments();
	
	boolean canEdit = loginMember != null 
	&& (loginMember.getMemberId().equals(board.getMemberId())
	|| loginMember.getMemberRole() == MemberRole.A);
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardView.css" />
<div class="top-logo">
 <img src="<%= request.getContextPath() %>/images/community.jpg" alt="게시판로고" />
</div>
<br />
<section  id="container">
<div id="Pmypage-submenu" class="submenu">
    <ul>
      <li><a href="<%= request.getContextPath() %>/notice/noticeList">공지 사항</a></li>
      <li><a href="<%= request.getContextPath() %>/board/boardList" id="now_menu" class="current">커뮤니티 게시판</a></li>
    </ul>
 </div>
<div id="myboard">
  <div>
	<div class="col-lg-8">
		<h1 class="fw-bolder mb-1"><span><%= board.getTitle() %></span></h1>
		<div class="text-muted fst-italic mb-2">
			Posted on <%= board.getRegDate() %>&nbsp;
			read count <%= board.getReadCount() %>&nbsp;
			<% if(loginMember != null && loginMember.getMemberRole() != MemberRole.A) {%>	
			<input type="button" class="btn-up" value="수정하기" onclick="updateBoard();"> 
			<% } %>
			<input type="button" class="btn-de" value="삭제하기" onclick="deleteBoard();">	
			<% if(loginMember != null && loginMember.getMemberRole() != MemberRole.A) { %>	
			<button type="button" class="btn-primary view"
			data-bs-toggle="modal" data-bs-target="#reportModal" id="btn -report">신고하기</button>
			<% } %>
			<button class="btn" style="float:right" onclick="location.href='<%= request.getContextPath() %>/board/boardList'"> 뒤로 가기 </button>&nbsp;
    	</div>
	</div>
	<hr>
<!-- Post content-->
	<section class="mb-5">
		<br />
		<h4><span><%= board.getContent() %></span></h4>
	</section>
<%
List<Attachment> attachments = board.getAttachments();
if (attachments != null && !attachments.isEmpty()) {
	for (Attachment attach : attachments) {
%>
	<div style="float: right;">
		<img src="<%=request.getContextPath()%>/images/attachfile2.png" width=45px;> 
		<a href="<%=request.getContextPath()%>/board/fileDownload?no=<%=attach.getNo()%>"><%=attach.getOriginalFilename()%></a>
	</div>
<%
	}
}
%>
	<br />
<%
if (loginMember != null 
&& loginMember.getMemberRole() != MemberRole.A) {
%>
<div>
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="reportModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reportModalLabel">신고</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="boardReportFrm"
					action="<%=request.getContextPath()%>/board/boardReport"
					method="POST">
					<input type="hidden" name="boardNoReport"
						value="<%=board.getNo()%>">
					<div class="modal-body">
						<div class="mb-3">
							<label for="message-text" class="col-form-label">신고자:</label> <input
								type="text" name="reportWriter" id="report-writer"
								value="<%=loginMember.getMemberId()%>" readonly>
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">신고내용:</label>
							<textarea class="form-control" name="reportContent" id="content"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary"
							id="btn-report-submit">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%
}
%>
<hr style="margin-top:30px;" />	
<!-- Comments section-->
<div class="comment-container">
	<!--table#tbl-comment-->
	<%
	if (comments != null && !comments.isEmpty()) {
	%>
	<table id="tbl-comment">
		<tbody>
			<%
		for (BoardComment bc : comments) {
			boolean canDelete = loginMember != null
			&& (loginMember.getMemberId().equals(bc.getMemberId()) || loginMember.getMemberRole() == MemberRole.A);
			if (bc.getCommentLevel() == 1) {%>
			<tr class="level1">
				<td><sub class="cwriterdate"><%=bc.getMemberId() != null ? bc.getMemberId() : "(탈퇴회원)"%></sub>
					<sub class="cwriterdate"><%=bc.getRegDate()%></sub> <br /> <%=bc.getContent()%>
				</td>

				<td>
					<button class="btn-reply" value="<%=bc.getNo()%>">답글</button> <% if (canDelete) { %>
					<button class="btn-delete" value="<%=bc.getNo()%>">삭제</button> <% } %>
				</td>
			</tr>
			<% } /*레벨 1*/ else { %>
			<tr class="level2">
				<td class="cwriterdate"><sub class="cwriterdate"><%=bc.getMemberId() != null ? bc.getMemberId() : "(탈퇴회원)"%></sub>
					<sub class="cwriterdate"><%=bc.getRegDate()%></sub> <br /> <%=bc.getContent()%>
				</td>
				<td>
					<% if (canDelete) {%><button class="btn-delete"
						value="<%=bc.getNo()%>">삭제</button> <% } %>
				</td>
			</tr>
			<% } /*레벨 2*/
		} /*FOR 문*/ %>
		</tbody>
	</table>
<% } %> <!-- IF 문 끝 -->
</div> 
	<div class="comment-editor">
		<form
			action="<%=request.getContextPath()%>/board/boardCommentEnroll"
			method="post" name="boardCommentFrm" id="#comment-h">
			<input type="hidden" name="boardNo" value="<%=board.getNo()%>" />
			<input type="hidden" name="memberId"
				value="<%=loginMember != null ? loginMember.getMemberId() : ""%>" />
			<input type="hidden" name="commentLevel" value="1" /> <input
				type="hidden" name="commentRef" value="0" />
			<textarea name="content" class="content" cols="60" rows="3" placeholder="댓글을 작성하세요"></textarea>
			<button type="submit" class="btn" id="btn-comment-enroll1">등록</button>
		</form>
	</div>
</div>
		<hr	/>
		<form action="<%=request.getContextPath()%>/board/boardCommentDelete" name="boardCommentDelFrm" method="POST">
			<input type="hidden" name="no" /> <!-- 댓글 번호 -->
			<input type="hidden" name="boardNo" value="<%= board.getNo() %>" />
		</form>
	</div><!-- myboard 끝 -->
</section>

<script>
/**
 * .btn-reply click eventhandler binding 
 */
document.querySelectorAll(".btn-delete").forEach((button) => {
	button.onclick = (e) => {
		if(!confirm("정말 삭제하시겠습니까?")) return;
		document.boardCommentDelFrm.no.value = e.target.value;
		document.boardCommentDelFrm.submit();
	}
});
// tbody > tr > td > .btn-reply
document.querySelectorAll(".btn-reply").forEach((button) => {
	button.onclick = (e) => {
		if(<%= loginMember == null %>){
			loginAlert();
			return;
		}
					
		const {value : commentRef} = e.target;
		console.log(commentRef);
		
		// tr > td > form 
		const tr = document.createElement("tr");
		const td = document.createElement("td");
		td.colSpan = "2";
		td.style.textAlign = "left";
		
		const frm = document.createElement("form");
		frm.name = "boardCommentFrm";
		frm.action = "<%=request.getContextPath()%>/board/boardCommentEnroll";
		frm.method = "POST";
		frm.onsubmit = commentSubmitHandler; // 동적생성한 요소는 핸들러바인딩도 새로 해야한다.
		
		const inputBoardNo = document.createElement("input");
		inputBoardNo.type = "hidden";
		inputBoardNo.name = "boardNo";		
		inputBoardNo.value = "<%= board.getNo() %>"
		const inputMemberId = document.createElement("input");
		inputMemberId.type = "hidden";
		inputMemberId.name = "memberId";
		inputMemberId.value = "<%= loginMember != null ? loginMember.getMemberId() : "" %>";
		const inputCommentLevel = document.createElement("input");
		inputCommentLevel.type = "hidden";
		inputCommentLevel.name = "commentLevel";
		inputCommentLevel.value = "2";
		const inputCommentRef = document.createElement("input");
		inputCommentRef.type = "hidden";
		inputCommentRef.name = "commentRef";
		inputCommentRef.value = commentRef;
			
		const textarea = document.createElement("textarea");
		textarea.name = "content";
		textarea.cols = "60";
		textarea.rows = "1";
		
		const button = document.createElement("button");
		button.className = "btn-up";
		button.innerText = "등록"
		
		frm.append(inputBoardNo);
		frm.append(inputMemberId);
		frm.append(inputCommentLevel);
		frm.append(inputCommentRef);
		frm.append(textarea);
		frm.append(button);
		td.append(frm);
		tr.append(td);
		
		// console.log(tr);
		// console.dir(td);
		
		// 1.부모요소 tbody
		const parent = e.target.parentElement.parentElement.parentElement;
		// console.log(parent); // td - tr - tbody
		// 2.기준요소 다음tr태그 
		const ref = e.target.parentElement.parentElement.nextElementSibling;
		// console.log(ref);
		
		// 생성된 tr 추가
		// parent.insertBefore(tr, ref);
		
		// target.insertAdjacentElement(position, newNode)
		// 1. beforebegin target의 이전 형제요소로 추가
		// 2. afterbegin target의 시작태그 다음에 자식요소로 추가
		// 3. beforeend target의 종료태그 직전에 자식요소로 추가
		// 4. afterend target의 다음 형제요소로 추가
		
		const target = e.target.parentElement.parentElement; // button.btn-reply의 부모tr
		console.log(target);
		target.insertAdjacentElement('afterend', tr);
		
		
		// 이벤트핸들링은 1회만 허용.
		e.target.onclick = null;
		
	};
});
document.querySelector("textarea[name=content]").onfocus = (e) => {
	if(<%= loginMember == null %>)
		loginAlert();
};
const commentSubmitHandler = (e) => {
	if(<%= loginMember == null %>){
		loginAlert();
		return false; 		
	}
	
	const contentVal = e.target.content.value.trim();
	if(!/^(.|\n)+$/.test(contentVal)){
		alert("댓글 내용을 작성해주세요.");
		e.target.content.focus();
		return false;
	}
	
};
document.boardCommentFrm.onsubmit = commentSubmitHandler;
const loginAlert = () => {
	alert("로그인후 이용할 수 있습니다.");
	document.querySelector("#memberId").focus();
};
</script>

<% if(canEdit){ %>
<form action="<%= request.getContextPath() %>/board/boardDelete" name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= board.getNo() %>" />
</form>
<script>
/**
 * POST /board/boardDelete
 * - no전송
 * - 저장된 파일 삭제 : java.io.File 
 */
const deleteBoard = () => {
	console.log('삭제');
	if(confirm("정말 이 게시글을 삭제하시겠습니까?")){
		document.boardDeleteFrm.submit();
	}
};	
const updateBoard= () => {
	location.href = "<%= request.getContextPath() %>/board/boardUpdate?no=<%= board.getNo() %>";
}
<% } 
if(loginMember != null && loginMember.getMemberRole() != MemberRole.A){
%>
/*
 * 신고
 */
$(content).keyup(function(e) {
   let content = $(this).val();
   if(content.length > 300){
      alert("신고 내용은 최대 300자까지 입력 가능합니다.");
      $(this).val(content.substring(0, 300));
      $(this).focus();
   }
});
document.querySelector("#btn-report-submit").addEventListener('click', (e) => {
   const contentVal = content.value.trim(); 
   console.log(contentVal);
   if(!/^(.|\n)+$/.test(contentVal)){ 
      alert('내용을 작성해주세요.');            
      content.select();
      return false;
   }
   
   if(confirm('신고내역을 제출하시겠습니까?')){
      console.log('신고진행');
   }
  
});
<% } %>
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>