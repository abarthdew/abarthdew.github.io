---
title: 3. JSP with Eclipse
date: 2022-09-01
categories: [Back, JSP]
tags: [Back, JSP]
---

## 45. JSP  MVC model1

- jsp를 잘못 만들면 코드 블럭이 복잡해지는 문제 해결을 위해 고안

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/135.png)

- 흩어져 있는 코드 블럭을 한 곳에 모으기

![입력코드, 출력코드 분리](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/136.png)
_입력코드, 출력코드 분리_

![출력할 데이터를 변수화해 제어](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/137.png)
_출력할 데이터를 변수화해 제어_

→ 코드블럭을 최대한 한 곳에 넣고, model 변수에 결과만 넣은 방식

### MVC model1

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/138.png)

- controller : 순수 자바 코드
- view : 주로 html 코드
- model : 출력 데이터

## 46. JSP MVC model1 VS model2

![GIF.gif](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/139.gif)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/140.png)

- Controller는 서블릿
- View는 jsp 형태로 만듬

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/141.png)

- Controller 단에서 View를 연결하기 위해 포워딩하는 방법이 사용됨.
- View는 jsp로 되어있긴 하지만 서블릿. Controller 도 서블릿.
- 서블릿에서 서블릿으로 이전되며 흐름을 이어받아 코드를 진행하는 데 사용되는 게 포워딩.

![GIF.gif](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/142.gif)

- 수가 추가될 때마다 Controller는 Dispatcher를 이용해 포워딩함.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/143.png)

- 하지만 각각의 Controller 마다 가지고 있는 Dispatcher 기능이 비효율적이기 때문에, Dispatcher는 하나만 두고, Controller를 전담하는 것을 따로 만듬.
- 실질적으로 Servlet은 하나만 만들고, 일반적인 업무 로직은 별도의 POJO 클래스로, 즉 서블릿 클래스가 아닌 일반 클래스로 만듬.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/144.png)

- 사용자 요청이 들어오면 Dispatcher가 적절한 Controller를 찾아 수행하도록 함.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/145.png)

- Controller는 로직에 해당하는 View를 호출해서 Dispatcher에게 관련 내용을 알림.
- Dispatcher는 그 내용을 가지고 응답.

### 코드

- 이제 jsp는 껍데기고, java 파일이 실행되어야 하기 때문에 java에서 서버 재실행

```jsx
package com.newlecture.web;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvc2")
public class Nana extends HttpServlet{
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int num = 0;
    String result = ""; // model(index.jsp의 result와   같음)
      String num_ = request.getParameter("num");
      if (num_ != null && !num_.equals("")) {
        num = Integer.parseInt(num_);
      }
      result = num%2 == 0 ? "짝수" : "홀수";
      
    // <서버상 저장소>
    // page context : 페이지 내에서 혼자 사용할 수 있는   저장소.
    // request : 둘 사이의 포워드 관계에서 사용할 수 있는   저장소.
    // session : 현재 세션에서 공유되는 저장소.
    // page : 모든 세션, 모든 페이지에서 공유되는 저장소.
    // <클라이언트상 저장소>
    // cookie : 클라이언트에 저장하는 저장소.
    request.setAttribute("result", result); // request에   담은 값을 index.jsp에서 꺼내쓸 수 있음.
      
    // index.jsp와 이 클래스 둘 사이를 연결해줄 수 있는   도구가 필요.
    // result를 index.jsp로 전달하기 위해, 둘 사이의   연결고리가 되는 저장소가 필요.
    // 이 클래스에서 index.jsp로 전이하기 위해 포워딩이라는   저장소를 사용.
    // 1. 포워딩(foward) : 현재 작업한 내용을 이어갈 수   있도록 무언가를 공유. 
    // 2. 리다이렉트(redirect) : 현재 작업과 상관없는 전혀   새로운 요청을 할 때 사용.
    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp"); // 같은 디렉토리에   있기 때문에 이렇게 표기
    dispatcher.forward(request, response); // req, res를   index.jsp에 공유할 수 있음.
  }
}
```

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/146.png)

