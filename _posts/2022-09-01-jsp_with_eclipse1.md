---
title: 1. JSP for Eclipse
date: 2022-09-01
categories: [Back, JSP]
tags: [Back, JSP]
---

## 2. 웹 서버 프로그램이란

- 예전에는 콘솔 프로그램, 윈도우 프로그램 처럼 프로그램 단위로 나뉨.
- 프로그램이 사용자가 사용하는 컴퓨터 속에 있음.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/4.png)

- 시간이 지나며 소비자, 생산자가 나뉨. 즉, 데이터는 생산자가, 이를 조회하는 것은 소비자가 할 필요성이 생김. 요청자와 제공자를 잇는 것이 인터넷.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/5.png)

- 과거에는 프로그램 구현 언어가 통일되어 있었지만, 클라이언트-서버가 모두 동시에 업데이트 되어야 하기 때문에 언어가 나뉨.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/6.png)

- 서버는 단일한 경우가 많지만, 클라이언트는 여럿이기 때문에 다른 프로그램에 영향을 줄 수 있으므로, 설치와 배포에 대한 부담을 줄이기 위해 웹을 사용하게 됨. (클라이언트가 서버에서 데이터를 요청할 때 소켓을 이용했었으나, 오늘날에는 웹을 사용하게 됨.)

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/7.png)

- 클라이언트에서 요청 → 웹서버에서 요청에 대한 응답(정적 데이터, 동적 데이터)을 찾아 클라이언트에 보내 줌.
- 서버-클라이언트 프로그램을 웹 프로그램에 얹음.
- 웹이라는 것은 기본적으로 페이지를 요청하고 페이지를 찾아서 제공하는 것.
- 서버에서 클라이언트로 보내는 문서를 브라우저를 통해 전달받기 때문에, 클라이언트는 따로 프로그램을 재설치할 필요가 없음. → 웹개발을 이용해 클라이언트와 서버를 나눈 이유.
- 웹개발로 들어서며 클라이언트 프로그램이 없어지며, cs 개발이 프론트, 백엔드 개발로 나뉘게 됨.

## 3. 웹 서버 프로그램과 Servlet

- 클라이언트에서 주소의 endpoint를 이용해서 문서를 요청
    
    → `웹서버`가 요청을 받아 `코드가 적힌 문서를 찾음`
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/8.png)
    
    → 코드를 클라이언트에게 돌려주기 전에 이 코드를 이를 실행할 수 있는 추가적인 환경이 필요함(WAS)
    
    ![동그라미가 포함된 파란 육면체가 WAS](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/9.png)
    
    동그라미가 포함된 파란 육면체가 WAS
    
    → `WAS`는 이 `코드를 실행해서, DB에 접근해 데이터를 추출`함
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/10.png)
    
    → 실행된 결과에 대한 데이터를 클라이언트 웹 브라우저로 보냄.
    

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/11.png)

> 💡 서버 어플리케이션 : 동적으로 문서를 만들기 위한 코드
> - 웹 서버 : 코드를 찾고,
> - WAS : 그 코드를 실행할 수 있게 해 주는 환경

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/12.png)

- 사용자가 요청하는 코드는 그때그때 다르며, 각각 요청에 의해 실행 후 종료됨.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/13.png)

- let이 '조각'이란 뜻이므로 이 하나하나의 파편화된 코드를 일컬어 'Servlet'이라고 하는 듯함.

## 4. 톰캣9 설치하기

