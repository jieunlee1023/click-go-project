<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<div class="container" id="terms">

   <div id="view-more-title">
      <div>π 1:1 λ¬Έμ</div>
   </div>
   <br>



   <div class="container mt-5" id="tab-menu">
      <div id="tab-btn" class="d-flex">
         <ul>
            <li class="active"><a href="#" style="text-decoration: none;">λμ λ¬Έμ λ΄μ­</a></li>
            <li class="active"><a href="#" style="text-decoration: none;">μ λ¬Έμ μμ±</a></li>
         </ul>
      </div>
      <div id="tab-cont">
         <div id="tab-cont-1">
            <div class="container">
               <table class="table" id="answer-list-table">
                  <thead>
                     <tr style="text-align: center;">
                        <th>μ μλ²νΈ</th>
                        <th>λ¬Έμμ λͺ©</th>
                        <th>λ΅λ³μ¬λΆ</th>
                        <th>μμ±μκ°</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="askList" items="${askList }">
                        <c:choose>
                           <c:when test="${askList.user.id eq principal.user.id}">
                              <tr style="text-align: center;">
                                 <td>${askList.id }</td>
                                 <td><a style="text-decoration: none; color: gray;" href="/admin/one-to-one-answer/${askList.id }">${askList.title }</a></td>
                                 <td><c:choose>
                                       <c:when test="${askList.answer eq '0' }">
                                          <span class="badge badge-warning">λ΅λ³λκΈ°</span>
                                       </c:when>
                                       <c:otherwise>
                                          <span class="badge badge-success">λ΅λ³μλ£</span>
                                       </c:otherwise>
                                    </c:choose></td>
                                 <td>${askList.createDate }</td>
                              </tr>
                           </c:when>
                        </c:choose>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>



         <div id="tab-cont-2">
            <div class="container">
               <form action="/view-more/one-to-one-ask/save" method="post">
                  <input type="hidden" id="id" value="${principal.user.id }">
                  <div class="d-flex flex-column">
                     <div class="pb-5">
                        <h4>ν΄λ¦­κ³  μ΄μ© μ€ λΆνΈνμ  μ μ λ¬Έμμ£Όμλ©΄ μ΅λν λΉ λ₯Έ μμΌλ΄μ λ΅λ³ λλ¦¬κ² μ΅λλ€.</h4>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <h5>λ¬Έμμ ν</h5>
                        <div class="form-group" style="width: 30%;">
                           <input class="form-control" name="title" placeholder="λ¬Έμνμ€ μ λͺ©μ μλ ₯νμΈμ" required="required"></input>
                        </div>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <h5>λ¬Έμλ΄μ©</h5>
                        <div class="form-group">
                           <textarea name="content" id="content" rows="5" class="form-control content" cols="" required="required"></textarea>
                        </div>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <ul>
                           <li>λ¬Έμνμ€ λ΄μ©μ 10μ μ΄μ μλ ₯ν΄ μ£ΌμΈμ.</li>
                           <li>λ¬Έμνμλ μ ν΄μ  μ΄λ¦κ³Ό μμ½μ λ³΄λ₯Ό λ¨κ²¨μ£Όμλ©΄ λ³΄λ€ λΉ λ₯Έ μλ΄μ΄ κ°λ₯ν©λλ€.</li>
                           <li>λ¬Έμ λ΄μ© μμ± μ κ°μΈμ λ³΄κ° μλ ₯λμ§ μλλ‘ μ£Όμ λΆνλλ¦½λλ€.</li>
                        </ul>
                     </div>
                     <div class="d-flex justify-content-center">
                        <button class="btn btn-light" type="submit">μμ± μλ£</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>



<script>
   $('.content').summernote({
      placeholder : 'λ¬Έμνμ€ λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ',
      tabsize : 2,
      height : 300,
   });
</script>

<script type="text/javascript">
   var tabBtn = $("#tab-btn > ul > li"); //κ°κ°μ λ²νΌμ λ³μμ μ μ₯
   var tabCont = $("#tab-cont > div"); //κ°κ°μ μ½νμΈ λ₯Ό λ³μμ μ μ₯

   //μ»¨νμΈ  λ΄μ©μ μ¨κ²¨μ£ΌμΈμ!
   tabCont.hide().eq(0).show();

   tabBtn.click(function() {
      var target = $(this); //λ²νΌμ νκ²(μμ)μ λ³μμ μ μ₯
      var index = target.index(); //λ²νΌμ μμλ₯Ό λ³μμ μ μ₯
      tabBtn.removeClass("active"); //λ²νΌμ ν΄λμ€λ₯Ό μ­μ 
      target.addClass("active"); //νκ²μ ν΄λμ€λ₯Ό μΆκ°
      tabCont.css("display", "none");
      tabCont.eq(index).css("display", "block");
   });
</script>






<%-- <%@ include file="../layout/footer.jsp"%> --%>