### MVC1 → MVC2 비교 키포인트

- 코드가 완전히 물리적으로 분리
- Controller는 서블릿(java), View는 jsp(view)

## 47. EL(Expression Language)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/147.png)

- Controller에 쓴 코드를 view에서 써야 하는데, view에서는 가급적 자바 코드를 쓰는 것을 권장하지 않음.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/148.png)

- 그래서 JSP에 EL이라는 방법이 추가되어, 쉽게 값을 꺼낼 수 있음.

![list 값을 el로 쉽게 꺼낸 예](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/149.png)
_list 값을 el로 쉽게 꺼낸 예_

## 48. EL의 데이터 저장소

- 47강 cnt 키워드는 request 저장소에 담겨 있음

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/150.png)

- 서버 상에서 사용할 수 있는 4가지 저장소 객체

![4가지 객체를 이용해 데이터를 저장하거나 꺼냄](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/151.png)
_4가지 객체를 이용해 데이터를 저장하거나 꺼냄_

- jsp 내에서 만들어진 객체 중 `pageContext` : 페이지 내에서 사용가능한 서블릿 객체들(request, response, session, application)을 모아놓은 객체.
- pageContext는 페이지 단위로 데이터 저장소 역할이 필요하면, request 처럼 저장소 역할도 할 수 있음.

```jsx
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
  pageContext.setAttribute("aa", "hello");
  // 페이지 객체 : 페이지 내에서 저장소로 쓸 수 있는 객체
  // 페이지 객체에 담는 내용을 el을 통해 쓸 수 있음
%>
<body>
  ${aa }
</body>
</html>

<!--  http://localhost:8080/pageContext -->
```

- 즉, EL을 이용해 뽑아낼 수 있는 객체는
    1. 페이지 객체
    2. request 객체
    3. session 객체
    4. application 객체임.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/152.png)

- 하지만 4개 종류 저장소에 같은 이름으로 저장된 변수를 불러오게 된다면? ⇒ el은 4개 저장소를 전부 뒤져서, 우선순위가 높은 것부터 가져옴.
    - 우선순위
        1. page
        2. request
        3. session
        4. application
- 특정 저장소에서 꺼내오고 싶으면, scope 키워드를 붙여 사용

![~scope는 객체가 아니라 한정사임](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/153.png)
_~scope는 객체가 아니라 한정사임_

```jsx
<%
  pageContext.setAttribute("aa", "hello");
  // 페이지 객체 : 페이지 내에서 저장소로 쓸 수 있는 객체
  // 페이지 객체에 담는 내용을 el을 통해 쓸 수 있음
%>
<%
  pageContext.setAttribute("result", "hi");
%>
<body>
  ${aa }<br>
  ${result } // 자바 단의 result와 이 페이지 상단의 코드블럭 result 변수이름이 동일하기 때문에, page객체가 우선<br>
  ${requestScope.result } // 한정사를 붙임으로서 request 객체를 찾음
</body>
</html>
```

- EL은 4대 저장소 외에도 사용할 수 있는 저장소가 있음

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/154.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/155.png)

```jsx
// 4대 저장소 이외 저장소 <br>
  ${param.num} // 자바단에 전달하는 num 변수 <br>
  ${header.accept } // 사용자가 request할때 보내는 헤더 정보 <br>
<!-- http://localhost:8080/pageContext?num=5 -->
```

- 가져올 수 있는 request 정보들

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/156.png){: width="450"}

- pageContext 내 객체를 얻을 때는 getter로 씀.
    1. 코드 블럭으로 표기할때 : getter 함수 사용.
    2. EL로 표기할 때 : EL은 속성을 호출하기만 하지, 함수를 호출할 수는 없기 때문에 이런식으로 사용. (getRequest() → request, getMethod() → method)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/157.png)

