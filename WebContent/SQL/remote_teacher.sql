show user;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 테이블 생성하기 

-- 회원 테이블
create table tbl_dog_member ( member_seq     number                 -- 시퀀스
                            , user_id   varchar2(35)                -- 유저 아이디
                            , user_name nvarchar2(50) not null      -- 유저 이름
                            , user_pw   varchar2(300)               -- 유저 비밀번호 ( 암호화 )
                            , user_birthday varchar2(8)             -- 유저 생년월일
                            , user_gender   char(1)                 -- 유저 성별 ( 1: 남자 , 2: 여자 )
                            , postcode  varchar2(6)                 -- 우편번호
                            , addr1     varchar2(300)               -- 주소1
                            , addr2     varchar2(300)               -- 주소2
                            , phone     varchar2(200)               -- 휴대전화번호 ( 암호화 / 복호화 )
                            , email     varchar2(300) not null      -- 이메일 ( 암호화 / 복호화 )
                            , user_sns  varchar2(20)                -- 유저 가입시에 sns 이용 여부
                            , alert_email   char(1) default '0'     -- 이메일 알림 유무 ( 0: 거부 , 1: 수신 )
                            , alert_sms     char(1) default '0'     -- SMS 알림 유무 ( 0: 거부 , 1: 수신 )
                            , reserve       number default 0        -- 적립금
                            , registerday   date    default sysdate -- 가입일
                            , pwchangeday   date    default sysdate -- 비밀번호 변경일
                            , lastloginday  date    default sysdate -- 최종 로그인 날짜
                            , status    char(1)  default '1'        -- 회원 상태 ( 0: 탈퇴 , 1: 활동 )
                            , resign_reason        varchar2(2000)   -- 탈퇴사유
                            , constraint PK_DOG_MEMBER_SEQ primary key(member_seq)
                            , constraint UK_DOG_MEMBER_ID unique(user_id)
                            , constraint UK_DOG_MEMBER_EMAIL unique(email)
                            , constraint CK_DOG_MEMBER_GENDER check( user_gender in('1','2') )
                            , constraint CK_DOG_MEMBER_ALERT_EMAIL check( alert_email in('0','1') )
                            , constraint CK_DOG_MEMBER_ALERT_SMS check( alert_sms in('0','1') )
                            , constraint CK_DOG_MEMBER_STATUS check ( status in ('0','1') )
                            );

create sequence seq_dog_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 회원 반려동물 테이블
create table tbl_dog_pet ( pet_seq  number              -- 펫 시퀀스
                        , fk_email  varchar2(300) not null  -- fk 이메일
                        , pet_name  varchar2(40)            -- 펫 이름
                        , pet_birthday  varchar2(8)         -- 펫 생년월일
                        , pet_type  nvarchar2(30)           -- 견종
                        , pet_neutral   char(1)             -- 중성화 유무 ( 0: 안함 , 1: 함 )
                        , pet_weight    number              -- 펫 무게 
                        , pet_gender    char(1)             -- 펫 성별 ( 1: 남자 , 2: 여자 ) 
                        , pet_photo varchar2(300)           -- 펫 사진명
                        , status char(1) default '1'        -- 펫 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                        , constraint PK_DOG_PET_SEQ primary key(pet_seq)
                        , constraint FK_DOG_PET_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                        , constraint CK_DOG_PET_NEUTRAL check ( pet_neutral in ('0','1') )
                        , constraint CK_DOG_PET_GENDER check ( pet_gender in ('1','2'))
                        , constraint CK_DOG_PET_STATUS check ( status in ('0','1'))
                        );

create sequence seq_dog_pet
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;                   

