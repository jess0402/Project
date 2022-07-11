<%@page import="mypage.model.dto.ActorInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/Dwishlist.css" />
<%
   // String memberId = 'hosi';
   // String memberId = loginMember.getMemberId();
   
   // char memberRole = 'P';
   // char memberRole = loginMember.getMemberRole();
   
	List<ActorInfo> list = (List<ActorInfo>) request.getAttribute("list");
	String pagebar = (String) request.getAttribute("pagebar");
	String sortType = request.getParameter("sortType");
	
%>
<div class="top-logo">
  <span>MYPAGE</span>
</div>
<section id="container">
  <div id="Dmypage-submenu" class="submenu">
    <ul>
     <li><a href="<%= request.getContextPath() %>/mypage/myAnn" onmouseover="mousein(this);" onmouseout="mouseout(this)">내 공고 관리</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/myboardd?memberId=<%= loginMember.getMemberId() %>&memberRole=<%= loginMember.getMemberRole() %>" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 게시글</a></li>
      <li><a href="#" id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">찜목록</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/applicantList" onmouseover="mousein(this);" onmouseout="mouseout(this)">지원자 관리</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/companyInfo?memberId=<%= loginMember.getMemberId() %>" onmouseover="mousein(this);" onmouseout="mouseout(this)">담당자 정보</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/ckpw?type=update&role=D" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/ckpw?type=del&role=D" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
    </ul>
  </div>
  <div id="mywish">
    <div>
      <div id="wishlist-head">
      <div style = "display: flex; align-items: flex-end;">
        <h2>찜 목록</h2>      
        <span id="selectMsg" style="display: none; margin: 0 21px 17px;">배우를 선택해주세요.</span>
      </div>
        <div id="sortType-wrap">
           <% if(list != null && !list.isEmpty()){ %>
            	<button type="button" class="btn" id="choice-btn" onclick="selectMode();">선택</button>
            	<button type="button" class="btn" id="delete-btn" style="display:none;" onclick="delActor();">삭제</button>
            	<button type="button" class="btn" id="cancel-btn" style="display:none;" onclick="viewMode();">취소</button>
            <% } %>
        	<select id="sortType">
            	<option value="reg_date" id="reg_date" <%="reg_date".equals(sortType) ? "selected" : ""%>>최신순</option>
            	<option value="end_date" id="end_date" <%="end_date".equals(sortType) ? "selected" : ""%>>오래된순</option>
          	</select>
 <!--          <select id="sortType">
          	<option value="allGender" id="allGender" <%="allGender".equals(sortType) ? "selected" : ""%>>전체</option>
            <option value="female" id="female" <%="female".equals(sortType) ? "selected" : ""%>>여성</option>
            <option value="male" id="male" <%="male".equals(sortType) ? "selected" : ""%>>남성</option>
          </select>  -->
        </div>
      </div>
            <div id="updown-container">
            
      <% if(list != null && !list.isEmpty()){
		for(int i = 0; i < list.size(); i++){ 
			String fileName = list.get(i).getAttachment().getRenamedFilename();
			String img_src = "";
			
	         if(fileName == null){
	             img_src = request.getContextPath() + "/images/default.png";
	          } else {
	             img_src = request.getContextPath() + "/upload/portfolio/" + fileName;         
	          }
	         
	         String name = list.get(i).getActorName() == null ? "" : list.get(i).getActorName();
	         String birth = list.get(i).getBirth() == null ? "" : list.get(i).getBirth();
	         int _age = list.get(i).getAge();
	    	 
	         String actor_age = _age != 0 ? Integer.toString(_age) : "";	
	    	 String age = "";
	    	 if(actor_age != null){
	    		if(birth.isEmpty()){ 
	    			age = _age + "세";
	    		} else {
	    			age = _age + "세";
	    			// age = "(" + _age + ")세";
	    		}
	    		
	    	 }
	    	 
	    	 String company = list.get(i).getCompany() == null ? "" : list.get(i).getCompany();
			
		%>
          <div class="card" id="card<%= list.get(i).getActorNo() %>" >
            <div class="polaroid">
              <div class="img-container">
                <img src="<%= img_src %>" alt="">
              </div>
              <p class="actorName"><span class="highlight"><%= name %></span></p>
              <p class="actorBirth"><%= birth %></p>&nbsp;<p class="actorAge"><i><%= age %></i></p>
              <!-- <p class="company">컴패니 들어갈 자리</p> -->
              <input type="hidden" name="actorNo" id="actorNo" value="<%= list.get(i).getActorNo() %>">
            </div>
          </div>
        		<% 	} %>
		<% } else { %>
			<div><p>찜한 배우가 없습니다.</p></div>
		<% } %>
      </div>
	  <div id="pagebar">
	  	<%= pagebar %>
	  </div>
    </div>
  </div>

  <script>
  
  $(".card").on("click", function(){
      // console.log($(this)[0].firstElementChild.lastElementChild.value);
      const actorNo = $(this)[0].firstElementChild.lastElementChild.value;
       
      // 배우 상세 페이지로 넘겨
      location.href=`/app/actor/actorView?actorNo=\${actorNo}`;
  });