## 49. EL 연산자

- 종류
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/158.png){: width="350"}
    

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/159.png)

## 51. JSP를 이용해서 자바 웹 프로그램 만들기 시작

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/160.png)

- `<%%>` : 일반
- `<%=%>` : 출력을 위한 코드블럭
- `<%!%>` : 멤버 변수, 멤버 함수 정의하기 위한 코드블럭
- `<%@%>` : 지시를 하기 위한 코드 블럭

## 50. 수업용 프로젝트 준비하기

- https://newlecture.com/customer/notice/9

1. /notice/list.html → list.jsp
    - list.jsp - properties : 인코딩 설정
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/161.png)
    
    - 실행 후 출력할 때도 한글로 나와야 하기 때문에 설정
    
    ```jsx
    <%@ page language="java" contentType="text/html; charset=EUC-KR"
      pageEncoding="UTF-8"%>
    // list.jsp에 붙여넣기
    ```

2. jdbc 설정

    ```jsx
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.Connection"%> // ctrl + space로 import
    <%
    String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
    String sql = "SELECT * FROM NOTICE";
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(url, "newlec", "skdine");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);
    %>
    <%
    rs.close();
    st.close();
    con.close();
    %>
    ```

    ```jsx
    CREATE USER NEWLEC IDENTIFIED BY 1234;
    GRANT CONNECT, RESOURCE, DBA TO NEWLEC;

    create table notice (
    id number,
    title varchar(100),
    write_id varchar(50),
    content varchar(4000),
    regdate date,
    hit number,
    files varchar(4000)
    );
    INSERT INTO NOTICE VALUES (6, 'TITLE', 'WRITE_ID', 'CONTENT', SYSDATE, 6, 'FILES');
    SELECT * FROM NOTICE;
    ```

3. 오라클 드라이버 lib 폴더에 넣기
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/162.png){: width="350"}
    
    - 이 예시에선 프로젝트 - build path 에서 order and expert에 ojdbc를 넣으면 안 됨.
    - jar 파일은 컴파일 할 때, 실행할 때 필요하기 때문.
    - web 프로젝트에선 `50_project`에서 컴파일이 되는 것이 아니라, `50_project`에서 만들어진 결과물이 tomcat으로 배포되어 실행되기 때문. → 라이브러리의 build path가 달라짐.
    - 또한, tomcat을 서버로 옮길 수 있기 때문에 서버 환경에서 jar 파일 위치가 달라질 수 있음.
    - web 개발 환경에서는 라이브러리가 배포되어 실행되어야 하기 때문에 같이 가져가야 함. 때문에, 단순히 'jar파일이 어디 있다' 라이브러리 경로를 지정하는 build path 가 아니라, 라이브러리 자체를 같이 배포할 수 있도록 `50_project` 프로젝트 내에 포함시켜야 함.

4. 상세 페이지 구현

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/163.png)

```html
<td class="title indent text-align-left">
  <a href="detail.jsp?id=<%=rs.getInt("ID")%>"><%= rs.getString("TITLE") %></a>
</td>
```

- detail.html → detail.jsp

```java
<%
  int id = Integer.parseInt(request.getParameter("id"));
  String url = "jdbc:oracle:thin:@localhost:1521/xe";
  String sql = "SELECT * FROM NOTICE WHERE ID = ?";
  
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection(url, "newlec", "1234");
  PreparedStatement st = con.prepareStatement(sql); // 쿼리 ?를 채울 수 있음, 미리 준비한 sql 변수(쿼리)를 추가
  st.setInt(1, id); // 1번째 ?에 id를 넣겠다
  ResultSet rs = st.executeQuery(); // 모든 준비 후 실행만 하면 됨
%>
```

- notice/list.jsp 에서 재실행

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/164.png)

## 54. 자세한 페이지 MVC model1으로 변경하기

