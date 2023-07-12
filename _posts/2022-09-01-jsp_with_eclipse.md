---
title: 0. JSP for Eclipse - List
date: 2022-09-01
categories: [Back, JSP]
tags: [Back, JSP]
---

# [JSP for Eclipse - List](https://github.com/abarthdew/eclipse-jsp)

## 핵심정리

> 💡 서버상 저장소   
> - `page context` : 페이지 내에서 혼자 사용할 수 있는 저장소.
> - `request` : 둘 사이의 포워드 관계에서 사용할 수 있는 저장소.
> - `session` : 현재 세션에서 공유되는 저장소.
> - `page` : 모든 세션, 모든 페이지에서 공유되는 저장소.
> 클라이언트상 저장소
> - `cookie` : 클라이언트에 저장하는 저장소.

> 📌 그 외   
> - 404 : url이 없어 발생하는 오류(url 오류)
> - 405 : url은 있는데 그 안에 받을 수 있는 메서드가 없는 경우> (메서드 오류)
> - 403 : url, 메서드는 있는데 권한이 없는 경우(보안 오류)

## 개발 구조

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/1.png){: width="200" style="margin-right: 10px;" .left}

<br>
**← 개발을 하기 위한 워크스페이스**

- 실제 서버를 실행하면, 이 코드는 임시 서비스를 위한 배포 서버에 옮겨지게 됨
- `.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\86_admin` 여기

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/2.png){: width="300" .right}


<br>
- 파일 업로드를 위해 /webapp에 /upload폴더를 만듬 → `ctrl + f11` → 이클립스가 임시로 사용하는 배포 서버가 upload폴더를 만들어 사용

> ➡️ **98강, 102강의 upload 경로도 여기 생김**

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/3.png)

## 데이터베이스 정보
- 50_project

```sql
CREATE USER NEWLEC IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, DBA TO NEWLEC;

CREATE TABLE NOTICE (
    ID NUMBER,
    TITLE VARCHAR(100),
    WRITE_ID VARCHAR(50),
    CONTENT VARCHAR(4000),
    REGDATE DATE,
    HIT NUMBER,
    FILES VARCHAR(4000)
);
INSERT INTO NOTICE VALUES (6, 'TITLE', 'WRITE_ID', 'CONTENT', SYSDATE, 6, 'FILES');
SELECT * FROM NOTICE;
```

- 82_notice_view

```sql
CREATE TABLE COMMENT2 (
    ID NUMBER,
    CONTENT VARCHAR(4000),
    REGDATE DATE,
    WRITE_ID VARCHAR(50),
    NOTICE_ID NUMBER
);
INSERT INTO COMMENT2 VALUES (1, '내용1', SYSDATE, '사용자1', 1);
SELECT * FROM COMMENT2;
```

- 86_admin : notice 테이블에 대한 pub 컬럼 추가

![ex_screenshot](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/notice-pub.PNG)

```sql
CREATE VIEW NOTICE_VIEW
AS
SELECT COUNT(C.ID) CNT, N.* FROM NOTICE N LEFT JOIN COMMENT2 C
    on N.ID = C.NOTICE_ID
    GROUP BY N.ID, N.TITLE, N.WRITE_ID, N.CONTENT, N.REGDATE, N.HIT, N.FILES, N.PUB;
```

# Reference

- https://www.youtube.com/watch?v=qfGbsEdMaV4&list=PLq8wAnVUcTFVOtENMsujSgtv2TOsMy8zd&index=5
- https://newlecture.com/customer/notice/9
- notepub.com
- https://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/fn/tld-summary.html
- https://www.youtube.com/watch?v=qfGbsEdMaV4&list=PLq8wAnVUcTFVOtENMsujSgtv2TOsMy8zd&index=5
- https://www.notion.so/JSP-09499dda8867425696c660d7d65454a2