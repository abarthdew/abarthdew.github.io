---
title: 1-2. Spring Reactive - Async, Spring
date: 2021-03-15
categories: [Back, Spring]
tags: [Back, Spring]
---

# 1-2. Async & Spring

> 📌 들어가기 전에 - 발표 내용<br>
> - 스프링 3.2 ~ 4.3에서의 비동기 개발 방법
> - @Async
> - Asynchornous Request Processing
> - AsyncRestTemplate
> 
> 📌 들어가기 전에 - 배경지식<br>
> - `자바 비동기 개발`
>   - 비동기와 논블록킹
>   - 자바5+
>     - Future/Executor(s)
>     - BlockingQueue
>   - 자바7
>     - ForkJoinTask
>   - 자바8
>     - CompletableFuture
>   - 자바9
>     - Flow
> - `서블릿 비동기 개발`
>   - Servlet 3.0 Async Processing
>     - AsyncContext
>   - Servlet 3.1
>     - Non-blocking IO
>   - Servlet 4.0
> - `스프링 비동기 개발`

## 1) 동기/비동기

### 🔰 Singleton : 하나의 오브젝트를 만들어 공유하는 것.

### 🔰 Dependency Injection

- `A → B, B → C, C → A` 두 개의 오브젝트가 있고, 하나의 오브젝트가 다른 오브젝트를 의존하고 있는 상황에서, 항상 제 3의 오브젝트가 그 의존 관계를 설정.

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/19.jpg)

![[동기와 비동기] - 1](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/20.jpg)
_[동기와 비동기] - 1_

![[동기와 비동기] - 2](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/21.png)
_[동기와 비동기] - 2_

> 💡 동기 / 비동기를 설명할 때는<br>
> (1)무엇과 무엇이?<br>
> (2)어떤 시간을 맞추는가(시간 개념)? 이 두 가지를 꼭 포함해야 함.<br>

### 🔰 동기(Synchronous) : "두 객체 이상이 함께 시간을 맞춘다"

- A와 B가 시작시간 또는 종료시간이 일치하면 동기
- A, B 스레드가 동시에 작업을 시작하면 동기(CyclicBarrier)
- 메소드 리턴시간(A)과 결과를 전달받는 시간(B)이 일치하면 동기
- Synchronized
- BlockingQueue

### 🔰 비동기(Asynchronous) : "두 객체 이상이 함께 시간을 맞추지 않는다"

### 🔰 블로킹 / 논블로킹

- 동기, 비동기와는 관점이 다름
- 내가 직접 제어할 수 없는 대상을 상대하는 방법
- 대상이 제한적임
    - IO(어떤 메서드를제호출해서 가져올 때, 받아올 데이터의 소스 자체가 내가 통재하지 못하는 제 3의 외부 존재로부터 INPUT/OUTPUT을 받을 때)
    - 멀티스레드 동기화(나 말고 다른 스레드가 존재해서 작업하다가, 어느 순간 그 스레드의 동작이나 종료에 관한 확인을 받아야 할 때)

> ❓ 다음은 동기/비동기일까, 블로킹/논블로킹일까?

```java
ExecutorService es = Executors.newCachedThreadPool();

String res = es.submit(() -> "Hello Async").get();
```

> 💡 `es.submit : 비동기`<br>
> - 메소드 리턴 시간과 Callable의 실행 결과를 받는 > 시간이 일치하지 않음.
> - 블로킹/논블로킹은 고려할 대상이 아님(무언가를 > 기다릴 대상이 없음).
> `.get() : 동기/블로킹`<br>
> - 메소드 리턴 시간과 결과를 가져오는 시간이 일치.
> - 다른 스레드의 작업이 완료될 때까지 대기.

## 2) @Async

> ❓ (1) 아래 코드가 실행되는 순서는? : a → b → c

```java
void service() {
  //..(c)
}
```

```java
//(a)
myService.service();
//(b)
```

> ❓ (2) 아래 코드가 실행되는 순서는?<br>
> a → b, c는 다른 스레드에서 동시(서로 시간을 맞추지 않고)실행되게 됨

```java
@Async
void service()
{ //..(c) }
```

```java
//(a)
myService.service();
//(b)
```