-- 공지사항 테이블
create table tbl_dog_notice ( notice_seq    number                      -- 글번호 시퀀스
                            , title     varchar2(200)                   -- 글제목
                            , content   varchar2(4000)                  -- 글내용
                            , photoname     varchar2(300)               -- 글에 첨가할 이미지
                            , registerday   date default sysdate        -- 등록일
                            , readcount number default 0                -- 조회수
                            , status char(1) default '1'                -- 삭제 여부 ( 0: 삭제 , 1: 삭제 안함 )
                            , constraint PK_DOG_NOTICE_SEQ primary key(notice_seq)
                            , constraint CK_DOG_NOTICE_STATUS check ( status in ('0','1'))
                            );
                            
create sequence seq_dog_notice
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;   

-- 공지사항 조회수 테이블
create table tbl_dog_notice_count ( notcount_seq number                 -- 그냥 시퀀스
                                    , fk_notice_seq number              -- 공지사항 글번호 
                                    , fk_email  varchar2(300) not null  -- fk 이메일
                                    , constraint PK_DOG_NOTICECOUNT primary key (notcount_seq)
                                    , constraint FK_DOG_NOTICECOUNT foreign key(fk_notice_seq) references TBL_DOG_NOTICE(notice_seq)
                                    , constraint FK_DOG_NOTICECOUNT_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                    );
                                    
create sequence seq_dog_notice_count
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;                                     
                                    
-- 원료 테이블
create table tbl_dog_ingredient ( ingredient_seq    number      -- 글번호 시퀀스
                                , name  varchar2(60)            -- 원료명
                                , photoname varchar2(300)       -- 원료 이미지명
                                , explanation   varchar2(4000)  -- 원료 설명
                                , status char(1) default '1'    -- 삭제 여부 ( 0: 삭제 , 1: 삭제 안함 )
                                , constraint PK_DOG_INGREDIENT_SEQ primary key(ingredient_seq)
                                , constraint CK_DOG_INGREDIENT_STATUS check ( status in ('0','1'))
                                );

create sequence seq_dog_ingredient
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;   

-- 이벤트 테이블
create table tbl_dog_event ( event_seq  number          -- 이벤트 글번호
                            , name  varchar2(60)        -- 이벤트 명
                            , photoname varchar2(300)   -- 이벤트 이미지명
                            , event_start varchar2(100)       -- 이벤트 시작일
                            , event_end   varchar2(100)       -- 이벤트 종료일
                            , status char(1) default '1' -- 삭제 여부 ( 0: 삭제, 1: 삭제 안함 )
                            , constraint PK_DOG_EVENT_SEQ primary key(event_seq)
                            , constraint CK_DOG_EVENT_STATUS check ( status in ('0','1'))
                            );

create sequence seq_dog_event
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;  

-- 이벤트 조회 테이블
create table tbl_dog_event_count ( eventcnt_seq number                  -- 그냥 시퀀스
                                    , fk_event_seq number               -- 이벤트 글번호 
                                    , fk_email  varchar2(300) not null  -- fk 이메일
                                    , constraint FK_DOG_EVENTCOUNT foreign key(fk_event_seq) references TBL_DOG_EVENT(event_seq)
                                    , constraint FK_DOG_EVENTCOUNT_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                    );
                                    
create sequence seq_dog_event_count
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;   


-- 후기 테이블
create table tbl_dog_review ( review_seq    number                      -- 후기글 번호
                            , fk_email  varchar2(300) not null          -- fk 이메일
                            , fk_product_code number not null           -- fk 상품코드
                            , content   varchar2(4000)                  -- 내용
                            , registerday   date default sysdate        -- 등록일
                            , photoname     varchar2(300)               -- 사진명
                            , status char(1) default '1'                -- 삭제 여부 ( 0: 삭제 , 1: 삭제 안함 )
                            , constraint PK_DOG_REVIEW_SEQ primary key(review_seq)
                            , constraint FK_DOG_REVIEW_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                            , constraint FK_DOG_REVIEW_PRODUCT foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                            , constraint CK_DOG_REVIEW_STATUS check ( status in ('0','1'))
                            );

create sequence seq_dog_review
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 

