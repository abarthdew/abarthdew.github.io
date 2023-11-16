---
title: 3. operator
date: 2022-04-13
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[3.1 연산자와 연산식](#31-연산자와-연산식)   
[3.2 연산의 방향과 우선 순위](#32-연산의-방향과-우선-순위)   
[3.3 단항 연산자](#33-단항-연산자)   
[3.4 이항 연산자(1)](#34-이항-연산자1)   
[3.4 이항 연산자(2)](#34-이항-연산자2)   
[3.4 이항 연산자(3)](#34-이항-연산자3)   
[3.4 이항 연산자(4)](#34-이항-연산자4)   
[3.5 삼항 연산자](#35-삼항-연산자)   
[참고자료](#참고자료)   

## **3.1 연산자와 연산식**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3.png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(1).png)

## **3.2 연산의 방향과 우선 순위**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(2).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(3).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(4).png)

## **3.3 단항 연산자**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(5).png)

- 부호연산자(+, -)는 boolean, char 타입에는 사용할 수 없음
- short result = -100이 대입되지 않는 이유: -100이 int 타입의 4바이트로 변환되기 때문에, short가 아닌 int 타입에 대입해야 함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(6).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(7).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(8).png)

- 0은 1로, 1은 0으로 바꿈
- ~정수 = int 타입으로 해석됨

## **3.4 이항 연산자(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(9).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(10).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(11).png)

- c2 + 1에서 1은 정수기 때문에 int 로 해석됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(12).png)

- 오버플로우: 타입이 담을 수 있는 값의 범위를 넘어섰을 때
- 리터럴을 직접 사용할 경우: 연산 후의 값이 저장될 수 있는 충분한 타입을 사용
- 입력된 값을 사용할 경우: 산술 연산자를 직접 사용하지 않고, 메소드를 작성해서 오버플로우 여부 검사 후 예외 처리하기

## **3.4 이항 연산자(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(13).png)

- 부동소수점은 0.1을 정확히 표현할 수 없음
- 때문에, 결과는 0.3이 아닌 0.2999가 나옴

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(14).png)

- 정수로 바꿔 계산하고, 모든 계산이 끝나면 0.1을 나누어 줌

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(15).png)

- 5에서 0을 나누면 무한대가 나오기 때문에 예외 발생
- 정수 5에 실수 0.0을 나누거나 나머지를 구하면, Infinity, NaN 이라는 ‘수’가 발생함
    
    ⇒ Infinity, NaN는 산술 연산이 가능하기 때문에 ‘수’ 라고 표현됨
    
    ⇒ Infinity, NaN는 어떤 값과 산술 연산을 하던 Infinity, NaN가 결과로 나옴
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(16).png)

- NaN을 double 타입으로 바꾸고, 연산을 하게 되면 결과는 NaN이 나옴

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(17).png)

- +는 수의 연산뿐 아니라, 문자열에 정수를 더하면 문자열을 결합시킴
- 정수 + 실수 + 문자열 = 앞에서부터의 수는 계산 후, 문자열과 결합

## **3.4 이항 연산자(3)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(18).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(19).png)

- “abc” ≤ “def” 로 문자열 비교를 사용할 수 없음
- strVar1, 2에는 리터럴을, strVar3에는 객체를 대입할 때, 스택 영역에 strVar1, 2, 3 변수들이 만들어지고 번지가 저장되게 됨
- 이 번지들은 객체를 참조하는데, `strVar1, 2는 같은 객체를 참조`하고, `strVar3은 독자적 객체`를 가짐
- 이 객체 내 저장된 내용에 대해 비교를 할 때, `strVar1 == strVar2` 는 `참`이, `strVar2 == strVar3`는 `거짓`이 나옴
- 따라서, ==는 객체에 저장된 문자열이 아닌 `객체의 번지를 비교`하는 것
- 문자열 비교는 `equals()`를 사용함
    
    ⇒ strVar1.equals(strVar2) → true
    
    ⇒ strVar2.equals(strVar3) → true
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(20).png)

## **3.4 이항 연산자(4)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(21).png)

- 비트 연산자: 0, 1로만 연산을 할 수 있는 연산자

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(22).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(23).png)

- byte result = num1 & num2  // 컴파일 에러
    
    ⇒ num1, num2가 int로 변환되기 때문에, 결과는 int result로 해석됨
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(24).png)

- 이진수로 표현된 1을 왼쪽 방향으로 3비트 만큼 이동하고, 빈공간을 0으로 채움(밀려난 비트는 버림)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(25).png)

- -8을 3비트만큼 오른쪽으로 이동하고, 빈 공간을 1로 채움(밀려난 3비트는 버림)
- gt가 3개가 붙을 때(>>>, <<<): 새로 생성된 빈 공간에는 무조건 0이 채워짐(밀려난 3비트는 버림)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(26).png)

## **3.5 삼항 연산자**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/3(27).png)

## 참고자료

[강의교안_3장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_3%EC%9E%A5.ppt)