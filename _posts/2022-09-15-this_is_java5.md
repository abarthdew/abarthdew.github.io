---
title: 5. data type advance, memory area, operator for reference variable, NullPointException, String type, Array Type
date: 2022-09-15
categories: [Back, Java]
tags: [Back, Java]
---

## 목차
[5.1 데이터 타입 분류](#51-데이터-타입-분류)   
[5.2 메모리 사용 영역](#52-메모리-사용-영역)   
    [- 메모리 사용 영역 실행 순서](#메모리-사용-영역-실행-순서)   
    [→ 1) JVM 구동 명령](#1-jvm-구동-명령)   
    [→ 2) JVM 구동](#2-jvm-구동)   
    [→ 3) MemoryExample(class)을 메모리에 로딩: 바이트 코드를 로딩](#3-memoryexampleclass을-메모리에-로딩-바이트-코드를-로딩)   
    [→ 4) main 스레드 생성: main 메서드를 실행시키는 코드 흐름](#4-main-스레드-생성-main-메서드를-실행시키는-코드-흐름)   
    [→ 5) main() 메서드 호출](#5-main-메서드-호출)   
    [→ 6) main()의 매개변수가 String 배열 값으로 들어옴](#6-main의-매개변수가-string-배열-값으로-들어옴)   
    [→ 7) int sum = 0; 생성](#7-int-sum--0-생성)   
    [→ 8, 9) if 문 검증 후, int v2 = 10; 생성](#8-9-if-문-검증-후-int-v2--10-생성)   
    [→ 10) add() 메소드 호출](#10-add-메소드-호출)   
    [→ 11) 프레임 제거: 값이 return 되고 모든 실행이 끝나는 시점에서 add() 메서드에 의해 생성된 프레임이 제거됨](#11-프레임-제거-값이-return-되고-모든-실행이-끝나는-시점에서-add-메서드에-의해-생성된-프레임이-제거됨)   
    [→ 12) main() 프레임의 sum 값 변화](#12-main-프레임의-sum-값-변화)   
    [→ 13) main() 프레임의 v2, v3 값 제거](#13-main-프레임의-v2-v3-값-제거)   
    [→ 14) 프로그램 종료](#14-프로그램-종료)   
    [→ 15) JVM이 종료되면서 프로그램도 종료, Runtime Data Area도 없어짐](#15-jvm이-종료되면서-프로그램도-종료-runtime-data-area도-없어짐)   
    [- 더 알아보기](#더-알아보기)   
[5.3 참조 변수의 ==, != 연산](#53-참조-변수의---연산)   
[5.4 null과 NullPointerException](#54-null과-nullpointerexception)   
[5.5 String 타입](#55-string-타입)   
[5.6 배열 타입(1)](#56-배열-타입1)   
[5.6 배열 타입(2)](#56-배열-타입2)   
[5.6 배열 타입(3)](#56-배열-타입3)   
[5.7 열거 타입](#57-열거-타입)   
[참고자료](#참고자료)   

## **5.1 데이터 타입 분류**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5.png)

- 기본타입: 직접 값을 가지고 있음
- 참조타입: 객체를 참조하는 타입, 직접 값을 가지지 않고, 참조 객체의 번지를 가지고 있음
- int age = 25, double price = 100.5 에서 25, 100.5는 기본 타입으로, 직접 값이 스택 영역에 저장됨
- String name = “신용권”, “독서”는 힙 영역에 값을 저장한 객체가 생성되고, 이 번지가 스택 영역 변수에 저장됨 → 메모리 주소(번지)를 가지고 있다가, 필요할 주소로 때 객체를 이용

## **5.2 메모리 사용 영역**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(1).png)

- 프로그램을 실행하면, JVM이 구동됨 → JVM이 구동될 때, OS에서 할당받은 메모리 영역을 3가지로 구분
- 오른쪽 그림 전체가 Runtime Data Area 메모리 영역(자바가 실행될 때, 운영체제에서 받는 메모리 영역)
- 메소드 영역: 클래스 코드들이 올라감
- 힙 영역: 프로그램이 실행될 때, 이 객체를 이용해 데이터를 저장하거나, 메소드를 호출
- JVM 스택:
    - 메서드를 호출할 때마다 프레임이 생성, 프레임 안에는 변수들이 위치
    - 프레임이 제거되는 시점: 프레임이 생성된 메서드 호출이 끝나게 되면 자동적으로 없어짐

### **메모리 사용 영역 실행 순서**

### **1) JVM 구동 명령**

```jsx
java (exe) MemoryExample
```

### **2) JVM 구동**

→ OS(운영체제)로부터 메모리를 할당받음(운영체제에서 받은 메모리 영역: Runtime Data Area)

→ Runtime Data Area 영역이 만들어지며 메소드 영역, 힙 영역 자동 생성

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(2).png)

### **3) MemoryExample(class)을 메모리에 로딩: 바이트 코드를 로딩**

→ 바이트 코드가 로딩되면, 메소드 영역에 클래스 내용이 올라감

⇒ 메소드 코드, 빌드 내용 등

⇒ 코드 자체가 올라가는 것이 아닌, 분석된 내용이 올라감

```java
// 메소드 영역
Class - MemoryExample.java
[메소드 코드]
public static void main(String[] args) {...}
public static void add(int a, int b) {...}
```

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(3).png)

### **4) main 스레드 생성: main 메서드를 실행시키는 코드 흐름**

→ main 스레드 생성 동시에 JVM 스택 생성됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(4).png)

### **5) main() 메서드 호출**

→ JVM 스택에 main 메서드 호출하는 프레임 생성됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(5).png)

### **6) main()의 매개변수가 String 배열 값으로 들어옴**

```java
public static void main(String[] args) {
  // ....
}
```

→ 매개변수 args가 프레임 내부에 생성됨

⇒ 프레임 - main() 내부

| 100 | args |
| --- | --- |

⇒ 힙(Heap Area)

| String[] 배열 (100번지) |
| --- |

→ String 배열 객체는 heap 내부에 생성됨

⇒ 만약, 100번지에 String 배열 객체가 생성되었다면, args에는 100번지라는 주소값이 저장됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(6).png)

### **7) int sum = 0; 생성**

```java
public static void main(String[] args) {
  int sum = 0;
}
```

→ int sum = 0; 코드에 의해 메모리가 변형이 되는데, 변수기 때문에 프레임 내부에 생성이 됨

→ 즉, sum이라는 변수가 생성이 되며 0이라는 값이 저장됨 

⇒ 프레임 - main() 내부

| 0 | sum |
| --- | --- |
| 100 | args |

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(7).png)

### **8, 9) if 문 검증 후, int v2 = 10; 생성**

```java
public static void main(String[] args) {
  int sum = 0;
  if (sum==0) {
    int v2 = 10;
    int v3 = 20;
  }
}
```

→ sum==0이면, int v2 = 10, int v3 = 20; 가 생성됨

⇒ 프레임 - main() 내부

| 20 | v3 |
| --- | --- |
| 10 | v2 |
| 0 | sum |
| 100 | args |

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(8).png)

### **10) add() 메소드 호출**

```java
public static void main(String[] args) {
  int sum = 0;
  if (sum==0) {
	int v2 = 10;
	int v3 = 20;
	sum = add(v2, v3);
  }
}

public static int add(int a, int b) {
  return a + b;
}
```

→ 메소드를 호출했기 때문에 add() 프레임이 추가됨

→ add()의 파라미터 v2, v3는 add() 메서드의 a, b에 대입이 되게 됨

→ 메모리에 a, b 변수와 각각 10, 20 값이 저장됨

⇒ 프레임 - add()

| 20 | b |
| --- | --- |
| 10 | a |

⇒ 프레임 - main()

| 20 | v3 |
| --- | --- |
| 10 | v2 |
| 0 | sum |
| 100 | args |

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(9).png)

### **11) 프레임 제거:** 값이 return 되고 모든 실행이 끝나는 시점에서 add() 메서드에 의해 생성된 프레임이 제거됨

```java
public static void main(String[] args) {
  int sum = 0;
  if (sum==0) {
    int v2 = 10;
    int v3 = 20;
    sum = add(v2, v3);
  }
}

public static int add(int a, int b) {
  return a + b;
} //-------(메소드 끝나는 시점)
```

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(10).png)

### **12) main() 프레임의 sum 값 변화**

→ add() 메서드가 리턴한 값 30이 sum에 저장이 되며, main() 프레임의 sum의 값이 30으로 변함

⇒ 프레임 - main()

| 20 | v3 |
| --- | --- |
| 10 | v2 |
| 30 | sum |
| 100 | args |

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(11).png)

### **13) main() 프레임의 v2, v3 값 제거**

→ if 문이 끝나는 시점에서 v2, v3는 메모리에서 제거됨

⇒ 프레임 - main()

| 30 | sum |
| --- | --- |
| 100 | args |

```java
public static void main(String[] args) {
  int sum = 0;
  if (sum==0) {
    int v2 = 10;
    int v3 = 20;
    sum = add(v2, v3);
  } //----(if 끝나는 시점)
}
```

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(12).png)

### 14) 프로그램 종료

→ System.out.println(sum)으로 sum 의 값 출력 후 

```java
public static void main(String[] args) {
  int sum = 0;
  if (sum==0) {
    int v2 = 10;
    int v3 = 20;
    sum = add(v2, v3);
  }
  System.out.println(sum);
} //-----(main 메서드 끝나는 시점)
```

⇒ main() 메서드 종료 시점에서

⇒ int sum = 0; 으로 선언했던 변수 메모리에서 삭제됨

⇒ 매개변수인 String[] args도 삭제됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(13).png)