> ❓ (3) 아래 코드가 실행되는 결과는? : null 리턴<br>
> - @Async는 `String`을 지원하지 않음(비동기적으로 > 결과를 바로 리턴해줄 수 없음).
> - @Async 메소드의 리턴 타입 : `void`, `Future<T>`, `ListenableFuture<T>`, `CompletableFuture<T>`

```java
@Async
void service() { return result; }
```

```java
String result = myService.service();
// null 리턴
```

### 🔰 Future<T>

- 비동기 결과를 가져올 수 있는 기본적인 인터페이스를 정의해 놓은 것.

```java
// String을 Future에 담아서 사용
@Async
Future<String> service() { //(2)Future 형으로 리턴
  ...
  return new AsyncResult<>(result); //(1)AsyncResult에 담아서 리턴해야 함
}

Future<String> f = myService();
String result = f.get(); //(3)future의 get()메소드가 호출된 시점에 리턴
```

### 🔰 ListenableFuture<T>

- Future를 통해 도출한 결과를 Listenable하게, 즉 결과가 완료됐을 때 콜백 메서드를 호출할 수 있게 만듦.
- Spring의 API를 표준화 시킴.
- ListenableFuture로 비동기 호출 결과를 가리키는 오브젝트를 받게 한 후, 콜백을 add시켜서 처리하게 함.

```java
@SpringBootApplication
@Slf4j
public class TestApplication {

  @Async
  public ListenableFuture<String> service() {
	String result = "test";
	return new AsyncResult<>(result);
  }
  
  public static void main(String[] args) throws InterruptedException, ExecutionException {
  
	ListenableFuture<String> f = new TestApplication().service();
	f.addCallback(r -> log.info("Success: {}", r), e -> log.info("Error: {}", e));
	  // *Future<T>에서처럼 get()메서드로 막연히 블로킹해서 기다릴 필요 없이, 논블로킹으로 결과를 받을 수 있음
	  // *콜백이 2가지로 구성되어 있음
	  // success : 성공했을 때
	  // error : 예외가 발생했을 때 Exception 오브젝트를 콜백으로 받음
	SpringApplication.run(TestApplication.class, args);
  
  }

}
// 17:10:14.214 [main] INFO com.example.test.TestApplication - Success: test
```

> 💡 비동기에서 예외가 발생하면, 비동기는 다른 스레드에서 다른 stack trace를 타고 움직이기 때문에, 예외가 발생하면 그걸 호출한 쪽으로 예외를 던져서 캐치하기 힘듦. 그래서 콜백을 이용해 예외가 발생했을 때 Exception 오브젝트를 콜백으로 받음.

### 🔰 CompletableFuture<T>

- AsyncResult 타입으로 리턴하지 말고, CompletableFuture(비동기 작업을 완료하고 그 결과값을 강제로 쓸 수 있는 static 메서드)를 사용하자.
- 콜백과 유사하게 생긴 `thenAccept`, `thenCompose` 등의 메서드를 지원함.

```java
@Async
CompletableFuture<String> service() {
  ...
  return CompletableFuture.completedFuture(result);
}

CompletableFuture<String> f = myService.service();
f.thenAccept(r -> System.out.println(r));
// 성공했을 경우 화면에 출력하는 코드
// 블로킹하지 않기 때문에,
// 이 비동기 작업을 호출한 코드는 그 아래로 내려가서 나머지 작업은 자유롭게 진행함
```

### 🔰 Async를 활용하는 팁

- @Async가 사용하는 기본 TaskExecutor(스프링 기본 빈)
- 스레드 풀 아님
- 스레드는 비싼 자원이므로 매번 스레드를 만들지 않고 스레드 풀을 만들어서 재사용을 하는데, @Async 메서드를 호출할 때마다 새로운 스레드를 만들고, 쓰고 나서 그냥 버리기 때문에 낭비가 발생할 수 있음.
- `Executor`, `ExecutorService`, `TaskExecutor` 타입의 빈을 하나 만들어서 스레드 풀을 설정하고, @Async(`"myExecutor"`) 형식으로 사용할 것.