- 이전 `50_project`는 스파게티 코드로 되어있음

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/165.png)

- 이렇게 작성되어 있는 코드를 이렇게 바꿀 예정(자바 코드 따로, html 코드 따로)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/166.png)

- html 부분에는 출력할 수 있는 최소한의 변수 `code/title/writer/...` 만 둠

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/167.png)

- detail.jsp : 코드블럭 전부 위로 ㄱ

```java
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  String url = "jdbc:oracle:thin:@localhost:1521/xe";
  String sql = "SELECT * FROM NOTICE WHERE ID = ?";
  
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection(url, "newlec", "1234");
  PreparedStatement st = con.prepareStatement(sql); // 쿼리 ?를 채울 수 있음, 미리 준비한 sql 변수(쿼리)를 추가
  st.setInt(1, id); // 1번째 ?에 id를 넣겠다
  ResultSet rs = st.executeQuery(); // 모든 준비 후 실행만 하면 됨
  rs.next(); // 호출 시 ResultSet이 사용하는 공간에 레코드 하나가 적재됨
  
  String title = rs.getString("TITLE");
  String writer = rs.getString("WRITE_ID");
  int hit = rs.getInt("HIT");
  Date regdate = rs.getDate("REGDATE");
  String files = rs.getString("FILES");
  String content = rs.getString("CONTENT");
  
  rs.close();
  st.close();
  con.close();
%>
```

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/168.png)

## 55. MVC model2 방식으로 변경하기

### 🔰 이전 `54_project-model1` 방식

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/169.png)

- 사용되는 모델이 지역적으로 view 단에서 사용(m,v,c가 하나의 함수로 작용)

### 🔰 `55_project-model2` MVC2 방식은 M, V, C를 물리적으로 나눔

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/170.png)

- 여기서 model은 지역변수의 형태로서 사용할 수가 없게 됨.
- servlet과 jsp을 이어주고, 값을 넘길 수 있는 공유 방법이 필요하게 됨.
- 물리적으로 나누는 것의 장점 :
    - 개별적 유지관리 가증
    - servlet, jsp 재사용 가능
    - jsp는 요청 - servlet 코드로 만들어지는 과정 - 컴파일 - 로드 과정을 거침. 때문에 C가 jsp단에 있을 때 덩치가 너무 커져서 실행 성능에 영향을 줄 수 있음. → C를 나눠서 일부라도 미리 컴파일 해놓고, 나중에 로드 - 실행할 수 있음.

### 🔰 Controller에서 Model을 만들어 View 단에 전달하기 위한 상태 저장 방법

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/171.png)

- model을 둘 사이 서블릿이 공유할 수 있는 방법 : pageContext 제외, 세가지 - 범위가 상대적으로 좁은 `request`가 가장 적합.

### 🔰 코드

- java

```java
package com.newlecture.web.controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    int id = Integer.parseInt(request.getParameter("id"));
    String url = "jdbc:oracle:thin:@localhost:1521/xe";
    String sql = "SELECT * FROM NOTICE WHERE ID = ?";
    
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection(url, "newlec", "1234");
      PreparedStatement st = con.prepareStatement(sql); // 쿼리 ?를 채울 수 있음, 미리 준비한 sql 변수(쿼리)를 추가
      st.setInt(1, id); // 1번째 ?에 id를 넣겠다
      ResultSet rs = st.executeQuery(); // 모든 준비 후 실행만 하면 됨
      rs.next(); // 호출 시 ResultSet이 사용하는 공간에 레코드 하나가 적재됨
  
      String title = rs.getString("TITLE");
      String writer = rs.getString("WRITE_ID");
      int hit = rs.getInt("HIT");
      Date regdate = rs.getDate("REGDATE");
      String files = rs.getString("FILES");
      String content = rs.getString("CONTENT");
      
      rs.close();
      st.close();
      con.close();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
```

- list.jsp 수정

