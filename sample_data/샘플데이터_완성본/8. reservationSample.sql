
/*host1 (id:11)의 가게 - 큐브코인노래방(id:12), KMGM 리얼야구존(id:26), 맥스당구장(id:36)*/
/*user1의 예약*/
insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('REJECT', now(), '2023-01-01', '2023-01-01', '06:30', '07:30', 'KAKAO', 3000, 20,  36,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-02', '2023-01-02', '08:30', '10:30', 'KAKAO', 5000, 30,  12,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-03', '2023-01-03', '10:30', '12:30', 'KAKAO', 8000, 15,  26,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('REJECT', now(), '2023-01-04', '2023-01-04', '15:30', '18:30', 'KAKAO', 12000, 12,  36,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-06', '2023-01-06', '06:30', '07:30', 'KAKAO', 3000, 20,  12,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('REJECT', now(), '2023-01-07', '2023-01-07', '08:30', '10:30', 'KAKAO', 5000, 30,  26,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-08', '2023-01-08', '10:30', '12:30', 'KAKAO', 8000, 15,  12,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-09', '2023-01-09', '15:30', '18:30', 'KAKAO', 12000, 12,  36,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('REJECT', now(), '2023-01-10', '2023-01-10', '08:30', '10:30', 'KAKAO', 5000, 30,  12,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-11', '2023-01-11', '06:30', '07:30', 'KAKAO', 3000, 20,  26,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('REJECT', now(), '2023-01-12', '2023-01-12', '08:30', '10:30', 'KAKAO', 5000, 30,  36,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('APPROVED', now(), '2023-01-13', '2023-01-13', '10:30', '12:30', 'KAKAO', 8000, 15,  26,  21);

insert into reservation(approveStatus, createDate, reservationDate, endDate, reservationTime, endTime, 
paymentType, price, reservationSeat, storeId, userId)
values('WAITING', now(), '2023-01-14', '2023-01-14', '15:30', '18:30', 'KAKAO', 12000, 12,  12,  21);