```java
// 스레드 풀 설정
@Bean
TaskExecutor taskExecutor() {
  ThreadPoolTaskExecutor ts = new ThreadPoolTaskExecutor();
  te.setCorePoolSize(10); // 설정 가능한 스레드 풀 사이즈
  te.setMaxPoolSize(100); // 최대 스레드 풀
  te.setQueueCapacity(50); // 대기열에 있는 스레드 풀, 스레드를 할당할 수 없어 대기상태에 뒀다가 나중에 하나씩 빼서 할당할 때 사용
  te.initialize();
  return te;
}
// 이렇게 만들어 놓으면 @Async가 실행이 될 때 이 스레드 풀의 스레드를 가져와서 사용함
// 스레드 풀이기 때문에 반납도 함
```

> ❓ 50개의 @Async 메소드 호출이 동시에 일어나면 스레드는 몇 개가 만들어질까? : 10개<br>
> ⇒ 스레드 풀은 기본적으로 core thread pool 사이즈를 오버하면 max pool size 까지 올리는 게 아니라 먼저 queue를 채우고, 그래도 감당이 안 되면 맥시멈을 올림. 큐에 50개가 들어가면, 10개 스레드는 코어로 가져가고, 40개는 큐에서 대기하는 식. (DB풀을 설정하는 것과는 다른 개념)

- @Async를 본격적으로 사용한다면 실전에서 사용하지 말 것!

### 🔰 비동기 서블릿 `servlet 3.0 +`

- 무엇인가 기다리느라 서블릿 요청처리를 완료하지 못하는 경우를 위해서 등장.
- 서블릿에서 AsyncContext를 만든 뒤 즉시 서블릿 메소드 종료 및 서블릿 스레드 반납.
- 어디서든 AsyncContext를 이용해서 응답을 넣으면 클라이언트에 결과를 보냄.

```java
@WebServlet(urlParams = "/hello")
public class MyServlet2 extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	response.getWriter().println("Hello Servlet!");
  }
}
```

```java
// 위 코드를 이런 식으로 바꿀 수 있음
@WebServlet(urlPatterns = "/hello", asyncSupported = true) //asyncSupported = true 세팅
public class MyServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	AsyncContext ac = request.startAsync(); //AsyncContext 생성
	Executors.newSingleThreadExecutor().submit(() -> {
	  // 다른 스레드에 작업을 위임하고 서블릿은 종료
	  // 사용됐던 서블릿 스레드는 즉시 반납
	  ac.getResponse().getWriter().println("Hello Servlet!");
	  // 생성한 AsyncContext를 통해 서블릿의 응답을 처리
	  ac.complete(); //비동기적인 웹 요청 작업이 끝나게 됨
	  return null;
	});
  }
}

// 비동기적으로 새로운 스레드를 만들어서 거기 작업을 위임시키고 서블릿은 바로 종료시킴.
```

```java
@WebServlet(urlPatterns = "/hello", asyncSupported = true)
public class MyServlet extends HttpServlet {
  Queue<AsyncContext> ctxs = new ConcurrentLinkedQueue<>();
  
  public void doGet(HttpServletRequest request, HttpServletRequest response) throws IOException{
	AsyncContext ac = request.startAsync();
	// AsyncContext라는 비동기 컨텍스트를 만들어서 어딘가에 저장 후,
	// 나중에 다른 스레드에서 사용하는 이벤트 처리에 유리한 방식.
	// AsyncContext를 저장해두고 임의의 스레드에서 응답 결과를 넣을 수 있다.
	ctxs.add(ac);
  
  }
}
```

## 3) 비동기 스프링 @MVC

### 🔰 비동기 @MVC의 리턴 타입

- Callable<T>
- WebAsyncTask<T>
- DeferredResult<T>
- LitenableFuture<T>
- CompletionStage<T>
- ResponseBodyEmitter

### 🔰 Callable<T>

- AsyncTaskExecutor에서 실행된 코드를 리턴
- new Thread()나 AsyncTaskExecutor를 사용해서 스레드를 생성할 필요 없이, 스레드 안에서 동작할 코드를 Callable 인터페이스를 씀으로써 구현.
- Callable은 파라미터가 없고, 리턴값만 있음

```java
@FunctionalInterface
public interface Callable<V> {
  V call() throws Exception;
}
```