```html
<td class="title indent text-align-left"><a href="detail?id=<%=rs.getInt("ID")%>"><%= rs.getString("TITLE") %></a></td>
```

## 56. Model 데이터를 구조화하기

- 출력을 위해 사용된 데이터
- 개념적으로 말할 수 있는 데이터의 집합 : 엔티티(개체), 개념화된 데이터, 사용자형 자료형, 구조적 데이터(엔티티를 계층으로 만들었기 때문)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/172.png)

- 데이터를 낱개로 사용하게 되면 반복이 많아지고 구분이 어려움. → 낱개가 아닌 데이터 속성으로 묶어서 표현.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/173.png)

- id, title, writer등을 개별로 표현하지 않고, notice 객체에 한꺼번에 담아서 사용.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/174.png)

### 🔰 코드 - `56_project-notice`

- Notice 객체 생성
- 코드 - 생성자, getter, setter 추가

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/175.png)

- controller 에 추가

```java
Notice notice = new Notice(title, writer, hit, regdate, files, content);
request.setAttribute("notice", notice);
```

## 57. 목록 페이지도 MVC model2로 수정하기

```java
<%
  List<Notice> list = (List<Notice>)request.getAttribute("list");
  for (Notice n : list) {
    pageContext.setAttribute("n", n); // 꺼내온 list를 page 저장소에 담음
%>
<tr>
  <td>${n.id }</td>
  <td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
  <!--el 키워드는 저장소에 n이라는 값이 있어야 하고, 거기서 값을 꺼내오는 것 : 여기서 임시저장소로 적합한 게 page저장소 -->
  <td>${n.writer }</td>
  <td>${n.regdate }</td>
  <td>${n.hit }</td>
</tr>
<%
  }
%>
```

## 58. view 페이지 은닉하기

### 🔰 코드 : `58_view`

- WEB-INF
    - 라이브러리, 설정, 코드파일, 뷰 페이지 등 외부에서 서비스되지 않는 파일들을 저장.
    - notice, member, admin, student 폴더를 /WEB-INF/view 폴더로 이동
- `NoticeListController` 코드를 수정, 실행하면 정상 작동.

```java
@WebServlet("/notice/list")
......
request.getRequestDispatcher("/WEB-INF/view/notice/list.jsp").forward(request, response);
```

- 그러나, `list.jsp` 파일을 실행하면 페이지를 찾을 수 없다는 404 에러가 남. (서버에서 찾을 수 없거나, 제공되지 않음)
- 즉, WEB-INF 안의 루트는 외부에서 요청할 수 없는 디렉토리.
- jsp 파일(뷰 페이지)를 WEB-INF 폴더 안에 저장하면 은닉 가능.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/176.png)

- 참고 : https://jg-han.tistory.com/15

## 59. view에서 흐름 제어를 위한 자바 코드 블록 제거하기(list.jsp 에서 반복문 제거하기)

- 뷰 단에 남아있는 코드블럭 없애기

```java
<%
  List<Notice> list = (List<Notice>)request.getAttribute("list");
  for (Notice n : list) {
    pageContext.setAttribute("n", n); // 꺼내온 list를 page 저장소에 담음
%>
<tr>
  <td>${n.id }</td>
  <td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
  <!--el 키워드는 저장소에 n이라는 값이 있어야 하고, 거기서 값을 꺼내오는 것 : 여기서 임시저장소로 적합한 게 page저장소 -->
  <td>${n.writer }</td>
  <td>${n.regdate }</td>
  <td>${n.hit }</td>
</tr>
<%
  }
%>
```

- 자바 코드를 대신할 수 있는 무언가가 필요하게 됨 : `태그`

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/177.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/178.png)

1. 태그를 사용하기 위해 JSTL jar 파일 다운로드 : https://mvnrepository.com/artifact/javax.servlet/jstl/1.2
2. /WEB-INF/lib 폴더에 jar 파일 옮기기
3. list.jsp에 해당 설정 추가

    ```java
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    ```

    - 접두사 c를 찍어보면 사용 가능한 태그가 보임.