⇒ main()이 끝나게 되면 main() 프레임이 사라짐

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(14).png)

### **15) JVM이 종료되면서 프로그램도 종료, Runtime Data Area도 없어짐**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(15).png)

### 더 알아보기

![전체](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(16).png)

전체

![기본 타입 변수](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(17).png)

기본 타입 변수

1. 스택에 v1라는 변수가 생성이 되며, A에 유니코드가 저장됨
2. 스택 영역에 v2가 생성, 100 값 저장, v3 이하동일
    
    if 가 끝나는 시점에서 v2, v3 변수 제거됨
    
3. 스택에 v4 변수 생성, true 값 저장
- 기본 타입 변수는 직접 값을 가지고 있음

![참조 타입 변수 - 배열](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(18).png)

참조 타입 변수 - 배열

- 10, 20, 30 값을 가진 배열 객체를 scores 변수가 “참조한다”고 해석
- scores 변수는 스택 영역에 생성, 배열 값은 힙 영역에 생성
- 힙 영역에 생성된 배열 객체의 번지를 스택의 scores에 저장
- 번지 참조 변수: 배열 타입 변수는 직접 값을 가지는 것이 아닌, 배열 객체가 생성된 번지를 가짐

![참조 타입 변수 - 문자열](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(19).png)

참조 타입 변수 - 문자열

