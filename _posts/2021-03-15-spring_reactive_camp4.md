---
title: 2-1. Spring Reactive - Reactive Spring
date: 2021-03-15
categories: [Back, Spring]
tags: [Back, Spring]
---

# 2-1. Reactive Spring

## 1) 리액티브가 왜 필요한가?

> 💡 2008년 넷플릭스 서버 과부하 사태 ⇒ 장애 고립이 되지 않았다 = 데이터베이스 특정 부분에서 발생한 장애가 고립되지 않았다 ⇒ 서비스 분산효과를 극대화하기 위한 비동기 시스템이 필요함.

## 2) 스프링 5의 Key

- JDK 9
- http/2 : 월드 와이드 웹에서 쓰이는 HTTP 프로토콜의 두 번째 버전
- Reactive

> ❓ jigsaw : Java 플랫폼의 모듈화및 일반 library의 모듈화 시스템. 라이브러리, 드라이버 하위 의존성 때문에 참조되거나 추가되는 게 많은데, 이런 것들을 해결한 것.

## 3) Project Reactor

### 🔰 Project Reactor

- JVM 을 위한 Reactive Streams
- ReactiveX(옵저버블 스트림과 비동기 프로그래밍 API) 와 호환 가능하고 유사한 API
- Java 8 Streams와 호환
- Java 9 Flux Adaptor
- 기타 다른 종속성(Implementation)과의 호환

### 🔰 LoadBalancer in Cloud Service

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/22.png)

- 이론적 : 각 Host에 App1, 2, 3...등과 같이 어플리케이션을 늘리고 줄이는 방법.
- 실제 : App1이 서로 다른 호스트에서 동작하게 됨.
- 요청이 많을 때, 호스트는 오토 스케일링이나 버추얼 머신을 늘리는 방법으로 요청을 처리함.
- ⇒ 더 많은 서버가 필요하므로, 더 많은 서버를 켜게 됨 ⇒ 비용 증가.

### 🔰 리소스를 더 효율적으로 처리할 방법은 없을까? : 리액티브

- 각각의 스레드를 굳이 요청에 필요한 숫자만큼 만들지 않고도 작업을 처리할 수 있을까?

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/23.png)

- 요청 : 서버 내에서 발생하는 일종의 Publishing 동작
- 각각의 Worker : Subscriber
- 요청을 받을 때 계속 스레드 풀을 만들어서 할당하고 요청을 처리하는 데 포커싱하기 보다는, 가용한 스레드에 일종의 Pub/Sub 구조처럼 던져줌.
- 중간에서 워커가 받기 전에는 일종의 버퍼, 또는 큐가 존재하게 됨 → 비동기 형태로 일을 처리하는 것 ⇒ 동일한 리소스로 더 많은 요청을 처리함.

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/24.png)

### 🔰Reactive Manifesto

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/25.png)

- `응답성` : 리액티브 시스템은 가능한 모든 요청에 대해 적시에 응답할 수 있어야 함. 또한, 발생한 문제에 대해 빠르고 효율적으로 대응할 수 있어야 함.
- `탄력성` : 시스템은 변화하는 부하에 의해 자원의 변경이 빈번하게 발생하는 상황에서도 응답성을 유지해야 함.
- `회복성` : 시스템은 장애에 직면한 상태에서도 응답성을 유지할 수 있어야 함. 미션 크리티컬한 시스템 또는 고가용성을 유지해야 하는 시스템에만 국한되지 않음.

> ❓ 서킷 브레이커 : 어떤 서비스가 응답불가 상태에 빠진 것을 감지, 기존 시스템들이 보내는 요청에 기본값을 통제, 리턴하는 형식으로 동작.

- `메세지 중심`
    - 리액티브 시스템은 느슨한 결합(Loosely Coupled)의 방법을 사용하는 컴포넌트 사이에서 비동기 방법으로 전달되는 메세지를 기반으로 동작.
    - 데이터베이스-어플리케이션이 존재할 때, 어플리케이션이 어떤 요청을 받게 되고, 디비가 응답을 끝낼 때까지 기다리는 것이 아니라, 중간에 메세지 큐와 같은 레이어가 하나 더 있어서 메세지만 던지고 끝낸 후 다른 일에 집중.
    - 뒤에 있는 워커들이 메세지 큐에 있는 내용을 꺼내서 처리.
    - 메세지 큐, 스트림과 어플리케이션, no-secure database, 레비덴큐, 카프카 등과 통신할 때 먼저 처리 후 작업이 끝나지 않더라도, 다른 작업에 착수하는 형태 : 분산 시스템의 핵심.