- TOMCAT 9 설치
- 압축해제 후 C:\Users\auswo\eclipse\apache-tomcat-9.0.54\bin\startup.bat 배치파일 실행
- JAVA_HOME 환경변수가 올바르게 설정되어 있어야 정상적으로 뜸
- 실행 후 [http://localhost:8080/로](http://localhost:8080/%EB%A1%9C) 접속하면 톰캣 화면이 뜸

## 5. 웹문서 추가해보기

- C:\Users\auswo\eclipse\apache-tomcat-9.0.54\webapps\ROOT에 hello.txt 추가
- [http://localhost:8080/와](http://localhost:8080/%EC%99%80) [http://localhost:8080/index.jsp는](http://localhost:8080/index.jsp%EB%8A%94) 같음(index.jsp = 기본 디렉토리)
- [http://localhost:8080/hello.txt에](http://localhost:8080/hello.txt%EC%97%90) 접속하면 hello.txt가 뜸

## 6. Context 사이트 추가하기

- 한 서비스처럼 보이지만, 디렉토리를 나누어 서비스하는 것.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/14.png)

- C:\Users\auswo\eclipse\apache-tomcat-9.0.54\webapps\ROOT에 context 폴더 생성, 그 안에 news.txt 생성
- http://localhost:8080/context/news.txt에 접속하면 news.txt에 대한 내용을 볼 수 있음.

## 6-2.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/15.png)

- C:\Users\auswo\eclipse\apache-tomcat-9.0.54\webapps\context로 context파일 이동, 그 안에 news.txt 파일 생성
- C:\Users\auswo\eclipse\apache-tomcat-9.0.54\conf\server.xml 파일 수정

```html
<Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">
// 추가
<Context path="it" docBase="C:\Users\auswo\eclipse\apache-tomcat-9.0.54\webapps\ROOT\context" privileged="true">
```

- 서버 재실행 후, http://localhost:8080/it/news.txt 실행하면 news 뜸.
- ROOT 경로에 context가 없어도 경로설정을 할 수 있음.
- it 폴더가 없음에도 it 경로가 있는 것처럼 컨텍스트를 활용할 할 수 있음.

> 📌 컨텍스트 : **서버를 껐다 켜야 하기 때문에 오늘날에는 지양되는 방법**

## 7. 처음으로 서블릿 프로그램 만들어보기

- C:\Users\auswo\eclipse\jee-2021-09\jsp\Nana.java에 다음 내용 삽입

```java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Nana extends HttpServlet {
  public void service(HttpServletRequest request,
  HttpServletResponse response) throws IOException,
  ServletException {
    System.out.println("hello Servlet");
  }
}
```

- 커맨드로 자바 파일 컴파일

```bash
C:\Users\auswo>cd C:\Users\auswo\eclipse\jee-2021-09\jsp

C:\Users\auswo\eclipse\jee-2021-09\jsp>dir
 C 드라이브의 볼륨에는 이름이 없습니다.
 볼륨 일련 번호: F2BB-365C

 C:\Users\auswo\eclipse\jee-2021-09\jsp 디렉터리

2021-11-02  오후 10:22    <DIR>          .
2021-11-02  오후 10:22    <DIR>          ..
2021-11-02  오후 10:24               293 nana.java
               1개 파일                 293 바이트
               2개 디렉터리  30,779,674,624 바이트 남음

C:\Users\auswo\eclipse\jee-2021-09\jsp>javac Nana.java
nana.java:5: error: class Nana is public, should be declared in a file named Nana.java
public class Nana extends HttpServlet {
       ^
nana.java:1: error: package javax.servlet does not exist
import javax.servlet.*;
^
nana.java:2: error: package javax.servlet.http does not exist
import javax.servlet.http.*;
^
nana.java:5: error: cannot find symbol // HttpServlet라는 라이브러리를 이해할 수 없다는 오류
public class Nana extends HttpServlet {
                          ^
  symbol: class HttpServlet
nana.java:6: error: cannot find symbol
        public void service(HttpServletRequest request,
                            ^
  symbol:   class HttpServletRequest
  location: class Nana
nana.java:7: error: cannot find symbol
                        HttpServletResponse response) throws IOException,
                        ^
  symbol:   class HttpServletResponse
  location: class Nana
nana.java:8: error: cannot find symbol
                                                        ServletException {
                                                        ^
  symbol:   class ServletException
  location: class Nana
7 errors
```

- 라이브러리 주입을 위한 옵션을 줌 → C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\lib\servlet-api.jar를 이용.

```bash
// -cp <path> : Specify where to find user class files and annotation processors

C:\Users\auswo\Eclipse\jee-2021-09\jsp>javac -cp C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\apache-tomcat-9.0.46\lib\servlet-api.jar Nana.java

C:\Users\auswo\Eclipse\jee-2021-09\jsp>dir
 C 드라이브의 볼륨에는 이름이 없습니다.
 볼륨 일련 번호: F2BB-365C

 C:\Users\auswo\Eclipse\jee-2021-09\jsp 디렉터리

2021-11-02  오후 10:33    <DIR>          .
2021-11-02  오후 10:33    <DIR>          ..
2021-11-02  오후 10:33               578 Nana.class
2021-11-02  오후 10:24               293 Nana.java
               2개 파일                 871 바이트
               2개 디렉터리  30,757,298,176 바이트 남음
```

- 컴파일 완료

## 8. 서블릿 객체 생성과 실행 방법

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/16.png)

- 클라이언트 쪽에서는 /web-inf 안을 접근할 수 없음. 이 디렉토리는 서버 전용이며, /classes 에는 클래스 파일들이 존재함

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/17.png)