- 위 String은 클래스 타입이며, 참조 변수
- 객체 생성 연산자인 new를 이용해 String 객체 생성
- name 변수는 String 객체의 번지를 가지고 있음
- 힙 영역에 생성된, 문자열을 가진 String 객체의 번지수를 스택 영역의 name 변수에 저장
- 힙 영역에 생성된 String 객체의 번지가 100이라면, 스택 영역의 name에는 100을 저장함
- new 연산자를 사용하지 않고 문자열 리터럴을 사용해서 아래와 같이 생성했을 때도, 힙 영역에 해당 문자열에 대한 객체가 생성되고, 그 객체의 번지가 스택 영역의 변수에 저장됨
    
    ```java
    String name3 = "name";
    ```

## **5.3 참조 변수의 ==, != 연산**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(20).png)

- refVar1 == refVar2: 변수에 들어있는 번지가 같은가? 서로 참조하는 객체가 서로 같은 객체인가? ⇒ false
- ==: 같은 객체를 참조하는가?
- ≠: 다른 객체를 참조하는가?

## **5.4 null과 NullPointerException**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(21).png)

- 참조 타입만 null 값을 가질 수 있음
- null도 값이기 때문에 초기화되면 스택 영역에 생성됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(22).png)

- intArray가 null인 상태에서, 즉, 배열이 없는 상태에서 10을 저장할 수 없음
- 참조 변수 null 값인 상태에서 데이터를 저장하려고 하거나, 객체가 가지고 있는 메서드를 호출하려고 했을 때 발생
- str이 참조하는 문자열 객체가 없기 때문에(str = null이기 때문에) NullPointException 발생

## **5.5 String 타입**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(23).png)

- heap 영역의 객체 번지가 stack 영역의 변수에 저장
- new 연산자를 사용해 객체를 생성하면 무조건 새로운 객체가 생성됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(24).png)

- ==는 stack에 저장된 객체의 번지수를 비교하기 때문에, 같은 문자열이라도 `name1 == name3`은 false가 나옴 → equals()로 문자열 동일 여부 비교

## **5.6 배열 타입(1)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(25).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(26).png)

- 참조 변수는 직접 값을 저장하는 것이 아니라 힙 영역의 번지를 저장함 ⇒ 힙 영역의 번지가 참조되지 않을 경우에는 null값을 변수에 대입할 수 있음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(27).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(28).png)