> 💡 비동기와 느슨한 결합, eventual consistancy(궁극적 일관성) : 데이터베이스-어플리케이션 상황에서, 어플 요청을 받고 디비가 요청을 끝낼 때까지 기다리는 것이 아니라, 중간에 메세지 큐와 같은 것이 있어서 여기 메세지만 던지고 끝냄. 백그라운드 프로그램(워커)들이 메세지 큐에서 메세지를 꺼내서 처리하는 것. 곧, 던지기만 하고 다른 일에 집중하는 것.

> 💡 서비스를 고가용을 위해 여러 개로 펼쳐놓았을 때, 효율성이 있느냐? = 연속되는 메세지의 스트림으로 처리 / 매번 처리가 끝날 때까지 기다릴 수 없기 때문에 비동기가 중요해진 것. 그로 인해 특정 서비스에 문제가 발생하더라도 다른 어플리케이션은 계속 가용한 상태를 유지.

### 🔰Reactive System과 Reactive Programming

- Reactive System은 복수개의 서비스로 이루어진 분산 시스템이 정상 상황 뿐만 아니라 장애 상황에서도 일관된 동작(consistent & responsive)을 보장해 주는 시스템
- Microservice가 지향하는 방향
- 인프라간의 상호 운용성에 집중(웹서버, 데이터 저장소 드라이버 및 웹 프레임워크)
- 논-블러킹 백프레셔를 제공하는 비동기 스트림 프로세싱 표준
- 단순한 API 구조
    - Back pressure가 지원되는 Publisher + Subscriber(혹은 Subscription)
    - Java 9의 java.util.concurrent.Flow 으로 다시 패키징 됨

## 4) 리액티브 스트림

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/26.jpg)

### [1] 목적

- 논블로킹 백프레셔로 비동기 스트림 처리를 위한 표준을 제공하는 것.

### [2] 스펙

- 인프라간의 상호 운용성에 집중(웹서버, 데이터저장소 드라이버 및 프레임워크) : 서로 다른 웹 애플리케이션들이 상호 연동될 수 있어야 함.
- 논플러킹 백프레셔를 제공하는 비동기 스트림 프로세싱 표준 : 비동기 처리를 위한 데이터 도구에 대한 선택(`레디스`, `카프카`, `카우치베이스`, `포스트그레스큐엘`, `몽고디비`, `클라우드 심플 큐`, `클러우드 펍 서브`)이 많아짐에도 불구하고 메세지 드리븐을 처리하기 위한 인프라 간 상호 운용성이 메세지 드리븐 시스템에선 중요하기 때문에 스프링 리액트에서 제공하는 것이 중요함.
- 블로킹과 논블로킹 : 요청이 왔을 때 그 응답을 주기 위해 계속 들고 기다리는 상태이냐, 바로 응답을 주고 다른 상태나 스레드에서 처리를 할 수 있도록 하는, meantime내에서 처리될 수 있다면 처리 방법을 바꾸는 것이 논블로킹(+비동기).
- 백프레셔 : 스트림을 사용하다 보면 Subscriber가 어떤 상태인지 관계없이 Publisher에게 계속 메세지를 던질 수 있음. 수용할 수 있는 만큼만 이벤트를 수용하고 나머지는 거부하는 것.

### [3] **요약**

> 💡 리액티브 스트림은 JVM을 위한 스트림 지향 라이브러리의 표준 및 규격이며, 다음과 같은 기능을 제공함.<br>
> ① 무한한 수의 요소를 처리,
> ② 순서대로,
> ③ 컴포넌트 간 요소를 비동기적으로 전달함,
> ④ 필수적인 논블로킹 백프레셔를 사용해서!

### [4] API 구성요소