-- 후기 평점 테이블
create table tbl_dog_review_rating ( rating_seq number                  -- 그냥 시퀀스
                                    , fk_review_seq number               -- 후기 글번호 
                                    , fk_email  varchar2(300) not null  -- fk 이메일
                                    , constraint PK_DOG_REVIEWRATE primary key (rating_seq)
                                    , constraint FK_DOG_REVIEWRATE foreign key(fk_review_seq) references tbl_dog_review(review_seq)
                                    , constraint FK_DOG_REVIEWRATE_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                    );
                                    
create sequence seq_dog_review_rating
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;  

-- 후기 추천수 테이블
create table tbl_dog_review_recommend ( recommend_seq number             -- 그냥 시퀀스
                                    , fk_review_seq number               -- 후기 글번호 
                                    , fk_email  varchar2(300) not null  -- fk 이메일
                                    , constraint PK_DOG_REVIEWRECOM primary key (recommend_seq)
                                    , constraint FK_DOG_REVIEWRECOM foreign key(fk_review_seq) references tbl_dog_review(review_seq)
                                    , constraint FK_DOG_REVIEWRECOM_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                    );
                                    
create sequence seq_dog_review_recommend
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;  




-- 후기에 댓글 테이블
create table tbl_dog_reviewreview ( revrev_seq  number                  -- 대댓글 시퀀스
                                    , fk_email  varchar2(300) not null  -- fk 이메일
                                    , fk_review_seq number not null     -- fk 후기글 번호
                                    , content   varchar2(1000)          -- 대댓글 내용
                                    , registerday   date default sysdate    -- 대댓글 등록날짜
                                    , status char(1) default '1'        -- 삭제 여부 ( 0: 삭제, 1: 삭제 안함 )
                                    , constraint PK_DOG_REVIEWREVIEW_SEQ primary key(revrev_seq)
                                    , constraint FK_DOG_REVIEWREVIEW_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                    , constraint FK_DOG_REVIEWREVIEW_REVSEQ foreign key(fk_review_seq) references TBL_DOG_REVIEW(review_seq)
                                    , constraint CK_DOG_REVIEWREVIEW_STATUS check ( status in ('0','1'))
                                    );

create sequence seq_dog_reviewreview
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 

-- 상품 테이블
create table tbl_dog_product ( product_code number                  -- 상품 코드 시퀀스
                            , product_name  varchar2(300)           -- 상품명
                            , fk_brand_code number not null         -- fk 브랜드 코드 
                            , product_price number                  -- 상품 가격
                            , product_sample    char(1)             -- 샘플인지 아닌지 ( 0: 샘플 아님 , 1: 샘플임 )
                            , product_explanation   varchar2(4000)  -- 샘플 설명
                            , product_ingredient    varchar2(4000)  -- 샘플 원료 설명
                            , product_texture   char(1)             -- 식감 ( 1 습식, 2 건식 )
                            , product_registerday date default sysdate  -- 등록일
                            , product_capacity  number              -- 용량 ( g 단위 )
                            , status char(1) default '1'            -- 삭제 여부 ( 0: 삭제 , 1: 삭제 안함 )
                            , constraint PK_DOG_PRODUCT_CODE primary key(product_code)
                            , constraint FK_DOG_PRODUCT_BRAND foreign key(fk_brand_code) references TBL_DOG_BRAND(brand_code)
                            , constraint CK_DOG_PRODUCT_SAMPLE check ( product_sample in ('0','1'))
                            , constraint CK_DOG_PRODUCT_TEXTURE check ( product_texture in ('1','2'))
                            , constraint CK_DOG_PRODUCT_STATUS check ( status in ('0','1'))
                            );

create sequence seq_dog_product
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 

-- 관심상품 테이블
create table tbl_dog_interest ( interest_seq number
                                , fk_product_code number not null           -- fk 상품코드
                                , fk_email  varchar2(300) not null          -- fk 이메일 
                                , registerday date default sysdate          -- 등록일
                                , status char(1) default '1'                -- 삭제 여부 ( 0: 삭제 , 1: 삭제안함 )
                                , constraint PK_DOG_INTEREST_SEQ primary key(interest_seq)
                                , constraint FK_DOG_INTEREST_PROD foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                                , constraint FK_DOG_INTEREST_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                                , constraint CK_DOG_INTEREST_STATUS check ( status in ('0','1'))
                                );

