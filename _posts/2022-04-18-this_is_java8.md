---
title: 8. Interface, polymorphism
date: 2022-04-18
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[8.1 인터페이스의 역할](#81-인터페이스의-역할)   
[8.2 인터페이스 선언](#82-인터페이스-선언)   
[8.3 인터페이스 구현(1)](#83-인터페이스-구현1)   
[8.3 인터페이스 구현(2)](#83-인터페이스-구현2)   
[8.4 인터페이스 사용](#84-인터페이스-사용)   
[8.5 타입변환과 다형성](#85-타입변환과-다형성)   
    [- 필드 타입으로 인터페이스 사용 시 다형성이 구현되는 방법](#필드-타입으로-인터페이스-사용-시-다형성이-구현되는-방법)   
[8.6 인터페이스 상속](#86-인터페이스-상속)   
[8.7 디폴트 메소드와 인터페이스 확장](#87-디폴트-메소드와-인터페이스-확장)   
[참고자료](#참고자료)   

## **8.1 인터페이스의 역할**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8.png)

- 개발 코드가 어떤 객체를 이용해 메서드를 호출하려고 한다
    
    → 개발 코드가 객체를 직접 이용하는 게 아니라, 중간에 인터페이스를 둠
    
    → 인터페이스가 객체의 메서드를 호출하고, 리턴값을 넘겨줌
    
    → 개발 코드는 인터페이스를 통해 메서드 호출하고, 값을 리턴받음
    
- 개발 코드는 뒤편에 있는 객체가 어떤 객체인지 상관할 필요가 없음
- 그러므로, 객체에 문제가 있을 경우 이것만 다른 객체로 변경할 수 있고, 인터페이스만 바라보는 개발 코드는 문제 없음
- 인터페이스의 역할: 개발 코드를 수정하지 않고, 내부에 실제 사용되는 객체를 쉽게 이용하거나 변경할 수 있도록 도와줌

## **8.2 인터페이스 선언**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(1).png)

- 자바의 상수: static final 타입 상수명
- 인터페이스의 모든 필드는 static final 특성을 가지고 있음 ⇒ 앞에 static final을 붙이지 않아도 기본적으로 상수 특성을 받음
- 상수 초기값 필수
- 인터페이스의 메서드도 선언만 있고 실행 블록은 없음 ⇒ 기본적으로 abstract 메서드로 해석됨
- default, static 메서드: 자바 8부터 추가
    - default 메서드: 메서드 실행 블록이 있음, 인터페이스에서 정의된 메서드지만 실행하려면 인터페이스 구현 객체가 필요
    - static 메서드: 메서드 실행 블록이 있음, 인터페이스를 통해 바로 호출 가능

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(2).png)

- 데이터를 저장하지 않기 때문에: 실행 중 데이터를 저장하지 않음
- static {}과 같은 정적 블록을 작성할 수 없음
- 때문에, 상수(필드)값은 선언과 동시에 초기화 필수

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(3).png)

- 개발 코드 → 인터페이스로 메서드 호출
    
    → 인터페이스는 자기가 참조하는 객체로 가서 인터페이스의 메서드를 재정의한 메서드를 실행시킴
    
    → 인터페이스는 객체에서 리턴값을 받아 개발코드로 리턴
    
- 인터페이스 내 추상메서드는 `어떻게 호출한 것인가`에 대한 방법만 제시함 ⇒ 실제 실행되는 코드는 객체가 가진 재정의된 메서드

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(4).png)

- default 메서드: 실행 블록을 가지는 인터페이스 메서드

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(5).png)

- 기본적으로 public 접근 제한이므로 생략하더라도 컴파일 과정에서 붙음

## **8.3 인터페이스 구현(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(6).png)

- 인터페이스 만으로는 실제 동작하는 프로그램을 만들 수 없음
- 인터페이스를 통해서 객체를 사용해야 하기 때문에, 객체가 있어야 함 ⇒ **인터페이스의 구현 객체**
- 인터페이스의 구현 객체: 인터페이스의 추상메서드를 실제적으로 재정의한 객체
- 구현 클래스: 인터페이스의 구현 객체를 생성하는 클래스
- 과정: 구현 클래스 생성 → 구현 객체 생성 → 이 객체를 인터페이스에 대입 → 개발 코드에서 인터페이스를 사용해 객체의 재정의된 메서드 호출, 리턴 값 받음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(7).png)

- 위의 예시 코드에서처럼, RemoteControl 인터페이스에는 3개의 메서드가 정의되어 있는데, Television에는 그 일부인 2개의 메서드만 재정의 되었다면, Television 클래스는 `추상클래스`임(abstract)
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(8).png)
    
    ⇒ 재정의되지 않은 RemoteControl의 setVolume() 메서드는 `추상 메서드`임
    
- 인터페이스의 모든 메서드는 public 접근 제한을 가짐

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(9).png)

- 인터페이스도 하나의 타입이기 때문에, 인터페이스를 선언 후 간접적으로 구현 객체를 대입해 이용 가능
- 인터페이스를 구현한(implements) 어떤 구현 객체라도 인터페이스에 대입해 이용 가능- 

## **8.3 인터페이스 구현(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(10).png)

- 익명 구현 객체: 이름이 없는 구현 객체

```java
인터페이스 변수 = new 인터페이스() {
  // 인터페이스에 선언된 추상 메서드의 실제 메서드 선언
  // … 
};
```

- 코드에서 직접 이름이 없는 클래스를 만들고, 이 클래스로 객체를 생성한 다음 인터페이스 변수에 대입 가능
- 명시적 구현: 소스 파일을 생성하고, 그 안에 클래스를 선언하는 것
- 인터페이스는 객체의 사용 방법을 기술한 것이지, 객체 자체를 만들기 위한 설계도가 아니므로, new로 생성할 수 없음
- 하지만, `new 인터페이스() {…}`는 인터페이스의 생성자 호출이 아니라, `{…}` 안에 **클래스를 선언하겠다**는 뜻
- 즉, `{…}` 안에 **필드, 생성자, 메서드를 선언하겠다**는 뜻
- `{…}` 블록 안에서 선언된 것들은 블록 안에서만 사용되며, 블록을 벗어나서, 인터페이스 변수로 접근 불가
    
    ⇒ 인터페이스 변수가 접근할 수 있는 범위는 인터페이스에 선언된 추상 메서드, default 메서드 등에 국한되기 때문
    
- 결론적으로, `new 인터페이스() {…}` 는 인터페이스의 생성자를 호출하겠다는 뜻이 아니라, `{…}` 에 선언된 클래스의 생성자를 호출하겠다는 뜻
- 정리: `{…}`에 선언된 클래스가 인터페이스를 구현한다 ⇒ `{…}`에 선언된 클래스의 기본 생성자를 호출한 뒤 객체를 만들어서 인터페이스 변수에 대입한다
- 익명 구현 객체에 대한 바이트 코드 파일: 이 클래스 선언에 대한 바이트 코드 파일이 생성됨
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(11).png)
    
    - window-show view - navigator
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(12).png)
    
    - `RemoteControlExample$1.class`: RemoteControlExample에 선언된 익명 클래스에 대한 바이트코드 파일
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(13).png)
    
    - `RemoteControlExample$2.class`: 익명 클래스를 하나 더 생성해 rc2 인터페이스 변수에 하나 더 대입하면 버전 2가 만들어짐

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(14).png)

