---
title: 7. inheritance, polymorphism, Abstract Class
date: 2022-09-17
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[7.1 상속 개념](#71-상속-개념)   
[7.2 클래스 상속](#72-클래스-상속)   
[7.3 부모 생성자 호출](#73-부모-생성자-호출)   
[7.4 메소드 재정의](#74-메소드-재정의)   
[7.5 final 클래스와 final 메소드](#75-final-클래스와-final-메소드)   
[7.6 protected 접근 제한자](#76-protected-접근-제한자)   
[7.7 타입변환과 다형성(1)](#77-타입변환과-다형성1)   
[7.7 타입변환과 다형성(2)](#77-타입변환과-다형성2)   
[7.7 타입변환과 다형성(3)](#77-타입변환과-다형성3)   
[7.8 추상 클래스](#78-추상-클래스)   
[참고자료](#참고자료)   

## **7.1 상속 개념**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7.png)

- 현실: 부모가 자식 선택, 상속해 줌
- 객체 지향 프로그램: 자식이 부모 선택, 상속 받음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(1).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(2).png)

- 패키지가 다를 경우, package2에 있는 자식 클래스는 package2에 있는 부모 클래스가 가진 `default` 필드와 메서드를 상속 받지 못함

## **7.2 클래스 상속**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(3).png)

## **7.3 부모 생성자 호출**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(4).png)

- 자식 클래스로부터 자식 객체를 생성할 때: 부모 객체 생성 → 자식 객체 생성
    
    ```java
    public DmbCellPhone () { // 자식 객체가 생성될 때,
    	super(); // 컴파일러가 자동으로 넣은 super()가 먼저 부모의 기본 생성자를 호출
    } // 자식 생성자 생성
    ```
    
- dmbCellPhone 변수는 자식 객체를 참조함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(5).png)

- 자식 생성자 안에 super()라는 부모 생성자를 선언하지 않아도 컴파일러가 자동으로 추가
- 자식 생성자 안에서 부모 생성자의 기본 생성자를 호출해서 부모 객체 생성 → 그 후 자식 객체 생성
- 개발자가 직접 super를 작성하고 매개값을 추가할 수도 있음
- 부모 클래스에 매개변수 없는 기본 생성자가 없다면 자식 클래스에 super() 선언 해줘야 함

## **7.4 메소드 재정의**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(6).png)

- 메서드 재정의 = 오버라이드
- @Override: 코드가 제대로 작성했는지 검사하는 어노테이션

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(7).png)

- 재정의된 method2()는 부모 클래스가 아닌 자식 클래스의 메서드를 가리킴
- override 단축기: ctrl + space

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(8).png)

- 부모 메서드를 호출해서 사용하는 경우 ⇒ super 키워드 사용
- super: 부모 객체의 참조(자기 자신 객체의 참조 this와 비슷)
- 메서드 재정의:
    - 앞에 아무것도 안 붙은 경우: 자식 클래스의 메서드
    - 앞에 super가 붙은 경우: 부모 클래스의 메서드

## **7.5 final 클래스와 final 메소드**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(9).png)

- final은 필드, 클래스, 메서드 앞에 모두 붙을 수 있음
- final 필드: 수정 불가능한 필드
- final 클래스, 메서드: 부모로 사용할 수 없는 클래스, 자식이 재정의할 수 없는 메서드
- 예) String 클래스 ⇒ 부모로 사용할 수 없음
    
    ```java
    public final class String {...}
    ```
    

## **7.6 protected 접근 제한자**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(10).png)

- protected 접근 제한자: 다른 패키기에 있는 클래스의 경우 자식 클래스에게 상속만 가능
- 예1) 같은 패키지의 A, B: A의 protected 필드를 B에서 사용 가능
- 예2) 다른 패키지의 A, C, D:
    - A의 protected 필드를 C에서 사용 불가능
    - A의 protected 필드를 자식 클래스 D에서 사용 가능

## **7.7 타입변환과 다형성(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(11).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(12).png)

- A타입을 상속 받은 B, C에 대해,
    
    ```java
    A a = new B();
    A a = new C();
    ```
    
    와 같이 표현할 수 있음.
    
- Animal 타입을 상속받은 Cat, Dog에 대해,
    
    ```java
    Animal a = new Cat();
    Animal a = new Dog();
    ```
    
    와 같이 표현할 수 있음.
    
- 다형성: 하나의 타입에 종류가 다른 다양한 객체를 대입할 수 있는 성질
- 다형성은 객체를 부품화 시킬 수 있어, 자동차에 각기 다른 브랜드의 타이어를 부착하는 것처럼 자유롭게 바꿔 끼울 수 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(13).png)

- 자동 타입 변환: 부모 타입에 여러 자식 객체를 대입할 수 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(14).png)

- cat == animal은 같은 번지를 참조하므로 true지만, 타입은 각각 Cat, Animal로 다름

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(15).png)

- A에는 B, C, D, E 모두 대입 가능
- B에는 D 대입 가능
- C에는 E 대입 가능

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(16).png)