```java
@GetMapping("/hello") // (1)
String hello() {
  return "hello";
} // hello라는 결과를 리턴하는 코드
```

```java
@GetMapping("/callable") // (2)
Callable<String> callavle() { // String이 @MVC 결과 값의 타입
  return () -> { // 컨트롤러 메소드가 종료된 뒤 별도의 TaskExecutor 내에서 실행
	return "hello"; // Callable의 리턴 값이 컨트롤러 메소드의 리턴 값으로 사용
  }
} // Callable로 타입을 바꿈

/* Callable 오브젝트 */
return () -> { 
  return "hello"; 
}
// 스프링 MVC가 가진 비동기 스레드 풀 위에서 실행됨
```

### 🔰 WebAsyncTask<T>

- Callable에 timeout과 taskExecutor를 추가

```java
public WebAsyncTask(Long timeout, String executorName, Callable<V> callable) {...}

public WebAsyncTask(Long timeout, AsyncTaskExecutor executor, Callable<V> callable) {...}
```

- Callable과 동일, 그러나 Callable에 없는 표준 API 두가지 조건을 추가할 수 있음
    
    ✔ (1) 시간
    
    ✔ (2) 어느 스레드 풀에서 동작시킬 것인가
    

```java
@GetMapping("/webasynctask")
WebAsyncTask<String> webasynctask() {
  return new WebAsyncTask<String>(5000L, "myAsyncExecutor"
	() -> {
	  return "hello";
	}
  );
}
```

### 🔰 DefferedResult<T>

- 어디선가 DeferredResult에 값을 쓰면 원래 리턴 값이었던 것처럼 리턴됨.

> 💡 웹 요청에 대한 응답을 responseBody, viewName과 같은 정보를 넣을 수 있는 핸들러를 만들어 놓고(지연된 결과) → 이 오브젝트를 컨트롤러에 만든 다음 MVC 컨트롤러를 종료시킴 → 그리고 어디선가(컨트롤러 안, 다른 스레드 안이든) 이 값을 세팅하면 코드를 실행하고 있는 동안 이걸 붙잡고 있던 서블릿 스레드를 바로 리턴함 → 가용 스레드가 늘어남.

- 임의의 스레드에서 리턴 값 설정 가능
- Callable 처럼 새로운 스레드를 만들지 않음
- 다양한 비동기 처리 기술과 손쉽게 결합

```java
public class DeferredResult<T> {
  ...
  public boolean setResult(T result) {...} //정상적으로 실행됐을 때
  public boolean setErrorResult(Object result) {...} //에러가 발생했을 때 예외를 넣을 수 있음
}
```

```java
@GetMapiing("deferredresult")
DefferdResult<String> deferredResult() {
  DefferedResult dr = new DeferredResult(); //DeferredResult를 생성해서 보관한 뒤 리턴
  queue.add(dr); //큐에 저장
  return dr;
}

void eventHandler(String event) { //다른 스레드에서 저장된 DeferredResult에 결과 값 쓰기
  queue.forEach(dr -> dr.setResult(event));
  // 이 코드를 실행시킨 서블릿 스레드는 바로 스레드풀에 리턴됨.
  // 더 많은 다른 요청을 처리할 수 있는 상태가 되는 것.
  // 큐에서 대기하고 있는 응답을 모조리 불러다가 쓸 수 있음.
}

// 예를 들어, 100명이 이벤트 발생 시 응답을 기다린다고 했을 때,
// 100개의 스레드가 잡혀있는 게 아니라, DeferredResult를 만들고 빠져나가면 스레드는 하나도 사용하지 않는 상태가 됨.
// 단지, 결과를 쓸 수 있는 채널이 만들어진 상태.
// 새로운 이벤트 발생 시, 응답을 쓰는 순간 그때 새로운 스레드가 만들어지며 http 응답을 브라우저로 보낼 수 있게 되는 것.
```

### 🔰 DeferredResult와 @Async

- @Async 메소드가 리턴하는 ListenableFuture에서 DeferredResult 사용 : 비동기적으로 무언가를 실행시키고 결과를 받는 코드에 응용해야 효용성이 있음.
- 비동기 @MVC + 비동기 메소드 실행
- 🔽 DeferredResult + @Async의 호출 결합코드