create sequence seq_dog_interest
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 상품 사진 테이블
create table tbl_dog_prodphoto ( prodphoto_seq number               -- 시퀀스
                                , fk_product_code number not null   -- fk 상품코드
                                , photoname varchar2(300)           -- 상품 이미지명
                                , status char(1) default '1'        -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                                , constraint PK_DOG_PRODPHOTO_SEQ primary key(prodphoto_seq)
                                , constraint FK_DOG_PRODPHOTO_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                                , constraint CK_DOG_PRODPHOTO_STATUS check ( status in ('0','1'))
                                );

create sequence seq_dog_prodphoto
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 장바구니 테이블
create table tbl_dog_basket ( basket_seq number                         -- 시퀀스
                            , fk_product_code number not null           -- fk 상품코드
                            , fk_email  varchar2(300) not null          -- fk 이메일 
                            , quantity  number                          -- 수량
                            , status char(1) default '1'                -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                            , constraint PK_DOG_BASKET_SEQ primary key(basket_seq)
                            , constraint FK_DOG_BASKET_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                            , constraint FK_DOG_BASKET_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                            , constraint CK_DOG_BASKET_STATUS check ( status in ('0','1'))
                            );

create sequence seq_dog_basket
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 상품 브랜드 테이블
create table tbl_dog_brand ( brand_code number                      -- 브랜드 코드
                            , brand_name varchar2(80)               -- 브랜드명
                            , status char(1) default '1'            -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                            , constraint PK_DOG_BRAND_SEQ primary key(brand_code)
                            , constraint CK_DOG_BRAND_STATUS check ( status in ('0','1'))
                            );

create sequence seq_dog_brand
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- QNA 테이블
create table tbl_dog_qna ( board_num number                     -- 게시판 번호 ( 시퀀스 )
                        , fk_product_code number not null       -- fk 상품코드
                        , fk_email  varchar2(300) not null      -- fk 이메일 
                        , title varchar2(100)                   -- 글 제목
                        , password varchar2(20)                 -- 글 비밀번호
                        , photoname varchar2(300)               -- 사진 이름
                        , content varchar2(4000)                -- 글 내용
                        , registerday date default sysdate      -- 등록일
                        , replystatus char(1) default '1'       -- 답변 상태 ( 0: 답변 안됨 , 1: 답변 완료 )
                        , status char(1) default '1'            -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                        , constraint PK_DOG_QNA_SEQ primary key(board_num)
                        , constraint FK_DOG_QNA_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                        , constraint FK_DOG_QNA_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                        , constraint CK_DOG_QNA_REPLYSTATUS check ( replystatus in ('0','1'))
                        , constraint CK_DOG_QNA_STATUS check ( status in ('0','1'))
                        );

create sequence seq_dog_qna
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 주문 테이블 
create table tbl_dog_order ( order_num number                       -- 주문 번호
                            , fk_email  varchar2(300) not null      -- fk 이메일 
                            , order_day date default sysdate        -- 주문날짜
                            , order_deliverynum varchar2(80)        -- 송장번호
                            , order_status char(1)                  -- 주문상태 ( 0: 주문 취소 1: 입금완료 , 2: 배송준비중 , 3: 배송중 , 4: 배송완료 )
                            , order_freedeliv char(1)               -- 무료배송 여부 ( 0: 유료배송 , 1: 무료배송 )
                            , delivery  varchar2(1000)              -- 배송지
                            , delivery_msg varchar2(300)            -- 배송 메시지
                            , receiver varchar2(30)                 -- 수취인
                            , memo varchar2(300)                    -- 메모
                            , constraint PK_DOG_ORDER_SEQ primary key(order_num)
                            , constraint FK_DOG_ORDER_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                            , constraint CK_DOG_ORDER_STATUS check ( order_status in ('0','1','2','3','4'))
                            , constraint CK_DOG_ORDER_FREE check ( order_freedeliv in ('0','1'))
                            );