- 배열을 생성하고, 나중에 값을 대입하는 경우
- 길이: 배열이 저장할 수 있는 값의 수
- 타입이 int니까 배열의 각 칸에 4바이트씩 할당됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(29).png)

- 배열 타입 변수의 칸 수를 정해서 생성하면, 기본값으로 각 초기값이 들어있음
- 예시) new int[30] 이면 배열 30칸에 각 0씩, boolean[10] 이면 배열 10칸에 각 false가 기본적으로 들어가 있음

## **5.6 배열 타입(2)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(30).png)

- 배열의 length는 읽기 전용이며, 배열이 생성될 때 정해지기 때문에 다른 값을 대입할 수 없음
- length는 배열의 final 필드이며, 따라서 수정할 수 없음

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(31).png)

```java
$ java [클래스명] 
```

- 위 명령어 실행 시, JVM이 구동되며 main() 메서드를 찾아 실행함.
    - JVM은 String[] 배열 객체를 만듬
    - 초기에는 값이 없으니, String[] args = {};  형태로 (String[] args)에 파라미터로 대입됨
    - 즉, 초기에는 값이 없는 배열 객체가 대입됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(32).png)

```java
$ java [클래스명] [문자열1] [문자열2] 
```

- 위 명령어 실행 시, `[문자열1] [문자열2] [..]`형태의 배열이 String[] args 객체에 대입됨(인덱스 번호는 차례로 0, 1, 2…)
    - 이 문자열 형태의 배열이 main() 메서드 호출 시 전달됨
    - main() 메서드를 통해 args에 입력된 문자열을 얻을 수 있음
    
    ```java
    public static void main(String[] args) {
      args[0]
      args[1]
      args.length
      // ....
    }
    ```
    

### 명령어 args의 length 출력하기

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(33).png)

- window - show view - navigator로 위치 알아내기

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(34).png)

- 커맨드 화면에서 바이트 코드 파일을 실행

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(35).png)

```java
$ java [패키지이름].[클래스이름]
// 클래스 내용에 작성된 것처럼 배열의 길이가 출력됨
```

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(36).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(37).png)

```java
$ java [패키지이름].[클래스이름] abc def
// 배열의 길이: 2
```

### 명령 프롬프터가 아닌 이클립스에서 args 내용 출력하기

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(38).png)

- Main Class: main() 메서드가 있는 클래스

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(39).png)

- arguments 탭에 화면과 같이 작성하고 run

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(40).png)

- abc def를 입력했으므로 배열의 길이: 2

> 💡 정리: args는 사용자가 실행할 때 입력한 문자 배열

### 다차원 배열

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(41).png)

- 행, 열 모두 인덱스가 있음(행렬)
- 자바에서는 행렬 구조로 메모리에 다차원 공간을 만들지 않음 ⇒ 1차원 배열을 이용해 2차원 배열 구현

```java
int[][] scores = new int[행의 수][열의 수]

int[][] scores = new int[2][3] // 2행 3열
```

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(42).png)

- new int[2][3]의 2로 먼저 길이 2짜리 1차원 배열 A를 만듦
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(43).png)
    
    - 0번째 항목 값으로 길이 3짜리 1차원 배열B를 만듦
    - 1번째 항목 값으로 길이 3짜리 1차원 배열C를 만듦
- `scores[0][0] = 3;` 이면, B의 0번째에 3이 저장됨
- `SCORES[1][2] = 5;` 이면, C의 2번째에 5이 저장됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(44).png)

- 1번째 배열만 정하고 나머지는 나중에 대입해도 됨

```java
int[][] scores = new int[2][];
scores[0] = new int[2]; // A 배열의 0번째에 길이 2짜리 B 대입
scores[1] = new int[3]; // A 배열의 1번째에 길이 3짜리 C 대입
```

- `scores[0][2] = 3;` 로 3을 대입했을 때, scores[0][2]에 해당하는 객체가 없기 때문에 예외 발생

## **5.6 배열 타입(3)**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(45).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(46).png)

- 기본 타입 배열은 각 항목에 직접 값을 가지고 있음
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(47).png)
    
    - 스택 변수 → 힙 배열 객체 [0번째값][1번째값][2번째값][…]
    
    ```java
    int[] scores = new int[3];
    scores[0] = 10;
    scores[1] = 20;
    scores[2] = 30;
    ```
    
    - 스택 변수 scores → 힙 값 {10, 20, 30} : 스택 변수가 힙 값 참조
