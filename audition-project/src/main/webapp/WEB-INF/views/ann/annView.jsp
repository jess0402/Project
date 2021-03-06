<%@page import="mypage.model.dto.ActorInfoExt"%>
<%@page import="mypage.model.dto.PortfolioWork"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mypage.model.dto.ActorInfo"%>
<%@page import="mypage.model.dto.PortAttachment"%>
<%@page import="wishlist.model.dto.WishListAnn"%>
<%@page import="member.model.dto.MemberRole"%>
<%@page import="member.model.dto.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="member.model.dto.Production"%>
<%@page import="ann.model.dto.Ann"%>
<%@page import="common.model.dto.Cast"%>
<%@page import="common.model.dto.WorkAttachment"%>
<%@page import="java.util.List"%>
<%@page import="common.model.dto.Work"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ann.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/annApply.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<% 
   Ann ann = (Ann) request.getAttribute("ann");
   Work work = ann.getWork();
   List<WorkAttachment> workAttachments = work.getAttachments();
   Cast cast = work.getCast();
   Production p = (Production) request.getAttribute("production");
   
   
   PortAttachment profile = (PortAttachment) request.getAttribute("profile"); 
   ActorInfo actorInfo = (ActorInfo) request.getAttribute("actorInfo");
   List<PortfolioWork> pList = (List<PortfolioWork>) request.getAttribute("pList");
   
   List<WishListAnn> wishlistAnn = (List<WishListAnn>) request.getAttribute("wishlistAnn");

   boolean canEdit = loginMember != null 
         && (loginMember.getMemberId().equals(ann.getMemberId()) 
               || loginMember.getMemberRole() == MemberRole.A);
%>