4. jstl 태그로 반복문 만들기

    ```java
    <!-- n이라는 키워드로 list안의 값을 사용할 수 있게 됨 -->
    <!-- 저장소에서 값을 꺼내는 것은 el이, 그 값을 이용할 수 있게 page 저장소에 담아주는 작업을 var="n" -->
    <c:forEach var="n" items="${list}">
    <tr>
        <td>${n.id }</td>
        <td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
        <td>${n.writer }</td>
        <td>${n.regdate }</td>
        <td>${n.hit }</td>
    </tr>
    </c:forEach>
    ```

    - 위 코드는 아래 코드와 같음

    ```java
    <%
    List<Notice> list = (List<Notice>)request.getAttribute("list");
    for (Notice n : list) {
        pageContext.setAttribute("n", n); // 꺼내온 list를 page 저장소에 담음
    %>
    ```

## 60. Tag 라이브러리와 JSTL

- JSTL이 제공하는 다섯가지 태그 라이브러리

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/179.png)

- CORE : 가장 기본적인 제어의 행위 담당하는 태그 라이브러리
- Formating : 숫자, 날짜, 화폐 등 포맷 기능하는 태그 라이브러리
- Functions : el를 이용해 데이터를 추출할 때, 그 결과를 문자열 조작할 수 있는 함수를 묶어놓은 태그 라이브러리
- SQL, XML : 사용하지 않는 추세(뷰 단에 코드를 쓰는 mvc 방식)

### 🔰 태그 라이브러리 심화

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/180.png)

- 접두사를 사용하지 않았을 때 → jsp에서 이해할 수 없음. 반드시 접두사를 작성해야 함.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/181.png)

- for태그를 만든다고 할 때, 이를 식별하기 위해 특정 uri를 붙여 줌.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/182.png)

- 때문에, uri는 forEach라는 태그명에 대한 식별자고, 식별자를 대신하는 prefix를 c로 정의.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/183.png)

- 각각의 행위에서 발생하는 이벤트에 대한 태그를 정의할 수 있음.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/184.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/185.png)

## 61. 중간 정리

- 서블릿 : 자바 웹 서버 프로그램
- MVC : 코드블록을 한 쪽에 몰아넣음

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/186.png)

## 62.  forEach의 속성 사용하기

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/187.png)

- varStatus

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/188.png)

```html
<!-- forEach에 대한 상태값 설정 : varStatus="(상태값변수)" -->
<c:forEach var="n" items="${list}" begin="1" end="3" varStatus="st">
  <tr>
    <td>${st.index} / ${n.id }</td>
    <td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
    <td>${n.writer }</td>
    <td>${n.regdate }</td>
    <td>${n.hit }</td>
  </tr>
</c:forEach>
```

- 결과 : begin="1" end="3"이기 때문에 1부터 나옴.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/189.png)

- begin, end를 지우면 다음과 같이 나옴

```html
<!-- forEach에 대한 상태값 설정 : varStatus="(상태값변수)" -->
<c:forEach var="n" items="${list}" varStatus="st">
  <tr>
    <td>${st.index} / ${n.id }</td>
    <td class="title indent text-align-left"><a href="detail?id=${n.id }">${n.title }</a></td>
    <td>${n.writer }</td>
    <td>${n.regdate }</td>
    <td>${n.hit }</td>
  </tr>
</c:forEach>
```

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/190.png)

## 63. JSTL로 pager 번호 만들기

- 5번씩 반복한다고 할 때, p에 대한 배열은 다음과 같음

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/191.png)

- 5번 반복한다고 할 때, 첫번째 숫자를 기준으로 현제 페이지번호(p)를 구하도록 함

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/192.png)

- p의 나머지(p%5)를 구해 계산 → 19 % 5 - 1 = 4 - 1 = 3 (첫번째 번호 16과 19 사이의 거리)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/193.png)