create sequence seq_dog_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 주문 상세 테이블
create table tbl_dog_orderdetail ( orderdetail_seq number               -- 주문 상세 넘버 ( 시퀀스 )
                                , fk_order_num number not null          -- fk 주문 번호
                                , fk_product_code number not null       -- fk 상품 번호
                                , quantity number                       -- 수량
                                , amountmoney number                    -- 금액
                                , constraint PK_DOG_ORDERDETAIL_SEQ primary key(orderdetail_seq)
                                , constraint FK_DOG_ORDERDETAIL_ORDER foreign key(fk_order_num) references TBL_DOG_ORDER(order_num)
                                , constraint FK_DOG_ORDERDETAIL_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                                );

create sequence seq_dog_orderdetail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 적립금 테이블
create table tbl_dog_reserve ( reserve_seq number                   -- 번호 ( 시퀀스)
                            , fk_order_num number                   -- fk 주문 번호
                            , fk_email  varchar2(300) not null      -- fk 이메일
                            , reserve_plus number                   -- 적립된 금액
                            , reserve_minus number                  -- 사용한 금액
                            , usedate date default sysdate          -- 사용 날짜
                            , constraint PK_DOG_RESERVE_SEQ primary key(reserve_seq)
                            , constraint FK_DOG_RESERVE_ORDER foreign key(fk_order_num) references TBL_DOG_ORDER(order_num)
                            , constraint FK_DOG_RESERVE_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                            ); 
                            
create sequence seq_dog_reserve
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;   
                            
-- 반품 테이블
create table tbl_dog_return ( return_num number                 -- 반품 번호
                        , fk_order_num number                   -- fk 주문 번호
                        , return_day date default sysdate       -- 반품날짜
                        , return_deliverynum varchar2(80)       -- 반품송장번호
                        , return_status char(1)                 -- 반품 상태 ( 1: 반송 준비중 , 2: 반송중 , 3: 반송 완료 4: 환불 완료 )
                        , constraint PK_DOG_RETURN_SEQ primary key(return_num)
                        , constraint FK_DOG_RETURN_ORDER foreign key(fk_order_num) references TBL_DOG_ORDER(order_num)
                        , constraint CK_DOG_RETURN_STATUS check ( return_status in ('1','2','3','4'))
                        );

create sequence seq_dog_return
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 


-- 반품 상세내역 테이블
create table tbl_dog_returndetail ( returndetail_seq number             -- 시퀀스 
                                , fk_return_num number                  -- fk 반품 번호
                                , fk_product_code number not null       -- fk 상품 번호
                                , quantity number                       -- 반품 수량
                                , amount number                         -- 금액
                                , constraint PK_DOG_RETURNDET_SEQ primary key(returndetail_seq)
                                , constraint FK_DOG_RETURNDET_RETURN foreign key(fk_return_num) references tbl_dog_return(return_num)
                                , constraint FK_DOG_RETURNDET_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                                );
                            
create sequence seq_dog_returndetail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;   

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- SQL 문 

select * from user_all_tables where lower(table_name) like '%tbl_dog%'; 

--------적립금테이블 컬럼추가
ALTER TABLE TBL_DOG_RESERVE
ADD (CONTENT VARCHAR2(50));

 select member_seq, user_id, user_name, user_birthday, user_gender, 
 postcode, addr1, addr2, phone, email, user_sns, alert_email, alert_sms 
 , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') as registerday 
 , to_char(pwchangeday, 'yyyy-mm-dd hh24:mi:ss') as pwchangeday 
 , to_char(lastloginday, 'yyyy-mm-dd hh24:mi:ss') as lastloginday 
 , trunc( months_between(sysdate, pwchangeday) ) AS pwdchangegap 
 , trunc( months_between(sysdate, lastloginday) ) AS lastlogindategap 
 from tbl_dog_member;