<section id="ann-view-container">
	<div class="container">
		<div class="ann-info mrgbtm">
			<h1 id="ann-title"><%= ann.getAnnTitle() %></h1>
			<span id="cast-role"><%= cast.getCastRole() %></span>&nbsp;|&nbsp;<span id="cast-name"><%= cast.getCastName() %>???</span>
			<h5 id="work-title"> <%= work.getProduction() %>&nbsp;|&nbsp;<%= work.getDirector() %>&nbsp;|&nbsp;<<%= work.getTitle() %>> </h5>
			<p><%= ann.getAnnEndDate() %> ?????? | <%= ann.getAnnRegDate() %> ??????</p>
			<% if(loginMember != null && loginMember.getMemberRole().toString().equals("P")) { %>			
				<button type="button" id="btn-apply" class="rounded view" data-bs-toggle="modal" data-bs-target="#applyModal" >????????????</button>
	
			<!-- Modal -->
			<div class="modal fade" id="applyModal" tabindex="-1"
				aria-labelledby="applyModalLabel" aria-hidden="true">
				<div class="modal-dialog" id="applyModalContent">
					<div class="modal-content" >
						<div class="modal-header">
							<h5 class="modal-title" id="applyModalLabel">?????? ?????? : ?????? ???????????????</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form name="annApplyFrm" 
							action="<%= request.getContextPath() %>/ann/annApply"
							method="POST">
							<input type="hidden" name="annNoApply" value="<%= ann.getAnnNo() %>">
							<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>">
							<div class="modal-body">
							<% if(profile != null && actorInfo != null && !pList.isEmpty()) { %>
							     <table id="portTable">
							        <tbody>
							          <tr>
							            <th rowspan="9" id="img-th">????????????</th>
							            <td rowspan="9">
							              <div id="profile-img-container">
							                <img src="<%= request.getContextPath() %>/upload/portfolio/<%= profile.getRenamedFilename() %>" id="profile-img">
							              </div>
							            </td>
							            <th>??????</th>
							            <td colspan="3">
							              <span><%= actorInfo.getActorName() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>??????</th>
							            <td style="width: 150px;">
							            	<span><%= actorInfo.getBirth() %></span>
							            </td>
							            <th style="text-align: right;">??????</th>
							            <td>
							            	<span><%= actorInfo.getAge() %>???</span>
							            </td>
							          </tr>
							          <tr>
							            <th>?????????</th>
							            <td colspan="3">
							            	<span><%= actorInfo.getCompany() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>??????</th>
							            <td colspan="3">
							            	<span><%= actorInfo.getEducation() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>???</th>
							            <td style="width: 150px;">
							              <span><%= actorInfo.getHeight() %>cm</span>
							            </td>
							            <th style="text-align: right;">??????</th>
							            <td>
							            	<span><%= actorInfo.getWeight() %>kg</span>
							            </td>
							          </tr>
							          <tr>
							            <th>?????????</th>
							            <td colspan="3">
							            	<span><%= actorInfo.getPhone() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>?????????</th>
							            <td colspan="3">
							              <span><%= actorInfo.getEmail() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>SNS</th>
							            <td colspan="3">
							            	<span><%= actorInfo.getSns() %></span>
							            </td>
							          </tr>
							          <tr>
							            <th>??????</th>
							            <td colspan="3">
							            	<span><%= actorInfo.getSpeciality() %></span>
							            </td>
							          </tr>
							          
							          
							          <tr>
							            <td><br></td>
							          </tr>
							        </tbody>
							        
							        <tbody id="addWork-tbody">
							    	  <tr>
							              <th colspan="2" id="work-wrap-th">??????</th>
							              <td colspan="4" style="text-align:right;">
							              </td>
							          </tr>
							          <tr>
							            <td colspan="6" style="border-top: 1px solid grey;"></td>
							          </tr>
							          <tr>
							          	<td><br /></td>
							          </tr>
									</tbody>
									<% for(int i = 0; i < pList.size(); i++){ %>
									<tbody id="work<%= pList.get(i).getNo() %>"></tbody>
										<tr>
											<th rowspan="5" class="work-no"><span><%= i + 1 %></span></th>
											<td rowspan="5">
												<div id="work-img-container">
													<img class="work-img" src="<%= request.getContextPath() %>/upload/portfolio/<%= pList.get(i).getAttachment().getRenamedFilename() %>" alt="????????????<%= i + 1 %>" />
												</div>
											</td>
										</tr>
										<tr class="work-tr">
											<th>?????????</th>
											<td colspan="3"><%= pList.get(i).getTitle() %></td>
										</tr>
										<tr class="work-tr">
											<th>??????</th>
											<td colspan="3"><%= pList.get(i).getMyrole() %></td>
										</tr>
										<tr class="work-tr">
											<th>??????</th>
											<td colspan="3"><%= pList.get(i).getPeriod() %></td>
										</tr>
										<tr>
							            	<td colspan="6" style="border-top: 1px solid grey;"></td>
							         	</tr>
									</tbody>
									<% }%>
							      </table>	
							      <% } %>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
								<a href="<%= request.getContextPath() %>/mypage/portfolio?memberId=<%= loginMember.getMemberId() %>&memberRole=<%= loginMember.getMemberRole() %>" role="button" class="btn btn-secondary" >??????????????? ???????????? ??????</a>
								<button type="button" onclick="ApplySubmit();" class="btn" id="btn-apply-submit">??????</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		<% } %>
			<div id="btn-wish" onclick="addWishlist(this);">
			<% if(wishlistAnn != null && !wishlistAnn.isEmpty()){
					for(int i = 0; i < wishlistAnn.size(); i++){
						if(wishlistAnn.get(i).getAnnNo() == ann.getAnnNo()){ %>
						   <img id="fullHeart" src="<%= request.getContextPath() %>/images/fullHeartWish.png" alt="" />
						<% break;
				 		} else if(i == wishlistAnn.size() - 1) { %>
						<img id="emptyHeart" src="<%= request.getContextPath() %>/images/emptyHeartWish.png" alt="" />
				 	 <% } %>
				<% 	} %> 
			<% } else { %>
					<img id="emptyHeartN"src="<%= request.getContextPath() %>/images/emptyHeartWish.png" alt="" />
			<% } %>
			</div>
			
		</div>
		<div class="work-info mrgbtm">
			<h2>?????? ??????</h2>
			<table class="table table-borderless" id="tbl-work-info">
			<tbody>
				<tr>
					<th>?????? ??????</th>
					<td><%= work.getTitle() %></td>
				</tr>
				<tr>
					<th>?????? ??????</th>
					<td><%= work.getWorkField() %></td>
				</tr>
				<tr>
					<th>??????</th>
					<td><%= work.getDirector() %> ??????</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td><%= work.getProduction() %></td>
				</tr>
				<tr>
					<th>?????????</th>
					<td><%= p.getCasterName() %></td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>
					<% if(p.getIsPhoneOpen().equals("Y")){ %>
							<%= p.getCasterPhone() %>			
					<% } else { %> ????????? <% } %>
					</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>
					<% if(p.getIsEmailOpen().equals("Y")){ %>
						<%= p.getCasterEmail() %>			
					<% } else { %> ????????? <% } %>
					</td>
				</tr>
			</tbody>
			</table>
		</div>	
		<hr />
		<div class="work-content mrgbtm">
			<h2>?????? ??????</h2>
			<p class="workD">
				<%= work.getDescription() %>
			</p>
		</div>
		<hr />
		<div class="cast-info mrgbtm">
			<h2>?????? ??????</h2>
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
							aria-controls="panelsStayOpen-collapseOne">
						<%= cast.getCastRole() %> ??? <%= cast.getCastName() %> ??? 
						<br />
						<%= ann.getAnnAge() %> | <%= ann.getAnnGender() %> | <%= ann.getAnnNop() %>???	
						</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show"
						aria-labelledby="panelsStayOpen-headingOne">
						<div class="accordion-body">
							<table class="table table-borderless" id="tbl-cast-info">
							<tbody>
								<tr>
									<th>?????? ??????</th>
									<td><%= cast.getCastName() %> ??? (<%= cast.getCastRole() %>)</td>
								</tr>
								<tr class="underline">
									<th>?????? ??????</th>
									<td><%= ann.getAnnNop() %>???</td>
								</tr>
								<tr>
									<th>?????? ??????</th>
									<td><%= ann.getAnnAge() %> | <%= ann.getAnnGender() %> <%= ann.getHasTO().equals("Y") ? "| ???????????? ??????" : "" %></td>
									
								</tr>
								<tr class="underline">
									<th>?????? ??????</th>
									<td><%= ann.getAnnHeight() != null ? (ann.getAnnHeight().equals("??????????????????") ? "" : ann.getAnnHeight()) : "" %> 
									| <%= ann.getAnnBody() != null ? (ann.getAnnBody().equals("??????????????????") ? "" : ann.getAnnBody()) : "" %> </td>
								</tr>
								<tr>
									<th>?????????</th>
									<td><%= ann.getAnnPay() %></td>
								</tr>
								<tr class="underline">
									<th>?????? ??????</th>
									<td><%= ann.getAnnArea() %></td>
								</tr>
								<tr>
									<th>?????? ??????</th>
									<td><%= cast.getCastContents() != null ? cast.getCastContents() : ""%></td>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="attachments mrgbtm">
			<h2>?????? ??? ?????????</h2>
			<%
			if(workAttachments != null && !workAttachments.isEmpty()){
				for(WorkAttachment wa : workAttachments){ %>
					<figure class="figure">
						<!-- ???????????? ?????? ?????? img??? ????????? -->
						<img src="<%= request.getContextPath() %>/upload/ann/<%= wa.getRenamedFilename() %>" class="figure-img img-fluid rounded" alt="????????????" style="width:280px">
					</figure>
			<% } %>
		<% } %>
		</div>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary view" data-bs-toggle="modal"
			data-bs-target="#reportModal" id="btn-report">????????????</button>


      <!-- Modal -->
      <div class="modal fade" id="reportModal" tabindex="-1"
         aria-labelledby="reportModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="reportModalLabel">??????</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <form name="annReportFrm" 
                  action="<%= request.getContextPath() %>/ann/annReport"
                  method="POST">
                  <input type="hidden" name="annNoReport" value="<%= ann.getAnnNo() %>">
                  <div class="modal-body">
                     <div class="mb-3">
                        <label for="message-text" class="col-form-label">?????????:</label>
                        <input type="text" name="reportWriter" id="report-writer" value="<%= loginMember.getMemberId() %>" readonly>
                     </div>
                     <div class="mb-3">
                        <label for="message-text" class="col-form-label">????????????:</label>
                        <textarea class="form-control" name="reportContent" id="content"></textarea>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                     <button type="submit" class="btn btn-primary" id="btn-report-submit" >??????</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <% if(canEdit){ %>
            <input type="button" value="????????????" class="btn-delete view" id="btn-delete" onclick="deleteAnn()">
            <input type="button" value="????????????" class="btn-update view" id="btn-update" onclick="updateAnn()">
      <% } %>
   </div>

