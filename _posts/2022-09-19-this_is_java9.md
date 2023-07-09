---
title: 9. Nested Class/Interface, Anonymous Object
date: 2022-09-19
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[9.1 중첩 클래스와 중첩 인터페이스란?](#91-중첩-클래스와-중첩-인터페이스란)   
[9.2 중첩 클래스](#92-중첩-클래스)   
[9.3 중첩 클래스의 접근 제한](#93-중첩-클래스의-접근-제한)   
[9.4 중첩 인터페이스](#94-중첩-인터페이스)   
[9.5 익명 객체](#95-익명-객체)   
[참고자료](#참고자료)   

## **9.1 중첩 클래스와 중첩 인터페이스란?**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9.png)

- 외부에서 사용하지 않고, 해당 클래스나 인터페이스 안에서만 사용

## **9.2 중첩 클래스**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(1).png)

- 멤버 클래스: 클래스 선언부에 선언된 중첩 클래스
    - 인스턴스 멤버 클래스: 객체 A가 생성이 되어야 클래스 B를 쓸 수 있음
    - 정적 멤버 클래스: 객체 A가 생성되지 않아도 클래스 B 사용 가능
- 로컬 클래스: 메서드 안에서 선언된 중첩 클래스(static을 붙일 수 없음)
- 중첩 클래스의 바이트 코드 파일: 멤버 클래스일 경우 `$`만 붙고, 로컬 클래스일 경우 `$`에 순번이 붙음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(2).png)

- 인스턴스 멤버 클래스는 바깥 클래스 A가 생성되어야 클래스 B를 사용할 수 있음
- 중첩 클래스 B에서 static 필드, static 메서드 사용 불가

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(3).png)

- 바깥 객체인 A가 생성되지 않아도, C를 사용할 수 있음
- `new A.C();`와 같이, A 객체를 생성하지 않고 바로 A 클래스를 통해 C클래스에 접근 가능
- static field2, static method2는 클래스로 바로 접근 가능

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(4).png)

- 바깥 메서드를 벗어나 사용할 수 없음
- 중첩 클래스 내부에 정적 멤버를 사용할 수 없음
- 메서드 안에서 중첩 클래스 선언, 사용
- 중첩 클래스 선언 시 상속을 받아 부모의 멤버를 사용할 수도 있음

## **9.3 중첩 클래스의 접근 제한**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(5).png)

- 정적 필드 초기화
    - `static B field3 = new B();`: 에러 ⇒ 인스턴스 멤버 클래스 B는 A 객체가 생성되어야 사용 가능하기 때문에
    - `static C field4 = new C();`: 정상 작동 ⇒ C는 static으로 선언된 정적 멤버 클래스므로 A 객체 생성 전에도 사용 가능
- 정적 메서드
    - `B var1 = new B();`: 에러 ⇒ static void method2()는 정적 메서드로, A 객체 생성 없이도 사용 가능하지만 B는 A 객체가 생성되어야 사용 가능하기 때문
    - `C var2 = new C();`: 정상 작동 ⇒ C는 static으로 선언된 정적 멤버 클래스므로 A 객체 생성 전에도 사용 가능
- 중첩 클래스 중 멤버 클래스는 바깥 클래스(A)의 필드와 메서드에서 사용 가능
    - 인스턴스 필드와 인스턴스 메서드는 인스턴스 멤버 클래스, 정적 멤버 클래스 전부 사용 가능
    - 정적 필드와 정적 메서드는 정적 멤버 클래스만 사용 가능

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(6).png)

- 바깥 클래스(A)에 선언된 필드, 메서드를 중첩 클래스 내부에서 어떻게 접근해서 사용하는가?
- B는 인스턴스 멤버 클래스, C는 정적 멤버 클래스
- B는 A의 멤버를 전부 사용 가능
- C는 A가 생성되지 않아도 사용 가능하기 때문에, A 객체가 필요한 인스턴스 멤버는 C의 method() 안에서 사용 불가

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(7).png)

- 메서드 내에서 중첩 클래스를 선언하려면 메서드의 매개변수와 메서드 안 로컬 변수는 final 키워드를 붙여야 함
    
    ⇒ 메서드는 실행이 완료되면 메서드 안에서 선언된 매개변수, 로컬 변수는 스택 메모리에서 제거가 됨
    
    ⇒ 로컬 클래스의 객체가 생성되어 힙 메모리에 만들어지면, method1()의 종류와는 별도로 자기 자신의 메서드(method())를 계속 실행할 수 있음
    
    ⇒ 만약 method() 에 반복문이 있을 경우, 반복문이 실행되는 상황에서 매개변수와 로컬 변수를 계속 사용하게 됨
    
    ⇒ 그런데 이 변수가 사라져 버리면 오류가 생기기 때문에 fianl을 붙여 로컬 클래스 안쪽으로 복사해서 사용함
    
    ⇒ **자바 8에서는 final 키워드를 생략해도 됨(붙이지 않아도 자동으로 final로 해석함)**
    
- 자바 7과 8의 매개변수, 로컬 변수 차이점
    - `자바 7`에서는 메서드의 매개변수와 로컬 변수를 중첩 클래스의 메서드 안에 지역 변수로 복사해서 사용
    - `자바 8`에서는 메서드의 매개변수와 로컬 변수를 중첩 클래스의 필드로 복사해서 사용
- 로컬 클래스에서 메서드의 매개변수나 로컬 변수를 사용할 때, final 성격을 띄므로 값 변경 불가

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(8).png)