> 💡 API는 리액티브 스트림 구현에서 제공하는 데 필요한 다음과 같은 구성 요소로 구성됨.<br>
> ① Publisher<br>
> ② Subscriber<br>
> ③ Subscription<br>
> ④ Processor

- Publisher는 잠재적으로 제한되지 않는 수의 시퀀스 요소를 제공하는 공급자며, Subscriber로부터 수신한 요구에 따라 게시(publishing)함.
- `Publisher.subscribe(Subscriber)` 호출에 대한 응답으로, `Subscriber`에 대한 메서드 중 호출 가능한 시퀀스는 다음 프로토콜에 의해 제공됨.

```jsx
onSubscribe onNext* (onError | onComplete)?
```

- 즉, `Subscription`이 취소되지 않는 한, 항상 `onSubscribe`로 작업 처리
- `onNext` (Subscriber가 요청한) : 무한 작업 처리
- `onError` : 장애가 발생한 경우
- `onComplete` : 또는 더 이상의 요소를 사용할 수 없는 경우, 작업 종료

### [5] 용어 사전

| Signal | 명사 : onSubscribe, onNext, onComplete, onError, request(n),<br>cancel 중 하나를 가리킴. 동사 : 신호 호출/실행. |
| Demand | 명사 : Publisher가 아직 전달(완료)하지 않은 Subscriber가 요청한 총<br>요소 수. 동사 : 더 많은 요소를 요구하는 행위. |
| Synchronous<br>(ly, 동기) | calling Thread에서 실행 |
| Thread-safe | 프로그램의 정확성을 보안하기 위해 외부 동기화를 요구하지 않고<<br>동기식 또는 비동기식으로 안전하게 호출할 수 있음. |
| Serial(ly) | 신호 체계에서 겹치지 않음. JVM의 맥랙에서, 객체에 있는 메서드들에<br>대한 호출은 해당 호출들 사이에 발생 전 관계가 있는 경우에만 연속<br>됨(호출이 겹치지 않는다는 의미도 포함). 호출이 비동기적으로 수행<br>될 때, 발생 전 관계를 설정하기 위한 조정은 atomics, monitors, lock과<br>같은 기술을 사용하여 구현되어야 함. |
| NOP | 호출 스레드에 감지할 수 있는 영향이 없는 실행은 여러 번 안전하게<br>호출할 수 있음. |
| Terminal state<br>(터미널 상태) | Publisher에 대한 의미 : onComplete나 onError 신호가 발생했을 때.<br>Subscriber에 대한 의미 : onComplete나 onError 신호를<br>받았을(수신) 때. |
| Non-obstructing<br>(방해 방지) | 최대한 빨리 실행되는 호출 스레드에 대한 품질 설명. 즉, 예를 들어,<br>호출자의 실행 스레드를 지연시킬 수 있는 과도한 계산과 다른 것들을<br>피하는 것을 의미. |
| Responsivity<br>(응답성) | 호출에 대한 대응 준비와 기량. 본 문서에서는 각각 다른 구성요소가<br>반응에 대한 서로의 기량을 손상시키지 않아야 한다는 것을 나타냄. |
| Return normally | 선언된 유형의 값만 호출자에게 반환. Subscriber에게 실패를 알리는<br>적법한 방법은 onError 메서드를 사용하는 것이 유일. |

> 💡 그 외 용어 정리<br>
> - Publisher = Subject = Observable = Producer
> - Subscriber = Observer = Consumer
> - 시퀀스 = 스트림
> - Publisher는 Subscriber에게 Event를 Push한다.


### [6] 사양

- ReactiveCrudRepository.java