</section>
<script>
/**
 * ??????????????? ?????? ?????? ?????? ??? ?????? & ?????? ?????? 
 */
const ApplySubmit = () => {
   let applyList;
   if(confirm('?????????????????? ?????????????????????????')){
      $.ajax({
         url : "<%= request.getContextPath() %>/ann/getApplyList",
         data : {
            "memberId" : "<%= loginMember.getMemberId() %>"   
         },
         success(resp){
            let cnt = 0;
            if(resp != null && resp.length > 0){
               for(let i = 0; i < resp.length; i++){
                  const {applyAnnNo} = resp[i];
                  if(applyAnnNo == <%= ann.getAnnNo() %>){
                     alert('?????? ????????? ???????????????.');         
                     break;
                  } else {
                     cnt++;
                  }
                  
                  if(cnt == resp.length){
                     document.annApplyFrm.submit();
                     alert('?????? ????????? ?????????????????????.');
					 sendEmail();
                  }
               }
                  
            } else {
            	document.annApplyFrm.submit();
				alert('?????? ????????? ?????????????????????.');
				sendEmail();
            }
         },
         error : console.log,
         complete(){
         }
      });
   }
};

(function(){
	emailjs.init("qr-nmLS4V0i4h59Yx");		
})();

const sendEmail = () => {
	var templateParams = {	
		director: "<%= p.getCasterName() %>",
		annTitle: "<%= ann.getAnnTitle() %>",
		directorEmail: "<%= p.getCasterEmail() %>"
	};
                    
	emailjs.send('service_r6ea1ha', 'template_hxvvope', templateParams)
		.then(function(response) {
			console.log('SUCCESS!', response.status, response.text);
		}, function(error) {
			console.log('FAILED...', error);
		});
}