-------------적립금 내역
select usedate, content, NVL(reserve_plus,reserve_minus) as reserve
from TBL_DOG_RESERVE
where fk_email = '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='
order by usedate desc;


-------------적립금 총액
select sum(NVL(reserve_plus,0)+NVL(reserve_minus,0)) as totalReserve
from TBL_DOG_RESERVE
where fk_email = '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=';

--------------테스트 데이터 생성
create or replace procedure pcd_TBL_DOG_RESERVE
(p_plus IN number
,p_content  IN varchar2 )
is begin
    for i in 1..100 loop
        insert into TBL_DOG_RESERVE(reserve_seq, fk_email, reserve_plus, usedate, content) 
	values(SEQ_DOG_RESERVE.nextval, '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=', p_plus , sysdate, p_content||i);
    end loop;
end pcd_TBL_DOG_RESERVE;

--------------프로시저 실행
exec pcd_TBL_DOG_RESERVE('100','구매 적립');


----------------페이징 처리용 페이지번호(적립금)
select RNO, usedate, content, reserve
from
(
select rownum as RNO,  usedate, content, reserve
from
(
select usedate, content, NVL(reserve_plus,reserve_minus) as reserve
from TBL_DOG_RESERVE
where fk_email = '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='
order by usedate desc
)V
)T
where T.RNO between 11and 20;

----------------전체 페이지 갯수 구하기(적립금)
select ceil(count(*)/10) as totalPage
from TBL_DOG_RESERVE
where fk_email = '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='

-----------------------2019.12.11 작업
select * from TBL_DOG_ORDER
select * from TBL_DOG_ORDERDETAIL
desc TBL_DOG_ORDERDETAIL
desc TBL_DOG_ORDER

insert into TBL_DOG_ORDER(order_num, fk_email, order_day, order_deliverynum, ORDER_STATUS, DELIVERY, DELIVERY_MSG, RECEIVER, MEMO)
values(DOG201912110001, '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=', sysdate, 'test1234', '0', 

select * from TBL_DOG_BASKET;

select * from TBL_DOG_MEMBER;

--------회원ID,PW 확인
select * 
from TBL_DOG_MEMBER 
where user_id='testhm' and user_pw='85189c34f5df35582de4ea2208bbda6efc5cde8e0b3c2fc6422a64f4d657bd74';

select * from TBL_DOG_PET

desc TBL_DOG_PET
desc TBL_DOG_ORDER
desc TBL_DOG_ORDERDETAIL
desc TBL_DOG_MEMBER ;
 

select * 
from TBL_DOG_MEMBER 
where email='YELKaOTBAkryoMCHRZ7nwQ==';

update TBL_DOG_MEMBER set user_pw='85189c34f5df35582de4ea2208bbda6efc5cde8e0b3c2fc6422a64f4d657bd74!', postcode='123456', addr1='', addr2='', phone='010-119', ALERT_EMAIL='1', ALERT_SMS='0', pwchangeday=sysdate
where email='15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=';

select * from TBL_DOG_PET
insert into TBL_DOG_PET(pet_seq, fk_email, pet_name, pet_birthday, pet_type, pet_neutral, pet_weight, pet_gender, pet_photo, status)
values(SEQ_DOG_PET.nextval, '15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc=', '꾸릉이동생', '20191125', '다람쥐', '0', '2', '2', 'mypet.png','1' );


select count(*) as CNT 
from TBL_DOG_PET
where status='1' and fk_email='15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='

select pet_seq, fk_email, pet_name, pet_birthday, pet_type, pet_neutral, pet_weight, pet_gender, pet_photo
from TBL_DOG_PET
where status='1' and fk_email='15NBRYJSlj7nQV7vnpxTKlWsSS3yNCwitHg6iyeZ/Hc='