- 소스는 Nana.class 파일이지만, 클라이언트가 접근할 때는 /hello로 접근하도록 설정함. → 톰캣이 /hello에 해당하는 서블릿 클래스 Nana를 찾아 실행함.
- C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF\classes에 Nana.class를 복사
- C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\bin\startup.bat 실행
- C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF에 hello.txt 복사(ROOT에도 있음)
    - http://localhost:8080/hello.txt : 정상작동
    - http://localhost:8080/WEB-INF/hello.txt : 404. 외부에서 접속할 수 없음.
- C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF\web.xml 설정

```bash
<!-- 추가 -->
<servlet>
	<servlet-name>na</servlet-name>      ---(1)
	<servlet-class>Nana</servlet-class>  ---(2) 패키지명이 있다면 패키지도 써줌
</servlet>

<servlet-mapping>
	<servlet-name>na</servlet-name>      ---(3)
	<url-pattern>/hello2</url-pattern>   ---(4)
</servlet-mapping>

// (4)라는 url이 오면, (3)서블릿을 실행하고, (3)은 (1)을 뜻함.
// 또한, (1)은 (2)클래스의 이름임.
```

- 톰캣 서버 다시 실행.
- http://localhost:8080/hello2접속해보면, Nana.class가 실행되며, 서버 콘솔에 System.out.println이 출력되는 것을 알 수 있음.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/18.png)

## 9. 서블릿 문자열 출력

1. [Hawaii.java](http://Hawaii.java) 파일 만들기
    - C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF
    
    ```bash
    import javax.servlet.*;
    import javax.servlet.http.*;
    import java.io.*;
    
    public class Hawaii extends HttpServlet {
    	public void service(HttpServletRequest request,
    			HttpServletResponse response) throws IOException,
    							ServletException{
    		OutputStream os = response.getOutputStream();
    		PrintStream out = new PrintStream(os, true);
    		out.println("Hello Servlet!!!");
    	}
    }
    ```
    

1. 컴파일 → Hawaii.class 파일로 컴파일
    
    ```bash
    C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF>javac -cp C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\lib\servlet-api.jar Hawaii.java
    ```
    
2. classes 폴더로 class 파일 이동
    - C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF\classes
3. web.xml 수정
    
    ```bash
    <servlet>
    	<servlet-name>ha</servlet-name>
    	<servlet-class>Hawaii</servlet-class>
    </servlet>
    
    <servlet-mapping>
    	<servlet-name>ha</servlet-name>
    	<url-pattern>/hawaii</url-pattern>
    </servlet-mapping>
    ```
    
4. 톰캣 서버 재가동
    - C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\bin\startup.bat
5. http://localhost:8080/hawaii

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/19.png)

- 좀 더 출력 코드를 간단히 하기 위해, PrintStream을 기본적으로 제공해주는 getter를 씀.
- Stream계열과 Writer계열이 있음.
- 문자를 쓰는 데 다국어면 PrintWriter을 씀.

```bash
// Hawaii.java 수정
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Hawaii extends HttpServlet {
	public void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException,
							ServletException{
		OutputStream os = response.getOutputStream();
		PrintWritter out = new PrintStream(os, true);
		out.println("Hello Servlet!!!");
	}
}
```

## 10. 웹 개발을 위한 이클립스 IDE 준비하기

- 이제껏 수동으로 톰캣을 켜고, 코드 작성 후, 서버를 재시작했다면, 이클립스(IDE)를 사용하면 `ctrl + F11` 만 누르면 끝.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/20.png)

- 이클립스 설정

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/21.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/22.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/23.png)

## 11. 이클립스를 이용한 서블릿 프로그래밍

### 🔰 JSPproject

- 아래 결과 [localhost에 WebContet 폴더가 없는 이유](https://ehdtnn.tistory.com/773) : Maven 프로젝트(localhost)와 Eclipse 표준(강의화면)의  차이

![localhost](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/24.png)
_localhost_

![강의화면](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/25.png)
_강의화면_

1. webapp 폴더 아래 index.html 생성 후 내용 편집, 그리고 ctrl + 11로 실행.

    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/26.png)

    - 서버 설정을 만드는 창이 뜸.
    - 에러가 날 때 : 포트 이미 점유 등.

    ![실행 후 화면](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/27.png)

    실행 후 화면

2. 브라우저 설정 바꾸고 싶을 때

    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/28.png)

    > 💡 브라우저 설정 : windows - browser

3. 루트에 해당하는 프로젝트는 컨텍스트 명을 가지지 않는 게 좋음(http://localhost:8080/JSPproject/index.html)
    - 해당 프로젝트 우클릭 - Properties : webapp 폴더가 기본 프로젝트가 됨.
        
        ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/29.png)
        
