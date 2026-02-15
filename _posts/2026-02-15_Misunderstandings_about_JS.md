---
title: 자바스크립트에 대한 오해들
date: 2026-02-15
categories: [front, JS]
tags: [front, JS]
---

# this
- this는 호출 방식에 의해 결정됨
```js
const obj = {
  hello: function() {
    console.log(this)
  }
}
obj.hello() // this === obj
```
- 여기서, this는 obj.hello()로 호출됐기 때문에 obj가 됨

- this를 강제로 지정하는 메서드: apply, call, bind
```js
function greet() {
  console.log(this.name)
}
const user = {name: "Nana"}

// call, apply
greet.call(user) // 인자 하나씩 전달
greet.apply(user, []) // 인자 배열로 전달

// bind: 즉시 실행 X, this 고정을 위해 새로운 함수 생성 필요
const bound = greet.bind(user)
bound()

// 모든 경우, this === user
```
- call: 즉시 실행 + this 지정
- apply: 즉시 실행 + 배열 인자
- bind: this 고정된 새 함수 반환

- js의 this 법칙
  1. new -> 새 객체
  2. 객체.메서드() -> 점 앞 객체
  3. 그냥 함수() -> 전역 / undefined
  4. call/apply/bind -> 강제 지정
  5. 화살표 함수 -> 상위 this 고정

# prototype
```js
function Person(name) {
  this.name = name
}

Person.prototype.say = function() {
  console.log(this.name)
}

const p = new Person("Nana")
p.say() // Person.prototype 에서 찾음
p.toString() // Object.prototype 에서 찾음
```
- say는 prototype에 존재
- this는 p
- this가 p인 이뉴는 p.say()로 호출했기 때문
- 내부 구조:
  ```lua
  p
   └── [[Prototype]] → Person.prototype
                         └── [[Prototype]] → Object.prototype
                                                └── [[Prototype]] → null
  ```

# arguments
- 유사 배열 객체: Array는 아니고 관련 메서드도 없지만, length 존재, index 접근 가능, 화살표 함수에는 없음
- 요즘은 rest parameter 사용
  ```js
  function test(...args) {
    console.log(args)
  }
  ```