```java
/**
 * 특정 유형의 리포지토리에서 일반 CRUD 작업을 위한 인터페이스. 리액티브 패러다임을 따름. 
 * 그리고 리액티브 스트림에 구축된 프로젝트 리액터 타입을 사용함.
 */
@NoRepositoryBean
public interface ReactiveCrudRepository<T, ID> extends Repository<T, ID> {
	/**
	 * Saves all : 모든 엔티티를 저장함
	 *
	 * @params : entityStream은 NULL일 수 없음.
	 * @returns : Flux로 저장된 엔티티를 내보냄.
	 * @throws : IllegalArgumentException - entityStream이 NULL일 경우 발생하는 예외.
	 */
	<S extends T> Flux<S> saveAll(Publisher<S> entityStream);

	/**
	 * Publisher에서 제공한 ID를 기준으로 엔티티 검색.
	 *
	 * @params : id 는 NULL일 수 없음. 처음 내보낸 요소를 사용해 찾기 쿼리 수행.
	 * @returns : 해당 id에 대한 쿼리를 찾으면 Mono 형식으로 리턴, 찾지 못하면 {Mono.empty} 형식으로 리턴.
	 * @throws : IllegalArgumentException - 주어진 id가 NULL일 경우 예외 발생.
	 */
	Mono<T> findById(Publisher<ID> id);
}
```

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/27.png)

- Publisher.java

```java
/**
 * Publisher는 잠재적으로 제한되지 않는 수의 시퀀스 요소(Subscriber로부터 요구받은)를 제공함.
 * Publisher는 여러 Subscriber의 요청을 다양한 시점에 동적으로 제공할 수 있음.
 *
 * @Type parameters: <T> - 전달된 요소의 유형.
 */
public interface Publisher<T> {
    /**
     * 데이터 스트리밍 시작을 위한 Publisher 요청.
     * "factory method"라고 하며, 새 Subscription를 시작할 때마다 여러번 호출할 수 있음.
     * 각 Subscription 은 단일Subscriber에 대해서만 작동.
     * Subscriber는 단일 Publisher를 한번만 구독.
     * Publisher가 subscription 시도를 거부하거나 동작에 실패하면 {Subscriber.onError}로 에러 신호를 보냄.
     * @params : s - 이 Publisher의 신호를 사용할 Subscriber
     */
    public void subscribe(Subscriber<? super T> s);
}
```

- Subscriber.java

```java
/**
 * Subscriber 인스턴스를 {Publisher.subscribe(Subscriber)}에 전달한 후 {onSubscribe(Subscription)}에 대한 호출을 한 번 수신함.
 * {Subscription.request(long)}를 호출할 때까지 추가 알림이 수신되지 않음.
 * demand 신호 후:
 * - {Subscription.request(long)}에서 정의된 최대 수까지 {onNext(Object)}을 하나 이상 호출
 * - 추가 이벤트가 전송되지 않는 터미널 상태를 나타내는 {onError(Throwable)}나 {Subscriber.onComplete()}의 단일 호출.
 * Subscriber 인스턴스에서 더 많은 작업을 처리할 수 있을 때마다 {Subscription.request(long)}을 통해 demand를 알릴 수 있음.
 *
 * @Type parameters : <T> - 전달된 요소의 유형.
 */
public interface Subscriber<T> {
    /**
     * {Publisher.subscribe(Subscriber)}를 call한 다음 호출.
     * {Subscription.request(long)}이 호출될 때까지 데이터 흐름이 시작되지 않음.
     * 추가 데이터를 원할 때마다 {Subscription.request(long)}을 call하는 것은 Subscriber인스턴스의 책임.
     * Publisher는 {Subscription.request(long)}에 대한 응답으로만 알림을 보냄.
     * @params : s - {Subscription.request(long)}를 통해 데이터를 요청할 수 있는 Subscription.
     */
    public void onSubscribe(Subscription s);

    /**
     * 게시자가 {Subscription.request(long)}에 대한 요청에 응답하여 보낸 데이터 알림.
     * 
     * @params : t - 전달된 요소의 유형
     */
    public void onNext(T t);

    /**
     * 실패한 터미널 상태.
     * {Subscription.request(long)}가 다시 호출되더라도 추가 이벤트는 전송되지 않음.
     * @params : t - 예외 신호
     */
    public void onError(Throwable t);

    /**
     * 성공한 터미널 상태.
     * {Subscription.request(long)}가 다시 호출되더라도 추가 이벤트는 전송되지 않음.
     */
    public void onComplete();
}
```

- Subscription.java

