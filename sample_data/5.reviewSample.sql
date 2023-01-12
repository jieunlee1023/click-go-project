
select * from review;
select * from likestore;

insert into review(content, createDate, starScore, storeId, userId)
values('시설이 별로 좋지 않은 것 같아요ㅠㅠ', now(), 3, 36, 41);

insert into review(content, createDate, starScore, storeId, userId)
values('너무 좋아요 !!', now(), 5, 36, 58);