```java
@GetMapping("/drlf")
DeferredResult<String> drAndLf() {
  DeferredResult dr = new DeferredResult(); // deferredResult 생성
  
  // ListenableFuture은 비동기적 결과가 오면 콜백 오브젝트를 호출하는 방식으로 처리
  ListenableFuture<String> lf = myService.async(); // 비동기 작업을 시작한 뒤 결과에 대한 핸들러만 받음
  lf.addCallback(r -> dr.setResult(r), e -> dr.setErrorResult(e));
  // 비동기 작업이 끝나면 실행될 콜백에서 지연된 @MVC 결과값을 등록
  // 콜백을 람다식으로 정의, 여기서 만들어진 DeferredResult값을 쓰게 해 줌
  return dr;
}

// 비동기 작업이 끝나기 전에 컨트롤러 메서드는 종료됨, 그 후 @Async로 수행한 비동기 작업이 끝나고 나서 결과가 오면 그 때 DeferredResult의 값을 쓰며 결과가 리턴됨
```

### 🔰 ListenableFuture<T>

- 리턴 타입 자체를 ListenableFuture로 만들어 놓음 : 스프링 MVC의 리턴 타입 자체를 ListenableFuture로 하게 되면, DeferredResult와 Async로 콜백 세팅 작업이 간소화됨.
- DeferredResult 생성, 콜백 등록과 콜백 호출 시 결과를 넘기는 것을 스프링이 알아서 해 줌.
- 🔽 위에서 설명한 코드를 아래와 같이 바꿀 수 있음

```java
@GetMapping("/lf")
ListenableFuture<String> listenableFuture() {
  return myService.async();
}
```

- `한계` : 두 가지 이상의 비동기 작업을 순차적으로 혹은 동시에 수행하고 결과를 조합해서 @MVC의 리턴 값으로 넘기려면? ⇒ 안됨.

```java
@GetMapping("/composesync")
String compose() {
  String res1 = myService.sync();
  String res2 = myService.sync2(res1); // 첫번째 작업의 결과를 가져와서 두 번째 작업에 전달.
  return res2; // res1을 res2에 넘겨서 결과를 리턴할 수 있음.
}
```

### 🔰 ListenableFuture<T> 조합

```java
@GetMapping("/composeasync")
ListenableFuture<String> asyncCompose() {
  ListenableFuture<String> res1 = myService.async();
  ListenableFuture<String> res2 = myService.async2(res1.???); // 비동기 작업 결과를 다음 작업의 파라미터로 넘기려면?
  return res2;
}
```

- 두 개 이상의 비동기 작업을 결합할 때는 다시 콜백 + DeferredResult 방식으로
- 비동기 작업의 성공 콜백에서 다음 비동기 작업 시도
- 최종 비동기 작업의 성공 콜백에서 DeferredResult에 결과 전달

```java
@GetMapping("/composeasync")
DeferredResult<String> asyncCompose() {
  DeferredResult dr = new DeferredResult(); // DeferredResult 생성
  ListenableFuture<String> f1 = myService.async();
  f1.addCallback(res -> {
	ListenableFuture<String> f2 = myService.async2(res1);
	  f2.addCallback(res2 -> {
	  dr.setResult(res2); // 성공한 경우
	}, e -> {
	  dr.setErrorResult(e); // 예외 발생했을 경우
	});
  });
  return dr;
}
```

- 여러 개의 비동기 작업을 조합해서 비동기 @MVC의 결과로 사용할 수 있음.

  👉 콜백의 중첩으로 코드가 복잡해짐.

  👉 예외 콜백의 내용이 동일한 경우 중복이 발생한다.

### 🔰 CompletableFuture<T> 조합

- CompletableFuture 인터페이스는 CompletionStage의 서브타입
- 함수형 스타일 접근방법
- CompletionStage의 조합으로 간결하게 표현 : 하나의 비동기 작업이 끝났을 때, 그 다음 동기/비동기 작업을 체이닝해서 콜백을 만들지 않고도 연결해 줌.
- 중복되는 예외 처리를 한번에
- 다양한 비동기/동기 작업의 변환, 조합, 결합 가능
- CompletableFuture/CompletionStage 사용에 대한 학습이 필요
- ExecutorService의 활용 기법도 익혀야 함