```java
/**
 * Subscription : Publisher를 구독하는 Subscriber의 일대일 라이프사이클을 나타냄.
 * 단일 구독자가 한 번만 사용할 수 있음.
 * 데이터에 대한 신호 요구와 요구 취소(및 리소스 정리 허용)에 모두 사용됨.
 *
 */
public interface Subscription {
    /**
     * 이 메서드를 통해 demand가 표시될 때까지 Publisher는 이벤트를 보내지 않음.
     * 자주, 그리고 필요할 때마다 호출할 수 있지만, 미해결된 누적 demand가 Long.MAX_VALUE 상태나 그 이상이 될 경우,
		 * Publisher에 의해 "effectively unbounded(효과적으로 제한되지 않음)" 처리될 수 있음. 
     * 요청된 것은 Publisher에 의해 보내질 수 있으므로, 안전하게 처리 할 수 있는 것에 대한 demand에만 신호를 보냄.
     * 스트림이 종료되는 경우, Publisher는 요청된 것보다 적게 보낼 수 있으나 {Subscriber.onError(Throwable)} 또는 {Subscriber.onComplete()}를 사용해서 보내야 함.
     * 
     * @params : n - upstream Publisher의 요청에 대한 요소 수
     */
    public void request(long n);

    /**
     * Publisher에게 데이터 전송을 중지하고 리소스를 정리하도록 요청.
     * 취소 call이 된 후에도 이전까지의 demand를 충족시키기 위해 데이터를 보낼 수 있음.
     */
    public void cancel();
}
```

- Processor.java

```java
public interface Processor<T, R> extends Subscriber<T>, Publisher<R> {
}
```

### [7] 흐름

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/28.png)

1. Subscriber 가 subscribe 메소드를 통해 Publisher 에게 구독을 요청.
2. Publisher 는 `onSubscribe` 메소드로 Subscriber 에게 Subscription 를 전달.
3. Subscriber 는 `Subscription.request` 을 통해, 자신에게 데이터를 흘려줄 것을 요구.
4. Publisher 는 Subscription 를 통해 `Subscriber.onNext`로 데이터를 전달.
4-1. Subscriber 내부에 Subscription를 set하였기 때문 (2번)
5. 전달이 잘 끝났으면, `onComplete`, 오류났다면 `onError` 로 종료.

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/29.png)

> 💡 Publisher가 어떤 작업 처리를 위해 Subscriber에 메세지를 던짐. 이 때 작업 지연이 발생한 경우 : mx 큐에 메세지를 저장함. 그 사이에 subscriber를 더 확장시킨다던지 하는 방법으로 작업 처리 가능.

### [8] Processor : Publisher 와 Subscriber 를 혼합

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/30.png)

- 이 둘 사이에서 몇 가지 처리 단계를 유연하게 추가할 수 있다.
- 하나의 subscriber 의 결과물을 다른 subscriber 에 그대로 전달하거나, 변형할 때도 사용할 수있다. 마치 새로운 Publisher 처럼 행동하는 것이다.
- ex1) 구독자 중 기준에 일치하는 구독자들에게만 전송한다던지
- ex2) 멀티캐스팅

## 7) 스프링 리액터의 Publisher: Flux와 Mono

- 스프링 리액터는 Flux와 Mono 두 가지 Publisher를 제공하고 있음.
- 차이 : 발행할 수 있는 데이터 개수
    - Mono : 0또는 1개의 데이터 발행
    - Flux : 0개 이상의 데이터 발행

### 🔰 Reactive Streams : Mono - sequence of 0...1

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/31.png)

- 하나의 id값을 가지고 이것을 reactive repository에 검색해서 리턴을 받고자 함
- 하나의 값 또는 true/false

```java
Mono<String> emptyMono() {
	return Mono.empty();
}

Mono<String> fooMono() {
	return Mono.just("foo");
	// 실제 값 발생은 구독(subscription) 시점에 이뤄지며, 이는 Mono.subscribe(Consumer) 메서드를 이용해 구현
	// foo를 값으로 갖는 1개의 next 신호를 발행. 마지막에 complete 신호를 발행해서 시퀀스 종료.
	// (최대 발행할 수 있는 값은 1개)
}

Mono<Integer> seq = Mono.just(1); // Integer 값을 발생하는 Mono 생성
seq.subscribe(value -> System.out.println("데이터 : " + value)); // 구독
// {데이터 : 1}

Mono<String> toUpperCase(Mono<String> mono) {
	return mono.map(String::toUpperCase);
}
```