### 🔰 `63_pager` 코드

```html
<!-- 임시변수 생성 -->
<c:set var="page" value="${(param.p == null) ? 1 : param.p }" /> <!-- el을 통해 param 변수를 사용할 수 있음 -->
<c:set var="startNum" value="${page-(page-1)%5 }" /> <!-- 여기서 page변수는 위에서 만든 것 -->

<ul class="-list- center">
<c:forEach var="i" begin="0" end="4">
  <!-- <li><a class="-text- orange bold" href="?p=${i+1 }&t=&q=" >${i+1 }</a></li> -->
  <li><a class="-text- orange bold" href="?p=${startNum+i }&t=&q=" >${startNum+i }</a></li>
</c:forEach>
```

- http://localhost:8888/notice/list?p=6
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/194.png)
    
- http://localhost:8888/notice/list?p=28
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/195.png)

## 64. JSTL: if문으로 pager 이전/다음 번호 만들기

- 다음 번호
    
    ```html
    <!-- 임시변수 생성 -->
    <c:set var="page" value="${(param.p == null) ? 1 : param.p }" /> <!-- el을 통해 param 변수를 사용할 수 있음 -->
    <c:set var="startNum" value="${page-(page-1)%5 }" /> <!-- 여기서 page변수는 위에서 만든 것 -->
    <c:set var="lastNum" value="23" /> <!-- 마지막 페이지 번호를 인위적으로 만듬 -->
    
    <c:if test="${(startNum+5) < lastNum }">
      <a href="?p=${startNum+5 }&t=&q=" class="btn btn-next">다음</a>
    </c:if>
    <c:if test="${(startNum+5) >= lastNum }">
      <span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
    </c:if>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/196.png)
    
- 이전 번호
    
    ```html
    <!-- 임시변수 생성 -->
    <c:set var="page" value="${(param.p == null) ? 1 : param.p }" /> <!-- el을 통해 param 변수를 사용할 수 있음 -->
    <c:set var="startNum" value="${page-(page-1)%5 }" /> <!-- 여기서 page변수는 위에서 만든 것 -->
    <c:set var="lastNum" value="23" /> <!-- 마지막 페이지 번호를 인위적으로 만듬 -->
        
    <div>
      <c:if test="${startNum-1 > 0 }">
        <a href="?p=${startNum-1 }&t=&q=" span class="btn btn-prev">이전</span>
      </c:if>
      <c:if test="${startNum-1 <= 0 }">
        <span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
      </c:if>
    </div>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/197.png)
    

## 65. forTokens로 첨부파일 목록 출력하기

- 컬럼 값

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/198.png)

- forTokens 사용

```html
<th>첨부파일</th>
<td colspan="3">
  <c:forTokens var="fileName" items="${notice.files }" delims=",">
    <li><a href="${fileName }">${fileName }</a></li>
  </c:forTokens>
</td>
```

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/199.png)

- 구분자 조건걸기
    
    ```html
    <tr>
      <th>첨부파일</th>
      <td colspan="3">
        <c:forTokens var="fileName" items="${notice.files }" delims="," varStatus="st">
          <a href="${fileName }">${fileName }</a>
          <c:if test="${!st.last }">/</c:if> <!-- 마지막 인자는 / 빼기 -->
        </c:forTokens>
      </td>
    </tr>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/200.png)
    

## 66. format태그로 날짜 형식 변경하기

- 작성일 날짜는 jsp에서 임의로 출력된 형식임. (db에 적재된 값의 형태와 다름)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/201.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/202.png)

- 코드
    
    ```html
    <!-- 날짜 관련 태그 추가 -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <td><fmt:formatDate pattern="YYYY-MM-DD hh:mm:ss" value="${n.regdate }"></fmt:formatDate></td>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/203.png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/204.png)
    

## 65. 숫자 출력 형식 지정하기 JSTL:formatNumber

