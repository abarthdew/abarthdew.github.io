---
title: 프론트 퀵 브리핑
date: 2026-02-15
categories: [front, JS]
tags: [front, JS]
---

# 쿠키, 캐시, 세션
- 쿠키: 브라우저에 저장되는 작은 데이터
  - 저장 위치: 브라우저
  - "브라우저가 들고 다니는 메모지"
  - 자동으로 매 요청마다 서버에 딸려감 / 만료시간 설정 가능
  - 용도: 로그인 토큰, 설정값(다크모드, 언어), 트래킹 id
  ```js
  // server
  Set-Cookie: sessionId=abc123
  // browser
  요청 보낼 때마다 Cookie: sessionId=abc123
  ```
  
- 캐시: 다시 안 받아오려고 임시 저장해두는 것
  - 저장 위치: 브라우저, 서버, cdn, 메모리 등
  - "다시 계산/다운로드 안 하려고 저장"
  - 이미지, js, css 다시 안 받기 / api 응답 다시 계산 안 하기 / db 조회 결과 다시 안 가져오기
  - 용도: 성능 최적화용, 사용자 상태랑 직접 관계 없음

- 세션: '로그인한 사용자 상태'를 서버가 기억하는 것
  - 저장 위치: 서버
  - "서버가 사용자마다 만들어주는 개인 서랍"
  - 진짜 데이터는 서버에 존재 / 브라우저는 세션 id만 쿠키로 들고 다님
  - 서버 재시작하면 휘발(보통)
  - 용도: 로그인 구현(전통적 방식)
  ```js
  // browser
  Cookie = JSESSIONID=xyz
  // server
  Map<"xyz", UserSessionObject>
  ```
  
- 관계:
  ```scss
  [브라우저]
  ├─ Cookie (세션ID, 토큰, 설정값)
  ├─ Cache (이미지, JS, CSS)
  ↓ 요청
  [서버]
  ├─ Session (로그인 정보, 장바구니)
  ├─ Cache (쿼리 결과, 계산 결과)

  // “로그인은 세션 기반이고, 세션 키는 쿠키로 들고 다닌다. 캐시는 성능 때문에 여기저기 쓴다.”
  브라우저 (쿠키) ──[sessionId=abc]──▶ 서버
  서버 (세션) ──[abc → { userId=1, role=ADMIN }] 
  ```
  
- 로그인 예시
  - 세션
    1. 로그인 성공
    2. 서버: 세션 생성 -> sessionId = "abc:
    3. 서버 -> 브라우저: Set-Cookie: JSESSIONID=abc
    4. 이후 요청:
      ```js
        브라우저 → Cookie: JSESSIONID=abc
        서버 → 세션 조회 → "아 이 사용자구나"
      ```
  - jwt
    1. 로그인 성공
    2. 서버: jwt 발급
    3. 브라우저: cookie에 저장 or localStorage에 저장
    4. 이후 요청: Authorization: Bearer jwt...

# 런타임 언어인가?
- 컴파일해서 실행 파일 만들지 않음 -> 인터프리터/vm(v8 등)이 바로 실행
- 이벤트 루프(콜 스택이 비면, 큐에서 콜백 하나 꺼내스 스택에 올리는 무한 루프) 전체 구조
  ```mathematica
  ┌──────── JS Engine ────────┐
  │  Call Stack               │
  └─────────▲─────────────────┘
            │
            │
       Event Loop
            │
  ┌─────────┴─────────┐
  │ Task Queue         │  (setTimeout, I/O 등)
  │ Microtask Queue    │  (Promise.then, await)
  └────────────────────┘
  
  ┌──────── Browser / Node ────────┐
  │  Timer / Network / I/O         │
  └────────────────────────────────┘
  ```
- 이벤트(트리거): 나중에 처리해달라고 큐에 들어오는 작업 (클릭, 타이머 완료, 네트워크 응답 도착, 파일 읽기 완료)
- 함수: 실행되는 코드 단위
  ```js
  button.addEventListener("click", () => {
    console.log("clicked");
  });
  // 이벤트: click, 실행되는 것: 콜백 함수
  ```

# 비동기 언어인가? -> 아님.
- JS: 단일 스레드 + 동기실행
  ```js
  console.log(1);
  console.log(2);
  console.log(3);
  // 무조건 1, 2, 3 순서로 출력
  ```
- 비동기처럼 보이는 이유: 단일 스레드 + 이벤트 루프 + 비동기 api
- JS 엔진은 한 번에 한 줄만 실행 + 타이머 / 네트워크 / 파일 io는 브라우저, Node가 백그라운드에서 처리
  ```js
  console.log("a");
  setTimeout(() => {
  console.log("b");
  }, 0);
  console.log("c");
  // 출력: a -> c -> b 순서
  // a 출력 -> setTImeout 등록 -> c 출력 -> b는 이벤트 큐에 들어갔다가 나중에 실행됨
  ```
- async / await: 비동기를 "동기 코드처럼 보이게" 쓰는 문법 설탕 (멀티 스레드 아님)
- 스레드를 제어하는 기능이 아니라, Promise 기반 비동기 흐름의 실행 순서를 기술하는 문법
  ```js
  async function f() {
    const res = await fetch(url); // await: "여기서 이 함수만 잠깐 멈추기" -> 메인 스레드는 안 멈춤
    console.log(res);
  }
  ```
- 비동기 실행 흐름 실제 예시
  ```js
  console.log("a");
  setTimeout(() => console.log("b"), 0);
  Promise.resolve().then(() => console.log("c"));
  console.log("d");
  // 출력: a -> d -> c -> b
  ```
  1. a (스택)
  2. setTimeout 등록 (브라우저에 위임)
  3. Promise.then 등록 (microtask queue)
  4. d (스택)
  5. 스택 비면: c (microtask 먼저) -> b (task queue)

  ```js
  async function f() {
    console.log("a");
    await fetch(url);
    console.log("b");
  }
  console.log("c");
  f();
  console.log("d");
  // 출력: c -> a -> d -> b
  ```
  1. f() 호출
  2. "a" 출력
  3. await fetch()를 만나서: f() 함수 실행 중단, 나머지는 Promise.then으로 등록, 그래도 메인 스레드는 계속됨
  4. "d" 출력
  5. fetch 끝나고 -> "b" 출력

- 정리
  ```js
    async function f() {
      A;
      await P; // Promise를 멈춰서 기다리는 것이 아니라, resolve될 때까지 함수 실행을 일시 중단
      B;
    }
  
    // 이 문법과 같음
    function f() {
      A; // A 실행 (동기)
      return P.then(() => { // P.then(...) 실행
         B; // P가 resolve되면 B 실행
      }); 
    } // f는 Promise를 반환
  ```

# 호이스팅
- 실행 컨텍스트 생성 단계에서 선언부를 미리 등록
  ```js
  console.log(x);
  var x = 10;

  // 엔진 내부
  var x; // 선언 호이스팅
  console.log(x);
  x = 10;
  ```





  
