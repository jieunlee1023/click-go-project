let index = {
   init: function() {

      let msgSizeData = $("#msgSize").val();

      for (var i = 0; i < msgSizeData; i++) {
         let userId = $("#userId" + i).text();
         let userName = $("#userName" + i).text();
         let franchiseId = $("#franchiseId" + i).text();
         let category = $("#category" + i).text();
         let storeName = $("#storeName" + i).text();
         let storeTel = $("#storeTel" + i).text();
         let storeAddress = $("#storeAddress" + i).text();
         let storeTotalRoomCount = $("#storeTotalRoomCount" + i).text();
         let licenseImageUrl = $("#licenseImageUrl" + i).val();
         let layoutImageUrl = $("#layoutImageUrl" + i).val();
         let price = $("#price" + i).text();
         $("#btn--store-franchise-approve-" + i).bind("click", () => {
            this.approve(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, licenseImageUrl, layoutImageUrl, storeTotalRoomCount, price);
         });
         $("#btn--store-franchise-reject-" + i).bind("click", () => {
            var rejectMsg = prompt("유저에게 보낼 승인 거절 사유를 적어주세요!");
            if (rejectMsg != null) {
               this.reject(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, rejectMsg);
            }
         });
      }
   },

   approve: function(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, licenseImageUrl, layoutImageUrl, storeTotalRoomCount, price) {
      let data = {
         id: franchiseId,
         storeName: storeName,
         storeAddress: storeAddress,
         storeTEL: storeTel,
         userId: userId,
         licenseImageUrl: licenseImageUrl,
         layoutImageUrl: layoutImageUrl,
         storeTotalRoomCount: storeTotalRoomCount,
         price: price,
      }
      $.ajax({
         type: 'POST',
         url: `/api/store-franchise/approve/${data.id}/${data.userId}?category=${category}`,
         data: JSON.stringify(data),
         contentType: "application/json; charset=UTF-8",
         dataType: "json",
      }).done(function(data) {
         if (data.httpStatus == true) {
            alert("가맹점 승인이 완료되었습니다.");
            location.href = "/storeFranchise/store-franchise-message";
         } else {
            alert("실패");
         }
      }).fail(function(error) {
         console.log(error);
         alert("오.류가 발생했습니다");
      });

   },
   reject: function(userId, userName, franchiseId, category, storeName, storeTel, storeAddress, rejectMsg) {
      let data = {
         id: franchiseId,
         storeName: storeName,
         storeAddress: storeAddress,
         storeTEL: storeTel,
         userId: userId,
         rejectReason: rejectMsg,
      }
      $.ajax({
         type: 'POST',
         url: `/api/store-franchise/reject/${data.id}/${data.userId}`,
         data: JSON.stringify(data),
         contentType: "application/json; charset=UTF-8",
      }).done(function(data) {
         if (data.httpStatus == true) {
            alert("가맹점 승인이 거절 되었습니다!");
            location.href = "/storeFranchise/store-franchise-message";
         } else {
            alert("실패");
         }
      }).fail(function(error) {
         console.log(error);
         alert("오류가 발생했습니다.");
      });
   },
}

index.init();