- 코드
    
    ```html
    <!-- 기본값 -->
    <fmt:formatNumber value="${ notice.hit }" /><br/>
    <!-- 패턴 -->
    <fmt:formatNumber type="number" pattern="##,####$" value="${ notice.hit }" />
    ```
    
    ![캡처.PNG](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/205.png)
    

## 68. EL에서 함수 이용하기 JSTL:functions

- 출력만 대문자로 하고 싶을 때
    
    ```html
    <!-- function 태그 추가 : el안쪽에서 함수를 호출하는 패키지 형태로 사용 -->
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <c:forTokens var="fileName" items="${notice.files }" delims="," varStatus="st">
      <!-- 대문자로 출력 -->
      <a href="${fileName }">${fn:toUpperCase(fileName) }</a>
      <c:if test="${!st.last }">/</c:if>
    </c:forTokens>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/206.png)
    
- style 설정
    
    ```html
    <c:forTokens var="fileName" items="${notice.files }" delims="," varStatus="st">
      <!-- zip인 경우만 style 설정 -->
      <c:set var="style" value=""/>
      <c:if test="${fn:endsWith(fileName, '.zip') }">
        <c:set var="style" value="font-weight:bold; color:red;"/>
      </c:if>
      <!-- style 적용 -->
      <a href="${fileName }" style="${style}">${fileName }</a>
      <c:if test="${!st.last }">/</c:if>
    </c:forTokens>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/207.png)
    
- https://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/fn/tld-summary.html

## 69. 기업형으로 레이어를 나누는 이유와 설명

### 🔰 코드 분리를 위한 사전 설명

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/208.png)

- Servlet
    - 사용자의 응답을 처리, 출력에 대한 내용을 .jsp에 위임, 출력 주도(controller)
    - DB에 직접 계정이 연결되어 쿼리를 만들고 그 결과를 .jsp에 보냄.
    - 사용자 입출력 처리, 중간 업무 처리 담당.

### 🔰 서비스 종류와 규모가 늘어난다면?

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/209.png)

- 기업형에서는 서비스를 분리해서 만듬.
- 업무 서비스 : 사용자가 요청하는 단위; 결재 시스템과 같은 중요한 서비스.
- Servlet은 업무 요청이 오면 `업무 서비스`에 그것을 전달하고 결과를 받아 .jsp 문서를 만들어줌.
- 재사용 가능.
- ex)계좌이체 로직 : a 계좌의 금액은 +, b 계좌의 금액은 -를 할 때, 두 과정을 하나로 묶어 처리해야 함. → 한쪽만 실행되는 일이 없어야 하므로 트랜잭션 필요.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/210.png)

- 데이터 서비스(DAO) 계층
    - 업무 서비스에서는 자바만 이용하고 싶을 때.
    - 업무 서비스에서 데이터 소스가 달라지는 것을 신경쓰고 싶지 않을 때.
    - 데이터 서비스를 책임지고, 데이터 소스를 숨기는 기능을 담당.

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/211.png)

- `데이터 서비스`에서는 업무 서비스에 entity(구조화된 데이터)라는 데이터 객체를 자바 형태로 제공.
- `업무 서비스`에서는 처리한 결과를 Servlet(Controller)에 Model 형태로 제공.
- `Servlet(Controller)`는 업무 서비스에서 받은 Model을 .jsp(View)에 심어 보냄.

> 💡 정리
> - `Servlet(controller)` : 입출력 담당
> - `업무 서비스` : 비지니스 로직
> - `DAO` : 실제 데이터 조작 레이어

### 🔰 그 외 형태

- 비지니스 로직(서비스 레이어)를 따로 빼지 않았을 때

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/212.png)

- 데이터 서비스(DAO)를 따로 빼지 않고 업무 서비스에서 SQL 처리할 때

![Untitled](https://raw.githubusercontent.com/abarthdew/jsp-with-eclipse/main/images/213.png)