const selectMode = () => {
    console.log("selectMode 실행");
    $(".card").off("click");
    //$(".card").css('pointer-events', 'none');
    $('#choice-btn').css('display', 'none');
    
    $('#cancel-btn').css('display', '');
    $('#delete-btn').css('display', '');
    $('#selectMsg').css('display', '');
    $(".card").click(actorSelect);

};

const viewMode = () => {
    // $(".card").off("click");
    // $(".card").css('pointer-events', 'auto');
    console.log("viewMode 실행");
    $(".card").on('click', function(){
         // console.log($(this)[0].firstElementChild.lastElementChild.value);
         const actorNo = $(this)[0].firstElementChild.lastElementChild.value;
          
         // 배우 상세 페이지로 넘겨
         location.href=`/app/actor/actorView?actorNo=\${actorNo}`;
     });
    $('#choice-btn').css('display', '');
    $('#delete-btn').css('display', 'none');
    $('#cancel-btn').css('display', 'none');
    $('#selectMsg').css('display', 'none');
    
    
     const annArr = Array.from(document.querySelectorAll('.card'));
     ckremove(annArr);
    
}
  
  let selectedActor = [];
  
  const actorSelect = (actor) => {
	   if($(actor.currentTarget).hasClass("selected")){
		   $(actor.currentTarget).removeClass("selected");
	   } else {
		   $(actor.currentTarget).addClass("selected");
	   }
  } 
  
  const ckselected = (actorArr) => {
	   let actorNo = 0;
	   let selectedArr = [];
	   let i = 0;
	   actorArr.forEach((actor) => {
		   actorNo = actor.firstElementChild.lastElementChild.value;
		   
		   if(actor.classList.contains("selected")){
			   selectedArr[i++] = actorNo;
		   }
		   // element.classList.contains(class);
		   //if($(ann.currentTarget).hasClass("selected"))
	   });
	   
	   return selectedArr;
  }
  
  const ckremove = (actorArr) => {
	   actorArr.forEach((actor) => {
		   if(actor.classList.contains("selected")){
			   actor.classList.remove("selected");
		   }
	   });
  }
  
  // 찜목록 배우 삭제
  const delActor = () => {
	   const actorArr = Array.from(document.querySelectorAll('.card'));
	   
	   const selectedArr = ckselected(actorArr);
	   
	   console.log(selectedArr);
	   const msg = "총 " + selectedArr.length + "개의 찜한 배우가 선택되었습니다. 삭제하시겠습니까?"
	   const check = confirm(msg);
	   
	   if(check){
		   $.ajax({
			   url : "<%= request.getContextPath() %>/mypage/deleteActorWishlist",
			   method : "POST",
			   dataType : "json",
			   data : {
				   "memberId" : "<%= loginMember.getMemberId() %>",
				   "deleteArr" : selectedArr
			   },
			   success(arrs){
				   console.log("arrs = ", arrs);
		           $.each(arrs, function(index, num){
		        	   console.log("num = ", num);
		        	   let cardName = "#card" + num;
		        	   console.log(cardName);
		           
		        	   $(".card").remove(cardName);
		           });
		          location.reload();
		          alert('찜한 배우가 삭제되었습니다.');
			   },
			   error : console.log
		   });
	   } else {
		   ckremove(actorArr);
	   }
  }
  
  
  sortType.addEventListener('change', (e) => {
      document.querySelector("#updown-container").innerHTML = "";
      const {value} = e.target;
      // 공고 마감순 선택 시 페이지 요청
      location.href=`/app/mypage/DendDateWishList?sortType=\${value}`;
   });


  
    const mousein = (menu) => {
      now_menu.classList.remove('current');
      menu.classList.add('current');
    };

    const mouseout = (menu) => {
      now_menu.classList.add('current');
      menu.classList.remove('current');
    }
  </script>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>