4. JSPproject 우클릭 - remove : 컨텍스트 명(컨텍스트 사이트)는 의미가 없으므로 지움
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/30.png)
    
    ![톰캣 9 더블클릭하면 나오는 화면](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/31.png)
    _톰캣 9 더블클릭하면 나오는 화면_
    
    ![다시 실행](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/32.png)
    _다시 실행_
    
    ![http://localhost:8080/index.html](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/33.png)
    _http://localhost:8080/index.html_
    
5. 자바 파일 만들기

    ![localhost(src/main/java)](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/34.png){: width="200"}
    _localhost(src/main/java)_
    ![강의(Java Resources/src)](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/35.png){: width="200"}
    _강의(Java Resources/src)_

6. src/main/java에 패키지 생성, Nana class 생성
7. `C:\Users\auswo\Eclipse\apache-tomcat-9.0.54\webapps\ROOT\WEB-INF\web.xml` 복사 후 프로젝트 `src/main/webapp/WEB-INF`에 붙여넣기
8. web.xml 수정
9. Nana.java에서 ctrl + 11 눌러서 실행
10. 결과
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/36.png)

## 12. 어노테이션을 이용핸 URL 매핑

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/37.png)

- 어노테이션 : 클래스, 메서드 등에 붙여지는 주석(일반적으로 컴파일러에 의해 사라지지 않음)
- 객체를 사용할 때 객체에 붙은주석정보를 꺼내 활용, 메타데이터라고도 함

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/38.png)

```bash
// web.xml

<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  version="4.0"
  metadata-complete="{ true / false }">

// true : 모든 메타데이터 설정이 web.xml에서만 있음
// false : 어노테이션 설정이 있을 수 있으니 찾아보기
```

### 🔰 JSPproject-Annotation

1. web.xml

    ```html
    <!-- 주석처리 후 Nana.java 를 실행하면 404 에러가 남 : 매핑 정보가 사라졌기 때문 -->
    <!-- 
        <servlet>
            <servlet-name>na</servlet-name>
            <servlet-class>com.newlecture.web.Nana</servlet-class>
        </servlet>
        
        <servlet-mapping>
            <servlet-name>na</servlet-name>
            <url-pattern>/hello2</url-pattern>
        </servlet-mapping>
    -->
    ```

    ![매핑 정보가 사라져서 주소록에 서블릿 클래스 명이 나옴](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/39.png)
    _매핑 정보가 사라져서 주소록에 서블릿 클래스 명이 나옴_

    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/40.png)
    _http://localhost:8080/hello2 주소로 진입해도 마찬가지_

2. Nana class 수정 및 실행

    ```java
    @WebServlet("/hi")
    public class Nana extends HttpServlet {
      @Override
      cted void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        rintWriter out = res.getWriter();
        ut.print("Hello");
      }
    }
    ```

3. 결과
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/41.png)
    
    > 💡 협업 시 프로그램이 엉키지 않고 분리된 상태에서 업무를 처리할 수 있음.
    > (web.xml을 여러 사람이 건들이지 않을 수 있기 때문)

## 13. Servlet 출력 형식의 이해

### 🔰 JSPproject-ServletForm

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/42.png)

![실행화면-크롬](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/43.png){: width="300"}
_실행화면-크롬_

- out.println(i + " : Hello Servlet !!"); 의 서로 다른 구조
    
    ![실행화면-엣지](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/44.png)
    _실행화면-엣지_
    
- 웹 요청이 처리됐을 때, 클라이언트는 응답 문서를 웹 문서로 인식하기 때문에 엣지가 옳은 형태.
- out.println(i + " : Hello Servlet !! </br>"); 일 때

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/45.png)

> 💡 어떠한 형식의 문서인지 알려줘야 자의적인 해석을 피할 수 있음

![크롬](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/46.png)
_크롬_

## 14. 한글과 콘텐츠 형식 출력하기

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/47.png)

- 웹서버에서 클라이언트에 응답을 보낼 때 기본 단위는 ISO-8859(유럽형)
- 1바이트씩 쪼개지는데, 한글은 2바이트씩 묶어지기 때문에 깨짐.

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/48.png)

- UTF-8은 2바이트씩 쪼개지지만, 받을 때 다른 인코딩 방식으로 해독함.

### 🔰 JSPproject-hangulContents

- out.println(i + " : 안녕 Servlet !! </br>"); 실행 화면
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/49.png){: width="300"}
    
- res.setCharacterEncoding("UTF-8"); 추가 후 재실행

```java
@WebServlet("/hangul")
public class Nana extends HttpServlet {
  @Override
  protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
    res.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    for (int i=0; i<100; i++) {
      out.println(i + " : 안녕 Servlet !! </br>");
    }
  }
}
```

