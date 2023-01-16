
/*1:1 문의 질문*/
insert into onetooneask(answer, content, createDate, title, userId)
values(1, '안녕하세요! 결제는 어떻게 이루어지는지 알고 싶습니다!', now(), '결제는 어떻게 이루어지나요?', 28);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '같은 이메일로 아이디 등록은 불가한가요?', now(), '같은 이메일로 아이디 등록은 불가한가요?', 20);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '호스트 신청을 했는데 언제쯤 승인이 되나요?', now(), '호스트 신청을 했는데 언제쯤 승인이 되나요?', 15);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '결제 취소는 어떻게 되나요 ?', now(), '결제 취소는 어떻게 되나요 ?', 13);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '가게가 폐업을 했습니다. 절차를 부탁드립니다!', now(), '가게가 폐업을 했습니다. 절차를 부탁드립니다!', 22);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '신고는 어떻게 할 수 있나요?', now(), '신고는 어떻게 할 수 있나요?', 19);

insert into onetooneask(answer, content, createDate, title, userId)
values(0, '주문은 어떻게 이루어지나요 ?', now(), '주문은 어떻게 이루어지나요 ?', 23);

/*1:1 문의 답변*/

insert into onetooneanswer(content, createDate, oneToOneAskId, userId)
values('안녕하세요 결제는 카카오페이를 이용하시면 됩니다 :)!', now(), 1, 1);