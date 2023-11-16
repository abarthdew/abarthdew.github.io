---
title: 4. condition statement
date: 2022-04-14
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[4.1 코드 실행 흐름 제어](#41-코드-실행-흐름-제어)   
[4.2 조건문(if문, switch문)](#42-조건문if문-switch문)   
[4.3 반복문(for문, while문, do-while문)(1)](#43-반복문for문-while문-do-while문1)   
[4.3 반복문(for문, while문, do-while문)(2)](#43-반복문for문-while문-do-while문2)   
[참고자료](#참고자료)   

## **4.1 코드 실행 흐름 제어**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4.png)

## **4.2 조건문(if문, switch문)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(1).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(2).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(3).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(4).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(5).png)

- 예시1) num=3일 경우 case3을 실행 후 break로 빠져나옴
- 예시2) default가 있을 시, 6번인 경우 default 실행됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(6).png)

- break가 없으면 다음 case 줄줄이 실행됨
- 자바는 대소문자를 구분함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(7).png)

- A일 경우 a도 실행됨, B일 경우 b도 실행됨, a, b가 아닐 경우 default

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(8).png)

- 자바 7부터는 문자열(position)로 switch 사용 가능

## **4.3 반복문(for문, while문, do-while문)(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(9).png)

- 초기화식 실행 → 조건식 실행 → 실행문 실행 → 증감식 카운트   
               → 조건식 실행 → 실행문 실행 → 증감식 카운트   
               → 조건식이 false인 경우, 반복문 빠져나옴   
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(10).png)

- for문 카운팅에 실수를 사용 시 1) 쓰레기값이 발생하거나, 2) 이로 인해 카운팅이 예상대로 되지 않을 수 있음
    - 위 예시에선 10번을 돌아야 하는데 9번만 돔
    - 0.900001 + 0.1 = 1.000001이므로 9번째에 1.0보다 커짐
    
    ⇒ for문 카운팅은 가급적 정수로 사용하는 것을 권장함
    

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(11).png)

## **4.3 반복문(for문, while문, do-while문)(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(12).png)

- 조건식이 뒤에 와서 반복하는 것
- 한 번은 무조건 {} 블록 실행 후, 조건식이 true면 {}블록 반복 시작

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(13).png)

- Scanner: 문자열을 읽음
    - int, long과 같은 기본 타입이 아닌 클래스 타입이기 때문에, Scanner를 사용하기 위해 이 객체가 있는 패키지 위치를 명시해서 컴파일러에게 알려줘야 함.
    - 컴파일러는 해당 객체를 찾아 변수를 선언하게 해 줌.
- System.in: 키보드로부터
- scanner.nextLine(): 키보드로 입력한 문자열을, 엔터키를 누르기 직전까지 return해 줌

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(14).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(15).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/4(16).png)

## 참고자료

[강의교안_4장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_4%EC%9E%A5.ppt)