```java
// 위 코드가 이렇게 바뀜
@GetMapping("/composecf")
CompletableFuture<String> cfCompose() {
  CompletableFuture<String> f1 = myService.async(); // 첫번째 비동기 작업
  CompletableFuture<String> f2 = f1.thenCompose(res1 -> myService.casync2(res1));
  // thenCompose : 앞에서 실행된 비동기 작업의 결과가 나오면 파라미터로 받아서 두번째 작업을 실행, f2의 값을 받음
  // 즉, 비동기 작업의 결과를 받아 이를 이용해 다음 비동기 작업을 수행하는 비동기 작업을 생성.
  return f2;
}
```

```java
// 더 간결하게
@GetMapping("/composecf")
CompletableFuture<String> cfCompose() {
  return myService.casync().thenCompose(res1 -> myService.casync2(res1));
}
```

```java
// 더 간결하게2
@GetMapping("/composecf")
CompletableFuture<String> cfCompose() {
 return myService.casync().thenCompose(myService::casync2); // 메서드 레퍼런스 사용
}
```

### 🔰 비동기 작업의 결합

- 2개 이상의 비동기 작업을 병렬적으로 실행하고 결과를 모아서 결과 값을 만들어 내는 비동기 작업 구성
    
    ✔ ListenableFuture의 콜백 구조로는 어려움
    
    ✔ CompletableFuture로는 손쉽게 가능
    
> 💡 조합과 결합<br>
> - `조합` : 한 번 작업이 끝나고, 그 결과에 의존해서 두 > 번째 작업이 실행.
> - `결합` : 두 개의 비동기 작업이 독립적으로 동시에 실행, 결과를 합쳐서 최종 결과를 도출.

## 4) 비동기 논블로킹 API 호출

### 🔰 비동기-논블로킹 API 요청과 @MVC

- RestTemplate(`JSON이 리턴되면 자바 오브젝트 형태로 메세지 컨버터가 자동 변환`, `예외 처리 용이`, `다양한 HTTP메서드 사용 가능`)은 동기-블로킹 방식
- API 호출 작업 동안 스레드 점유
- 블로킹으로 인한 컨텍스트 스위칭 발생으로 CPU 자원을 낭비
- 비동기 @MVC를 사용했다고 하더라도 스레드 자원의 효율적인 사용이 어려움

### 🔰 AsyncRestTemplate

- 스프링 4.0부터 RestTemplate의 비동기-논블로킹 버전인 AsyncRestTemplate을 이용할 수 있음.
- 사용방법은 RestTemplate과 거의 비슷함.

```java
RestTemplate rt = new RestTemplate();
for (int i=0; i<100; i++) {
  ResponseEntity<String> res = rt.getForEntity("http://localhost:8080/api", String.class);
  System.out.println(res.getBody());
}

// 1초 정도 걸리는 api를 100번 호출한다면? = 100초 이상이 걸림
```

```java
AsyncRestTemplate art = new AsyncRestTemplate();
for (int i=0; i<100; i++) {
  ListenableFuture<ResponseEntity<String>> lf
	= art.getForEntity("http://localhost:8080/api", String.class);
  lf.addCallback(r -> System.out.println(r.getBody()), e -> {});
}

// 1초 정도 걸리는 api를 100번 호출한다면? = 2초 이하 걸림
// 하지만 이 작업 하나에 대한 스레드가 100개 이상 생성되기 때문에 낭비가 발생
```

> ⚠️ AsyncRestTemplate은 비동기/논블로킹이지만, 논블로킹 IO를 사용하지 않음. 따라서, 그냥 사용하는 건 의미가 없음.


```java
// 논블로킹 IO를 지원하는 Netty4ClientHttpRequestFactory를 사용해야 함
Netty4ClientHttpRequestFactory factory
  = new Netty3ClientHttpRequestFactory(new NioEventLoopGroup(1)); // 논블로킹 IO스레드 1개만 할당
  // http 클라이언트 라이브러리와 AsyncTaskExecutor는 자유롭게 선택해서 DI
AsyncRestTemplate art = new AsyncRestTemplate(factory);
// 1초 걸리는 API 호출 100개를 1개 스레드로 1초에 처리
// 비동기 @MVC이므로 서블릿 스레드도 점유하지 않음
```

