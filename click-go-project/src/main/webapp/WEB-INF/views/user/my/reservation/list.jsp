<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="reservation">

   <div id="view-more-title">
      <div>📬 예약 내역</div>
   </div>
   <hr>
   <br>
   <c:choose>
      <c:when test="${principal.user.role eq 'GEUST'}">

         <div class="container">
            <c:choose>
               <c:when test="${empty reservations.content}">
                  <div class="d-flex justify-content-center">
                     <div id="franchise--none">
                        <br> <br>
                        <div>현재 예약하신 내역이 존재하지 않습니다.</div>
                        <br> <br> <br>
                     </div>
                  </div>
               </c:when>
               <c:otherwise>

                  <c:forEach var="reservation" items="${reservations.content}">
                     <div class="media border mt-3"
                        style="width: 500px; height: 350px; border-radius: 15px;">
                        <div class="d-flex-column">
                           <img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
                              style="width: 500px; height: 200px; border-radius: 15px;">
                           <div class="media-body">
                              <div class="d-flex-column ml-3 mr-2 md-2 mt-1">
                                 <div class="d-flex justify-content-between pl-3 pt-3 pr-3">
                                    <h3 class="" style="font-weight: bold;">${reservation.store.storeName}</h3>
                                    <h5 class="mr-3 m-1">${reservation.approveStatus}</h5>
                                 </div>
                                 <div class="d-flex-column pl-3 mt-3">
                                    <span>${reservation.reservationTime}</span>
                                    <div class="d-flex">
                                       <span>${reservation.price}</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:forEach>

               </c:otherwise>
            </c:choose>

         </div>
      </c:when>

      <c:otherwise>

         <div class="container">
            <c:choose>
               <c:when test="${empty reservations.content}">
                  <div class="d-flex justify-content-center">
                     <div id="franchise--none">
                        <br> <br>
                        <div>현재 예약하신 내역이 존재하지 않습니다.</div>
                        <br> <br> <br>
                     </div>
                  </div>
               </c:when>

               <c:otherwise>
                  <c:forEach var="reservation" items="${reservations.content}">
                     <div class="media border mt-3"
                        style="width: 700px; height: 430px; border-radius: 15px;">
                        <div class="d-flex-column">
                           <img src="../image/about-us/pc_room_m.jpg" alt="가게 사진"
                              style="width: 700px; height: 300px; border-radius: 15px;">
                           <div class="media-body">
                              <div class="d-flex-column ml-3 mr-2 md-2 mt-1">
                                 <div class="d-flex justify-content-between pl-3 pt-3 pr-3">
                                    <h5 class="" style="font-weight: bold;">${reservation.store.storeName}</h5>
                                    <p class="mr-3 ">${reservation.approveStatus}</p>
                                 </div>
                                 <div class="d-flex-column pl-3 ">
                                    <span>${reservation.reservationTime}</span>
                                    <div class="d-flex justify-content-between">
                                       <span>${reservation.price}원</span> <span class="mr-4 md-5">${reservation.user.username}님의
                                          발자취 보러가기</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </c:otherwise>
            </c:choose>
         </div>
      </c:otherwise>
   </c:choose>
</div>
<script type="text/javascript" src="/js/reservation.js"></script>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../../../layout/footer.jsp"%>