- 인터페이스 A로 객체를 사용할 수도 있고, 인터페이스 B로 객체를 사용할 수도 있음
- 해당 클래스 블록 안에는 인터페이스 A, B가 가진 모든 추상 메서들 재정의해서 실제 클래스로 가지고 있어야 함
- 즉, 이 객체는 두 개의 인터페이스로 사용이 가능

## **8.4 인터페이스 사용**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(15).png)

- 인터페이스는 다양한 곳에서 사용 가능
- 인터페이스에 구현 객체를 대입하는 위치가 다양할 수 있음 ⇒ 어디서 대입됐냐에 따라 인터페이스 사용 위치가 달라질 수 있음
- 필드, 생성자의 매개변수, 메서드 구현 블록 내 로컬 변수, 메서드의 매개 변수로 사용 가능
    
    ⇒ 이 인터페이스를 구현한 어떠한 객체든 대입 가능
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(16).png)

- 인터페이스 변수에 구현 객체 대입 후
    
    → 개발 코드에서 추상 메서드를 인터페이스를 통해 호출
    
    → 구현 객체의 재정의된 실제 메서드 호출됨
    
- 인터페이스는 개발 코드와 구현 객체의 중간에서 접점 역할, 즉 메서드 호출을 연결해 주는 역할을 함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(17).png)

- 자바 8에서 추가됨
- 인터페이스를 선언할 때, default 키워드를 넣고 메서드 선언 가능
    
    ⇒ 추상 메서드와는 달리 실행 블록을 가지고 있음
    
- default 메서드는 인터페이스 만으로 사용할 수 없음
    
    ⇒ setMute() 메서드를 호출하기 위해 인터페이스 객체로 바로 호출 불가
    
    ```java
    RemoteControl.setMute(true); // X
    ```
    
    ⇒ 구현 객체가 반드시 인터페이스 변수에 대입되어야 사용 가능
    
    ```java
    RemoteControl rc = new Television();
    rc.setMute(true);
    ```
    