- 참조 타입 배열은 각 항목에 객체의 번지를 가짐
    
    ![예시 1](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(48).png)
    
    예시 1
    
    ![예시2](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(49).png)
    
    예시2
    
    ![예시 2의 String 객체 주소](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(50).png)
    
    예시 2의 String 객체 주소
    
    - 스택 변수 → 힙 객체 → 힙 String 객체 : 스택 변수가 힙 객체 참조 + 힙 객체가 String 객체 잠조

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(51).png)

- 이미 생성된 배열은 크기 변경 불가 ⇒ 새 배열 생성 후 값 복사

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(52).png)

- System.arrayCopy(이전 배열, 이전 배열의 복사 위치, 새로운 배열, 새로운 배열의 붙여넣기 위치, 배열 복사 개수)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(53).png)

- 1) 배열의 0인덱스를 2) 변수에 대입 후 3) 실행문 실행
    
    → 1) 배열의 1인덱스를 2) 변수에 대입 후 3) 실행문 실행
    
    → 1) 배열의 2인덱스를 2) 변수에 대입 후 3) 실행문 실행
    
    → (반복 후) 인덱스가 끝나면 → 종료
    

## **5.7 열거 타입**

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(54).png)

- 한정된 값: 요일, 계절, 로그인 실패/성공 여부 등
- 한정된 값의 하나하나가 열거 상수로 정의됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(55).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(56).png)

- 열거 타입을 선언하고, 열거 타입의 바이트 코드를 메모리 상에 로드하게 되면, 열거 상수는 열거 객체를 참조함
- 열거 객체: 열거 타입을 객체화시킨 것
- 열거 객체는 힙 영역에 생성됨
- 열거 타입 클래스를 로딩해서 메모리로 올림 → 메서드 영역에 바이트 코드가 저장됨 → 열거 상수는 메소드 영역에 저장됨 → 메서드 영역에 자리잡은 열거 상수는 힙 영역의 열거 객체를 참조함
- 힙 영역의 Week 열거 객체는 열거 상수와 동일한 문자열을 가지고 있음
- 예시1) 메소드 영역에 저장된 MONDAY 열거 상수 → 힙 영역의 Week 객체 중 MONDAY 문자열이 저장된 열거 객체를 참조함
- 예시2) 메소드 영역에 저장된 SUNDAY 열거 상수 → 힙 영역의 Week 객체 중SUNDAY 문자열이 저장된 열거 객체를 참조함
- 총 7개의 열거 상수가 총 7개의 열거 객체를 각각 참조하게 됨

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(57).png)

- 메소드 영역에 만들어진 열거 상수가 힙 영역의 열거 객체의 번지 값을 저장하고, 스택의 변수가 힙 영역의 열거 객체의 번지 값을 저장함

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(58).png)

![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(59).png)

- `name()`: 열거 객체의 문자열 리턴
- `ordinal()`: 열거 객체의 순번 리턴(제일 위에 선언된 열거 객체부터 0번)
- `compareTo()`: 열거 객체의 순번 차이
- `valueOf(String name)`: 주어진 문자열의 열거 객체를 리턴
    - valueOf(MONDAY): MONDAY를 문자열로 가지고 있는 열거 객체의 번지 리턴
    
    ```java
    Week weekDay = Week.valueOf("SATURDAY");
    ```
    
    - SUNDAY 문자열을 가진 열거 객체의 생성 번지를 weekDay에 대입
    - weekDay가 참조하는 열거 객체는 열거 상수 SUNDAY가 참조하는 열거 객체와 동일
- `values()`: 모든 열거 객체들을 배열로 리턴
    - 총 7개의 열거 상수가 정의되어 있다면, 총 7개의 열거 객체가 만들어 지므로, 7개의 열거 객체를 열거 타입 배열로 담아 리턴
    
    ![Untitled](https://github.com/abarthdew/this-is-java/raw/main/00.basics/images/5(60).png)
    
    ```java
    Week[] days = Week.values();
    for(Week day:days) {
      System.out.println(day);
    }
    ```
    
    - Week.values()로 열거 객체 배열 생성 → 배열의 생성 번지 100을 Week[] days 변수에 대입 → days 변수가 index로 각 열거 객체에 접근
    - 힙 영역의 100번지에 만들어진 객체의 각 index에는 열거 객체가 저장됨

## 참고자료

[강의교안_5장.ppt](https://github.com/abarthdew/this-is-Java/blob/main/00.basics/files/%EA%B0%95%EC%9D%98%EA%B5%90%EC%95%88_5%EC%9E%A5.ppt)