> 💡 `네티(Netty)` : 자바의 논블로킹 IO

> 📌 AsyncRestTemplate은 그냥 쓰지 말고, 어떤 http 클라이언트 라이브러리를 사용하는지 생각하고, 스레드가 어떤 식으로 사용되는지 모니터링 할 수 있어야 함.

### 🔰 비동기 API 호출의 조합과 결합은 어떻게?

- AsyncRestTemplate은 ListenableFuture로만 리턴
- 콜백의 콜백의 콜백 ... : 콜백 헬
- @Async처럼 조합이 간편해지는 CompletableFuture로 리턴하면 안 되나?
    - AsyncRestTemplate에는 CompletableFuture를 리턴할 수 있는 메서드가 없음
    - 리턴 오버로딩은 없음. CF는 LF의 서브타입도 아님
    - 스프링 이슈 트래커의 답변 : 재주것 CompletableFuture로 만들어 쓸 것
- 필요하면 확장해서 쓴다
    - ListenableFuture도 Java5의 FutureTask를 간단히 확장해서 콜백이 가능하도록 스프링에서 만든 것
    - ListenableFuture를 CompletableFutuer로 만드는 것도 간단

```java
// ListenableFuture를 CompletableFuture로 바꾸는 법
public <T> CompletableFuture<T> toCFuture(ListenableFuture<T> lf) {
  CompletableFuture<T> cf = new CompletableFuture<>();
  // CompletableFuture는 비동기 작업을 스레드 풀에서 실행하는 코드 없이, 직접 비동기 결과라는 암시를 줄 수 있음
  lf.addCallback((r) -> { // ListenableFuture에 콜백 세팅
	cf.complete(r); // 전달받은 결과
  }, (e) -> {
	cf.completeExeceptionally(e); // 에러가 발생했을 시
  });
  return cf;
}
```

> 💡 CompletableFuture의 이름의 의미 : Future는 결과를 가져오는 역할이었음. CompletableFuture는 결과를 complete()와 completeExceptionally()로 세팅할 수 있음.

## 5) 비동기 스프링 정리

### 🔰 비동기 작업과 API 호출이 많은 @MVC 앱을 어떻게 개발한 것인가

- @MVC : 스프링의 어노테이션을 이용한 MVC를 통해 앱을 개발
- AsyncRestTemplate + 논블로킹 IO 라이브러리 : API 호출 방법(Netty, 아파치 논블로킹 http 클라이언트 등)
- @Async : IO가 아닌 경우 @Async를 사용해 별도의 스레드 풀을 만들어서 작업
- TaskExecutor : 스레드를 얼만큼 할당해서 쓸지에 대해 전략을 짜야 하기 때문에, TaskExecutor는 반드시 정의해서 쓰기
- ListenableFuture, CompletableFuture 사용하기

### 🔰 TaskExecutor(스레드풀)의 전략적 활용이 중요

- 스프링의 모든 비동기 기술에는 ExecutorService의 세밀한 설정이 가능
- CompletableFuture도 ExecutorService의 설계가 중요
- 코드를 보고 각 작업이 어떤 스레드에서 어떤 방식으로 작동하는지, 그게 어떤 효과와 장점이 있는지 설명할 수 있어야 한다
- 벤치마킹과 모니터링 중요

### 🔰 비동기 스프링 기술을 사용하는 이유

- IO가 많은 서버 앱에서 서버 자원을 효율적으로 사용해 성능을 높이기 위함(낮은 레이턴시, 높은 처리율)
- 서버 외부의 이벤트를 받아 처리하는 것과 같은 비동기 작업이 필요

### 🔰 그 외 비동기 기술

- HTTP Streaming
- ResponseBody Emitter
- Async Listener
- Async Message Reception
- @Scheduled
- @MVC에 RxJava, Reactor 사용하기

# 색인과 출처
### 1-2. Async & Spring
- [영상 주소](https://www.youtube.com/watch?v=HKlUvCv9hvA&list=PLdHtZnJh1KdZ6NDO9zc9hF4tONDLTSEUV&index=3)