## **9.4 중첩 인터페이스**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(9).png)

- 중첩 인터페이스: 클래스 안에 선언된 인터페이스
- `OnClickListener` 인터페이스는 `Button` 클래스를 벗어나서는 사용하지 않으며, `Button`과 아주 밀접한 관계임
- 보통 UI 프로그램에서, 이벤트 처리를 위해 중첩 인터페이스를 사용
- Button을 사용자가 클릭했을 때, onClick() 메서드를 실행하기 위한 중첩 인터페이스
- setter에 매개변수로 들어오는 OnClickListener의 구현 객체가 무엇인지에 따라 touch() 메서드의 결과가 달라질 수 있음 ⇒ onClick() 메서드를 재정의할 수 있기 때문

## **9.5 익명 객체**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(10).png)

- 익명 객체도 로컬 클래스로부터 만들어진 인스턴스라고 할 수 있음
- 명시적으로 클래스를 선언하는 게 아니라, new 연산자를 이용해 선언과 동시에 객체를 만드는 것
- 이름이 없는 객체
- 즉, 로컬 클래스처럼 선언되지 않고, 바로 객체를 생성하며 클래스를 정의하는 형태
- 넓은 의미에서 중첩 클래스라고 할 수 있음

```java
부모 클래스 [필드|변수] = new 부모클래스(매개값, ...) {
  // 필드
  // 메서드
};
```

- 부모 클래스를 상속해서 {} 블록에 자식 클래스를 만들겠다 => 자식 클래스 이름이 없기 때문에 익명 클래스
- 위 공식은 4부분으로 쪼갤 수 있음
    1. 자식 클래스 선언부: `{}` 블록에 코드 작성해서 자식 클래스 선언
    
    ```java
    {
      // 필드
      // 메서드
    };
    ```
    
    2. new 키워드: 그 후 `new` → 자식 클래스로부터 객체가 만들어지고
    
    ```java
    = new
    ```
    
    3. 부모 생성자 부분: 부모 객체는 아래 부분을 실행해서 만들어짐
    
    ```java
    부모클래스(매개값, ...)
    ```
    
    4. 부모 타입 변수 부분: new 로 생성된 자식 객체를 아래 부분에 대입
    
    ```java
    부모클래스 [필드|변수]
    ```
    
- 익명 객체 선언부 안에는 새로운 필드, 메서드 뿐만 아니라 부모 객체도 재정의 가능
    
    ```java
    Parent field = new Parent() {
      int childField; // 새로운 필드
      void childMethod() {} // 새로운 메서드
      @Override
      void parentMethod() {} // 부모의 메서드 재정의
    }
    ```
    
    ⇒ {} 블록 안에 만든 익명 객체를 Parent 타입 field 변수에 대입
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(11).png)

- 로컬 변수 localVar로 부모 타입 선언, 초기값으로 익명 자식 객체를 대입하는 경우
- new Parent()로 객체를 생성하는데, {} 블록이 있기 때문에, 단순한 생성자 호출이 아닌, 익명 자식 객체를 만들어 대입한다는 것

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(12).png)

- new Parnet()로, Parent를 만드는 것 같이 보이지만, 자식 객체를 만들어 method1() 메서드의 매개값으로 넘김

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(13).png)

- 익명 객체를 대입한 Parnet 타입 field를 사용해 method() 안에서 사용할 수 있을까?
    
    ⇒ 익명 자식 객체는 이름이 없으므로 자기 자신의 클래스 타입 변수를 만들지 못함
    
    ⇒ 무조건 부모 타입으로 대입되어 사용해서 함
    
    ⇒ 부모 타입 변수로 접근 가능한 것만 사용 가능 → Parent 클래스에 정의한 것만 사용할 수 있음
    
    ⇒ 즉, parentMethod()는 Parent에도 있는 메서드므로 이것만 사용 가능
    
- 외부에서 사용하지 못하는 익명 자식 객체 내에서 선언된 필드, 메서드의 존재 이유는? ⇒ 재정의된 메서드 내에서 사용하기 위함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(14).png)

- 인터페이스는 생성자가 없기 때문에, `new 인터페이스()` 에서 `인터페이스()`는 생성자가 아님 ⇒ `인터페이스()`는 `{}`에서 생성된 클래스의 생성자를 호출하는 것
- 보통 `{}`에는 인터페이스에 정의된 추상메서드를 재정의하는 내용이 들어감
- `{}` 안에는 인터페이스의 추상 메서드를 반드시 재정의해야 함 ⇒ 결국 `{}`에 구현 객체를 만들어 인터페이스 변수에 대입한 것

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/9(15).png)

## 참고자료

[강의교안_9장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_9%EC%9E%A5.ppt)