/**
 * ?????? ?????? ??? wishlist_ann??? ?????? | ?????? ?????????
 */
 const addWishlist = (e) => {
	   const wishBtn = document.querySelector("#btn-wish");
	   let wishBtnSrc = wishBtn.lastElementChild.src;
	   if(wishBtnSrc.substr(33,) == "fullHeartWish.png"){
	      $.ajax({
	         url : "<%= request.getContextPath() %>/ann/delWishAnn",
	         data : {
	            annNo : <%= ann.getAnnNo() %>,
	            memberId : "<%= loginMember.getMemberId() %>"
	         },
	         success(resp){
	            //????????? empty???
	            wishBtn.lastElementChild.src = "<%= request.getContextPath() %>/images/emptyHeartWish.png";
	         },
	         error : console.log
	      });
   } else {
      $.ajax({
         url : "<%= request.getContextPath() %>/ann/addWishAnn",
         data : {
            annNo : <%= ann.getAnnNo() %>,
            memberId : "<%= loginMember.getMemberId() %>"
         },
         success(resp){
            //????????? full???
            wishBtn.lastElementChild.src = "<%= request.getContextPath() %>/images/fullHeartWish.png";
         },
         error : console.log
      });
   }
};

/**
 * ????????? ????????? ??? ???????????? ?????? ???????????? 
 */
 
const annEndDate = "<%= ann.getAnnEndDate() %>";
const today = new Date();
const endDate = new Date(annEndDate);
const btnApply = document.querySelector("#btn-apply");
if(endDate < today){ 
	console.log(today, annEndDate);
	btnApply.innerText = "?????? ??????";
	btnApply.style.backgroundColor = "gainsboro";
	btnApply.style.boxShadow = "none";
	btnApply.disabled = 'disabled';
}

/**
 *  ???????????? 300??? ??????
 */
$(content).keyup(function(e) {
   let content = $(this).val();
   if(content.length > 300){
      alert("?????? ????????? ?????? 300????????? ?????? ???????????????.");
      $(this).val(content.substring(0, 300));
      $(this).focus();
   }
});
document.querySelector("#btn-report-submit").addEventListener('click', (e) => {
   //????????? ???????????? ?????? ?????? ???????????? ??? ??????.
   const contentVal = content.value.trim(); 
   console.log(contentVal);
   if(!/^(.|\n)+$/.test(contentVal)){ //????????????(.)??? ?????? ??????????????? ????????? ????????????. -> (.|\n)?????? ???????????? ???.
      alert('????????? ??????????????????.');            
      content.select();
      return false;
   }
   
   if(confirm('??????????????? ?????????????????????????')){
      console.log('????????????');
   }
});
</script>

<%-- ???????????? ???????????? --%>
<% if(canEdit) { %>
<form 
   name="annDelFrm" 
   action="<%= request.getContextPath() %>/ann/annDelete"
   method="POST">
   <input type="hidden" name="annNo" value="<%= ann.getAnnNo() %>" />
</form> 
<script>
const deleteAnn = () => {
   if(confirm('????????? ???????????? ???????????? ??? ????????????. ????????? ?????????????????????????'))
      document.annDelFrm.submit();
}
const updateAnn = () => {
   location.href = "<%= request.getContextPath() %>/ann/annUpdate?annNo=<%= ann.getAnnNo() %>"; 
}
</script>
<% } %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>