### 🔰 Reactive Streams Flux - sequence of 0...N

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/32.png)

- 데이터를 연속적으로 받고자 하는 경우
- 0개 이상의 next 신호 발행, complete나 error 신호를 발행하거나 발행하지 않을 수 있음.

```java
Flux<String> emptyFlux() {
	return Flux.empty();
}

Flux<String> fooBarFluxFromValues() {
	return Flux.just("foo", "bar");
	// foo, bar를 값으로 갖는 2개의 next신호를 발행, 마지막에 complete신호를 발행해서 시퀀스 종료
}

Flux<String> fooBarFluxFromList() {
	return Flux.fromIterable(Arrays.asList("foo", "bar"));
}

Flux.just(1, 2, 3, 4)
  .collectMap(x -> x % 2) // Map 콜렉션으로 모으기
  .subscribe(map -> System.out.println(map));
	// 실제 값 발생은 구독(subscription) 시점에 이뤄지며, 이는 Flux.subscribe(Consumer) 메서드를 이용해 구현
	// 실제 map에는 2개의 데이터만 저장
	// {0=4, 1=3}

Flux<String> toUpperCase(Flux<String> flux) {
	return flux.flatMap(s -> Mono.just(s.toUpperCase()));
	// map, flatMap 연산자는 요소(element)를 변환시킴
	// map : 동기적, 논블로킹 방식
	// flatMap : 비동기적, 논블로킹 방식
}
```

- `**map` : 각각의 item 들이 동기적, non-blocking 방식으로 적용됨. 단일 스트림 안의 요소를 원하는 특정 형태로 변환할 수 있음.**

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/33.png)

- `**flatMap` : 비동기적, non-blocking 방식으로 적용됨. 스트림의 형태가 배열과 같을 때, 모든 원소를 단일 원소 스트림으로 반환할 수 있음.**

![](https://raw.githubusercontent.com/abarthdew/trouble-shooting-references/main/images/java/34.png)

### 🔰 Reactive Repository

```java
public interface ReactivePersonRepository extends ReactiveCrudRepository<Person, String> {
	Flux<Person> findByLastname(Mono<String> lastname);
	Mono<Person> findByFirstnameAndLastname(String firstname, String lastname);
}

@EnableReactiveMongoRepositories
pulic class AppConfig extends AbstractReactiveMongoConfiguration {}
```

## 6) 그 외

### 🔰 Reactive Streams Implementation

- RxJavaReactiveStreams with RxJava 1.x 2.x
- Project Reactor
- Vert.x
- Akka Streams
- Slick
- web flux : 스프링의 새로운 모듈

### 🔰 Reactive Spring Data Repository(kay M2)

- MongoDB
- Cassandra
- Redis
- Cougchbase

# 색인과 출처
### 2-1.  Reactive Spring
- [영상 주소](https://www.youtube.com/watch?v=UIrwrW5A2co&list=PLdHtZnJh1KdZ6NDO9zc9hF4tONDLTSEUV&index=13)
- https://www.youtube.com/watch?v=1F10gr2pbvQ&t=894s
- https://sjh836.tistory.com/182
- https://brunch.co.kr/@springboot/155
- https://github.com/reactive-streams/reactive-streams-jvm/blob/master/README.md#specification
- mono, flux : https://javacan.tistory.com/entry/Reactor-Start-1-RS-Flux-Mono-Subscriber
- mono, flux : https://javacan.tistory.com/entry/Reactor-Start-8-Aggregation
- mono, flux : https://javacan.tistory.com/entry/Reactor-Start-2-RS-just-generate
- map, flatMap : https://madplay.github.io/post/difference-between-map-and-flatmap-methods-in-java
- map, flatMap : https://hyungjoon6876.github.io/jlog/2018/07/24/spring-reactor.html
- 개념 : https://sjh836.tistory.com/185
- https://gunju-ko.github.io/reactive/2018/07/18/Reactive-Streams.html