![엣지](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/50.png)
_엣지_

- 엣지 인코딩 방식을 유니코드로 읽으면 정상적으로 나오긴 함.
- 그렇다면, 제대로 출력되게 하는 방법은?
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/51.png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/52.png){: width="350"}
    
    - 인코딩 방식에 대한 정보를 Response Headers에 심어줌 → 브라우저가 자의적으로 해석하지 않고, 정해진 대로 수행.
        
        ```java
        @WebServlet("/hangul2")
        public class Nana2 extends HttpServlet {
        	
          @Override
          protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
            res.setCharacterEncoding("UTF-8");
            res.setContentType("text/html; charset=UTF-8"); // 추가
            PrintWriter out = res.getWriter();
            for (int i=0; i<100; i++) {
              out.println(i + " : 안녕 Servlet !! </br>");
            }
          }
        }
        ```
        
    
    ![실행결과](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/53.png){: width="400"}
    _실행결과_
    
    ![Response Headers](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/54.png)
    _Response Headers_

## 15. GET 요청과 쿼리스트링

> 💡 사용자의 입력을 어떻게 처리할 것인가?
> - 사용자가 요청할 때 값을 어떻게 받을 것인가?

- 기본적으로 클라이언트가 요청하는 것은 '문서' → 서버는 /hello에 해당하는 문서를 전달함
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/55.png)
    
- 문서를 요청하면서 무언가 전달할 수 있음(요청 속 추가적 요청) → 쿼리스트링이라는 것을 사용해서 키값을 전달할 수 있음 ⇒ 서버는 추가적 옵션에 의한 문서를 전달함
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/56.png)
    

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/57.png)

```java
@Override
protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
  res.setCharacterEncoding("UTF-8");
  res.setContentType("text/html; charset=UTF-8");
  
  PrintWriter out = res.getWriter();
  
  int cnt = Integer.parseInt(req.getParameter("cnt"));
  // req.getParameter("cnt")는 무조건 문자열로 전달됨
  
  for (int i=0; i<cnt; i++) {
    out.println(i + " : 안녕 Servlet !! </br>");
  }
}

// 그러나 cnt 기본값이 null 이므로 500 에러
```

## 16. 기본값 사용하기

- 쿼리스트링 형태에 의한 값들

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/58.png)

## 17. 사용자 입력을 통한 GET 요청

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/59.png)

- `<form>` : 사용자 입력을 처리하기 위한 태그
- `<input>` : 사용자 입력 담당
- `<submit>` : 사용자 요청을 처리

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/60.png)

- css, html, jsp 언어 설정 바꿔줌

## 18. 입력할 내용이 많은 경우는 POST 요청

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/61.png)

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/62.gif)

- url 제한 : 장문의 내용을 쿼리스트링으로 보내는 건 올바르지 않음

```java
<form action="post">
  <div>
    <label>제목 : </label>
    <input type="text" name="title">
  </div>
  <div>
    <label>내용 : </label>
    <textarea name="content"></textarea>
  </div>
  <div>
    <input type="submit" value="등록">
  </div>
</form>
```

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/63.png)

- `<form action="post" method="post">` 추가

```java
<form action="post" method="post">
```

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/64.png)

- 개발자 도구 확인

```html
title=dafdfasdfasdf&content=dfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfasdfsddfas 
// 해당 형태로 요청된 것
```

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/65.png){: width="400"}

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/66.png){: width="400"}

## 19. 한글 입력 문제

- 18강에서 한글 입력이 깨지는 문제가 있었음(전달은 잘 되는데 서버에 갔다가 문서에 실어서 나온 내용은 깨짐)
- 출력 한글 문제는 아니고, 전달할 때 문제가 생긴 것

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/67.png)

- 영문자는 기본적으로 1바이트
- 한글, 중국어 등은 보통 2바이트 코드값이 사용되기 때문에 깨짐

![클라이언트 요청](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/68.png)
_클라이언트 요청_

- 톰캣의 기본적인 인코딩 방식은 ISO-8859-1, 즉 1바이트씩 해석

![서버에서 읽음](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/69.png)
_서버에서 읽음_

### 해결

- 애초에 서버에게 클라이언트 요청을 UTF-8로 읽어달라고 해야 함
- 톰캣 서버의 Connector 환경설정을 바꿈으로서 설정 가능
    - 하지만 톰캣은 여러 사이트를 돌릴 수 있기 때문에 설정을 함부로 바꾸지 않음

![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/70.png)

- 결과
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/71.png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/eclipse-jsp/main/images/72.png)