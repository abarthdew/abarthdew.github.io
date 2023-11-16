---
title: 2. data type basic
date: 2022-04-12
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[2.1 변수(1)](#21-변수1)   
[2.1 변수(2)](#21-변수2)   
[2.2 데이터 타입(1)](#22-데이터-타입1)   
[2.2 데이터 타입(2)](#22-데이터-타입2)   
[2.3 타입 변환(1)](#23-타입-변환1)   
[2.3 타입 변환(2)](#23-타입-변환2)   
[참고자료](#참고자료)   

## **2.1 변수(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2.png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(1).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(2).png)

- =은 ‘같다’의 뜻이 아닌, value 변수에 30을 저장한다는 뜻

## **2.1 변수(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(3).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(4).png)

- [캐리지 리턴(CR)과 라인 피드(LF)란?](https://jw910911.tistory.com/90)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(5).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(6).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(7).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(8).png)

- 변수는 자신이 선언된 블록 내에서만 사용이 가능
- 블록이란? {}로 감싸진 구역
- 메소드 블록: 메소드를 선언할 때 작성하는 {} 내 구역
- if문에 대한 실행 블록, for문에 대한 실행 블록 등
- var1은 main, if, for문 내에서 사용이 가능하지만, var2는 if 블록에서만, var3는 for 블록에서만 사용 가능

## **2.2 데이터 타입(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(9).png)

- 변수가 한 번 선언되면, 타입을 바꿀 수 없음
- s: 최상위 비트에 양수/음수를 구분짓는 MSB가 위치
- float, double: MSB, 가수, 지수로 구성

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(10).png)

- 여기서 최상위 비트는 양수(0)/음수(1)를 구분지음
- 변수 자체에 초과값을 저장하면 컴파일 에러가 나지만, b++, b—와 같이 실행 중에 값의 범위를 초과한 경우 순회하여 초기값으로 돌아감

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(11).png)

- 유니코드를 알고 싶을 경우: 선언된 char 타입 변수를 int에 선언해 줌
- char 타입에는 하나의 ‘문자’만 저장 가능, ‘문자열’을 저장하지 못함
- 공백은 유니코드 32에 존재하는 값이므로 char 타입에 저장 가능

## **2.2 데이터 타입(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(12).png)

- short, int 등 어떤 정수든 메모리 바이트에 저장될 때는 2진수로 저장됨
- 밑 그림 예시는 int 타입이며, 10을 표현할 때는 맨 끝 1byte 만큼의 메모리만 사용함(00001010(2) = 10(10))

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(13).png)

- 정수가 4바이트냐, 8바이트냐를 구분짓기 위해 (L)을 붙임.
    
    ⇒ 컴파일러는 기본적으로 정수를 int 타입으로 해석함, 그래서 컴파일러에게 알려주기 위한 기호임.
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(14).png)

- 부동 소수점: 지수와 가수 부분으로 나누어 표현하는 방식
- 0.12345 * 10^1에서, 12345부분이 가수, ^1(승) 부분이 지수
- 가수 부분은 0.xxxx로, 앞에 0. 부분이 항상 있다고 가정함
- 이런 방식으로 보다 큰 수를 저장할 수 있음
- 100000 = 0.1 * 10^7 이므로, 1을 가수, 7을 지수 부분에 저장함
    
    ⇒ 즉, 이렇게 하면 100000이라는 숫자를 그대로 저장하는 것 보다 더 경제적으로 저장 가능(1, 7만 저장하면 되니까)
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(15).png)

- 자바는 기본적으로 실수 리터럴을 double 타입으로 간주함
- 그러므로, 실수를 double이 아닌 float으로 저장하려면 f를 추가해야 함
- e를 사용하면 곧 지수, 가수로 저장하는 방식이므로 double에 저장하거나, f를 붙여 float에 저장해야 함
- 2e-3 = 0.2 * 10^-3 = 0.002

## **2.3 타입 변환(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(16).png)

- Casting: 강제적으로 코드에 의해 타입 변환이 되는 것

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(17).png)

- 예외: byte 변수에 음수 값이 있으면, char 타입으로 변환되지 않음
    
    ⇒ char 타입은 음수를 저장할 수 없기 때문에
    
    ⇒ byte 값이 65라 할지라도, byte는 음수값을 포함할 수 있기 때문에 char로 변환되지 않음. byte → char는 강제 타입 변환만 가능.
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(18).png)

- 큰 타입을 작은 타입으로 변화할 때, 큰 타입을 쪼개 끝 한 부분만 작은 크기 타입으로 변환함
- 예시) 4바이트(int)를 1바이트(byte)로 변환할 수 없으니, int 정수를 쪼개 끝 1바이트만 byte에 강제로 저장
- 캐스팅은 값이 보존되지 않기 때문에 엉뚱한 값이 저장될 수 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(19).png)

- 예시2) int value = 10이라는 값은 작기 때문에 마지막 1바이트만 쪼개 byte에 대입해도 값이 보존됨
- 예시3) long(4)를 int(4)로 캐스팅할 경우, 바이트 수가 같기 때문에 의미있는 캐스팅 가능
- 예시4) int(4)를 char(2)로 캐스팅할 경우, int가 2바이트씩 쪼개져, 끝 2바이트만 char로 변환됨(위 예시엔 A=65므로, 값이 보존됨)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(20).png)

- 예시5) double(7) → int(4) 일 경우, 정수 부분만 저장됨
- 캐스팅, 즉 강제 타입 변환은 원래 값이 보존되어야 의미가 있음
- 강제 타입 전환시, 값 보존 여부를 검사하는 코드를 넣는 것이 좋음

## **2.3 타입 변환(2)**

- 강제 타입 변환을 해도 값이 보존되도록 하기

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(21).png)

- int(4) → float(4) → int(4) ⇒ 엉뚱한 값이 나옴(-4). 지수, 가수와 쪼개지는 과정을 거치기 때문에 값이 손실됨.
- int(4) → double(8) → int ⇒ 정확한 결과가 나옴. double의 가수 부분이 52비트라 int의 32비트를 소화할 수 있음. float은 23비트라 소화할 수 없음.

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(22).png)

- 다른 타입의 연산식에서, 결과는 크기가 큰 타입으로 자동 변환됨
- 작은 타입으로 결과를 내고 싶다면, 큰 타입을 캐스팅하기

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(23).png)

- 자바는 기본적으로 정수는 int 타입으로 해석하므로, byte + byte도 int 타입으로 자동 연산됨
- char ai(4) + 1(4, int) 이므로, 결과는 int 타입 result로 계산됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(24).png)

- 자바에서 정수 타입은 자동으로 double로 해석하기 때문에, byte + 실수 = double 타입으로 결과가 나옴

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/2(25).png)

- 예외) float + 정수 = float이 산출됨

## 참고자료

[강의교안_2장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_2%EC%9E%A5.ppt)