- method3()은 온전히 자식 클래스의 메서드므로 부모 타입 변수로는 사용할 수 없음
- method2()는 자식 클래스의 재정의된 메서드가 실행되는데, child의 타입을 변환한다고 해서 Child 클래스가 없어지는 건 아니기 때문

## **7.7 타입변환과 다형성(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(17).png)

- 필드, 매개변수를 통해서 등 다형성이 발생할 수 있음

## **7.7 타입변환과 다형성(3)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(18).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(19).png)

- void drive(Vehicle vehicle) 과 같이 매개 변수는 Vehicle 타입이지만, 이 객체의 자식인 Bus 타입 객체가 매개 변수로 올 수도 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(20).png)

- 부모타입 → 자식타입 변환은 자동이 아니므로, 강제함
- 부모 객체 A, 자식 객체 B가 있을 경우
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(21).png)
    
    ```java
    A a = new B();
    B b = (B) a;
    ```
    
    ⇒ 와 같이 원래 new B()가 대입된 A 타입 a를 B 타입으로 되돌리는 건 강제 타입 변환으로 가능함
    
- 부모 객체 A, 자식 객체 B, C가 있을 경우
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(22).png)
    
    ```java
    A a = new A();
    B b = (B) a; // (X)
    
    A a = new C();
    B b = (B) a; // (X)
    ```
    
    ⇒ 엉뚱한 객체가 a에 대입된 상태에서, a를 B로 강제 변환할 수 없음
    

![강제 타입 변환이 필요한 경우](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(23).png)

강제 타입 변환이 필요한 경우

- Parent 타입으로 선언한 parent는 자식 객체의 field2, method3()을 사용하지 못함
- 이를 사용하기 위해선, parent를 Child 객체로 강제 타입 변환해야 함
- 상속 관계에서 자식을 부모 타입에 대입했을 경우, 부모 타입 멤버만 사용할 수 있지만, 자식 객체로 강제 타입 변환을 하면 자식 멤버도 사용할 수 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(24).png)

- 어떤 객체가 대입될지 모르는 상황에서 특정 자식 객체로 강제 타입 변환할 수 없음 ⇒ 문제가 발생할 수 있음
    
    ```java
    Parent parent = new Parent();
    Child child = (Child) parent; // 강제 타입 변환 에러
    ```
    
- 보통 메서드의 매개 변수로 객체가 들어올 때, 강제 타입 변환 예외가 발생할 수 있음 ⇒ 먼저 자식 타입인지 확인 후 강제 타입해야 함
- `(좌측 객체) instanceof (우측 객체)`: 좌측 객체가 우측 객체로 만들어졌다면 true, 아니라면 false 리턴
    
    ```java
    public void method(Parent parent) {
    	if(parnet instanceof Child) { // 매개변수 parent 가 Child 클래스로 만들어진 객체인가?
    		Child child = (Child) parent; // 검사 후 강제 타입 변환
    	}
    }
    ```
    

## **7.8 추상 클래스**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(25).png)

- 추상 클래스: 실체 객체들 간 공통되는 특성을 추출한 클래스
- 단독으로 new 키워드를 사용해 객체 생성불가, 부모 클래스로만 사용

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(26).png)

- 각기 다른 개발자 A, B, C가 각각 클래스를 만들 때, 비슷한 기능을 이름만 다르게 여러 개 만들면 가독성에 좋지 않으므로, 이름을 통일할 목적

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(27).png)

- 예) 자동차를 만들 때, 타이어는 규격을 정해놓고, 규격에 맞는 타이어만 끼울 수 있도록 함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/7(28).png)

- 추상 클래스는 추상 메서드를 가질 수 있음
- 추상 메서드: 실행 내용을 가지고 있지 않는 메서드 ⇒ 구체적인 실행 내용은 실체 클래스(자식 클래스)에서 작성됨
- 추상 메서드는 추상 클래스 안에만 올 수 있음- 
- 상속 받은 부모 클래스의 메서드 내용을 자식 클래스에서 반드시 Override해서 작성해야 함

## 참고자료

[강의교안_7장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_7%EC%9E%A5.ppt)