- default 메서드는 구현객체(Television)의 인스턴스 멤버라고도 볼 수 있음
    
    ⇒ 구현 객체를 만들 때 인터페이스에 있는 default 메서드가 추가됨
    
- 정적 메서드 선언:
    - 자바 8에서 추가
    - 일반 클래스의 static 메서드 선언과 동일
    - 구현 객체 필요 없이, 인터페이스 객체 만으로 바로 사용 가능

## **8.5 타입변환과 다형성**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(18).png)

- 상속을 이용해 다형성을 구현하듯, 인터페이스를 이용해 다형성 구현 가능 ⇒ 오히려 인터페이스를 이용한 다형성 구현이 더 많이 사용됨
- 인터페이스에도 타입 변환이 있음
- 클래스 A, B에 동일한 이름의 메서드가 있을 경우, 인터페이스 변수에 대입되는 클래스 타입만 바꾸면 그 이외 코드를 바꿀 필요가 없음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(19).png)

- 인터페이스를 매개 변수로 설정하면, 여러가지 구현 객체를 사용 가능

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(20).png)

- 구현 객체를 인터페이스 변수에 넣어 자동 타입 변환시킴
- 점선 → : 인터페이스 상속
- 실선 → : 부모-자식 상속

### 필드 타입으로 인터페이스 사용 시 다형성이 구현되는 방법

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(21).png)

- 코드는 변경하지 않고 그대로 사용하지만, 필드에 대입되는 구현 객체에 따라 결과가 다르게 나옴

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(22).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(23).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(24).png)

- 인터페이스 A, A를 구현한 클래스 B, C
    
    ```java
    A a = new B();
    B b = (B) a; // 가능: 애초에 a는 B타입 변수로 만들어졌으므로 복원 가능
    ```
    
    ```java
    A a = new C();
    B b = (B) a; // 실행오류: C타입 변수 a는 B타입으로 변환 불가
    C c = (C) a; // 는 가능
    ```
    
- 왜 강제 타입을 하는가?
    
    ⇒ `new Bus();` 를 대입한 vehicle은 인터페이스에 선언된 `run()` 메서드만 사용 가능하고, Bus에 선언된 `checkFare()` 메서드는 사용 불가
    
    ⇒ `checkFare()` 메서드를 사용하기 위해서는 강제 타입 변환 필요
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(25).png)

- 강제 타입 변환 전, 구현 클래스 타입을 조사 후 코드를 실행해야 오류를 피할 수 있음
- `instanceOf`: 좌측 변수가 우측 객체로 만들어졌는지 조사함

## **8.6 인터페이스 상속**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(26).png)

- 클래스는 다중 상속을 할 수 없지만, 인터페이스는 다중 상속 가능
- 어떤 클래스가 인터페이스 A를 implements할 경우, 인터페이스 A만 사용 가능
- 어떤 클래스가 인터페이스B를 implements할 경우, 인터페이스B만 사용 가능
- 어떤 클래스가 인터페이스 C를 implements할 경우, 인터페이스 A, B, C 전부 사용 가능

## **8.7 디폴트 메소드와 인터페이스 확장**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(27).png)

- 인터페이스: 객체 사용 설명서, 메서드의 호출 정보를 제공
- default 메서드: 실행 코드까지 가지고 있음
    
    ⇒ 인터페이스와 default는 개념 자체가 서로 맞지는 않음
    
- 그런데 왜 자바 8에서는 인터페이스에 default 메서드를 허용했을까?
    
     1. 기존 인터페이스에 추상 메서드를 추가할 수 없음
    
        → 인터페이스에 새로운 추상 메서드를 하나 추가하면, 이걸 implements하고 있는 구현 클래스들이 전부 에러남
    
    2. default 메서드는 추상 메서드가 아님
        
        → 1. 에서 나타난 문제점을 default 메서드로 해결 가능
        
        → 인터페이스에는 이미 implemets 받은 클래스들이 에러날 걱정 없이 새 메서드 추가 가능
        
        → 구현 클래스는 필요에 따라 default 메서드 재정의 가능
        

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(28).png)

- MyInterface 인터페이스에 default가 아닌 method2()를 추가하면, 기존에 implements 받은 구현 클래스들이 에러남 → 새 추상 메서드를 구현해야 하니까
- 그런데 인터페이스의 method2()에 default 키워드를 붙이면, 구현 클래스에서 구현을 해도, 안 해도 무방함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/8(29).png)

- 부모 인터페이스의 default 메서드를 → 자식 인터페이스에서 default 메서드로 재정의 가능
- 부모 인터페이스의 default 메서드 → 자식 인터페이스에서 추상 메서드로 재정의

## 참고자료

[강의교안_8장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_8%EC%9E%A5.ppt)