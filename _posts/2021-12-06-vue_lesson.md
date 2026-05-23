---
title: Vue Lesson
categories: [Front, Vue]
tags: [Front, Vue]
---

# [vue-lesson](https://github.com/abarthdew/vue-lesson){:target="_blank"}

## 강의에서 다루는 내용

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(1).png)

## 실습 미리보기

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(2).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(3).png)

## 개발환경 `+ubuntu`

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(4).png)

## node 설치

```bash
$ sudo apt update
$ sudo apt install nodejs // node download
$ nodejs -v // read version
$ sudo apt install npm // npm(node manager) download
```

## **git 설치**

```bash
sudo apt install git-all
```

## VSCode, vue.js 크롬 확장 설치

- vetur, TSLInt(문법 오류 추적), ESLint, auto close tag, Metarial icon thema, Night owl
- vscode git 권한설정 : https://hyeo-noo.tistory.com/184
- 크롬 플러그인 설정 : https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd/related?hl=ko

## 강의 대상

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(5).png)

## vue 설치

```bash
// vue 설치
jonah@jonah-15U530-LH10K:~/Documents/vue-lesson$ npm install @vue/cli
```

> ⚠️ npm install -g @vue.cli : 글로벌로 설치하면 에러남   
> `npm WARN checkPermissions Missing write access to /usr/local/lib`   
> 권한 에러인 듯한데 귀찮아서 전역 옵션 뺌   
> [오류 출처](https://superbaik.tistory.com/entry/Error-npm-%EA%B8%80%EB%A1%9C%EB%B2%8C-%EC%84%A4%EC%B9%98-%EA%B4%80%EB%A0%A8-%EC%97%90%EB%9F%AC)

```bash
jonah@jonah-15U530-LH10K:~/Documents/vue-lesson$ vue -version
// 버전 조회했더니 오류나서 시키는 대로 설치함
Command 'vue' not found, but can be installed with:
sudo snap install vue
```

→ [이거 아님](https://askubuntu.com/questions/1139728/how-do-i-install-vue-cli-in-ubuntu)

```bash
sudo npm install -g @vue/cli
```

→ 이것도 아님

```bash
jonah@jonah-15U530-LH10K:~/Documents/vue-lesson$ vue -version
bash: /snap/bin/vue: No such file or directory
```

→ [지우고 다시 시작](https://reactgo.com/uninstall-vue-cli/)

```bash
root@jonah-15U530-LH10K:~# npm uninstall -g @vue/cli
npm clear cache --force
```

→ [다시 설치](https://kkamikoon.tistory.com/entry/Vuejs-Vuejs-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%8B%A4%ED%96%89-%EC%A0%91%EC%86%8D-%EB%B0%A9%EB%B2%95)

```bash
sudo npm install vue
sudo npm install -g @vue/cli

root@jonah-15U530-LH10K:~# vue --version
@vue/cli 4.5.15

root@jonah-15U530-LH10K:~# ls
node_modules  package-lock.json  snap

root@jonah-15U530-LH10K:/home/jonah/Documents/vue-lesson# vue init webpack vue-todo
```

### → `vue init webpack vue-todo` : vue/cli2 명령어라 다음 명령어로 2를 설치하라는 에러 출력

```bash
Command vue init requires a global addon to be installed.
  Please run npm i -g @vue/cli-init and try again.

// 설치
root@jonah-15U530-LH10K:/home/jonah/Documents/vue-lesson# npm i -g @vue/cli-init
root@jonah-15U530-LH10K:/home/jonah/Documents/vue-lesson# sudo vue init webpack vue-todo

? Project name vue-todo
? Project description A Vue.js project
? Author 
? Vue build standalone
? Install vue-router? Yes
? Use ESLint to lint your code? Yes
? Pick an ESLint preset Standard
? Set up unit tests Yes
? Pick a test runner jest
? Setup e2e tests with Nightwatch? Yes
? Should we run `npm install` for you after the project has been created? (rec
ommended) npm

# Project initialization finished!
# ========================
To get started:
  cd vue-todo
  npm run dev
```

→ 설치되긴 함. 근데 vue/cli3 로 해야지.

```bash
// vue create
$ vue create vue-todo-cli3
Vue CLI v4.5.15
? Please pick a preset: (Use arrow keys)
❯ Default ([Vue 2] babel, eslint) 
  Default (Vue 3) ([Vue 3] babel, eslint) 
  Manually select features
```
> 📌 [vue/cli2, 3 차이점](https://blog.metafor.kr/201)

→ 에러

```bash
npm ERR! code EINTEGRITY
npm ERR! sha512-vKsoSQAyBmxS35JUOOt+07cLc6Nk/2ljLIHwmq2/NM6hdioUaqEXq/S+nXvbvXbZkNDlWOymPanJGOc4CBjSJA== integrity checksum failed when using sha512: wanted sha512-vKsoSQAyBmxS35JUOOt+07cLc6Nk/2ljLIHwmq2/NM6hdioUaqEXq/S+nXvbvXbZkNDlWOymPanJGOc4CBjSJA== but got sha512-z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==. (0 bytes)
```

### → [해결](https://stackoverflow.com/questions/47545940/when-i-run-npm-install-it-returns-with-err-code-eintegrity-npm-5-3-0) : 성공!!

```bash
// 로컬 터미널 열어서 명령어 입력하고
**jonah@jonah-15U530-LH10K:~$ sudo -i**
[sudo] password for jonah: 
**root@jonah-15U530-LH10K:~# npm cache verify**
Cache verified and compressed (~/.npm/_cacache):
Content verified: 2240 (49187580 bytes)
Index entries: 3472
Finished in 8.761s
**root@jonah-15U530-LH10K:~# npm install -g create-react-app**
npm WARN deprecated tar@2.2.2: This version of tar is no longer supported, and will not receive security updates. Please upgrade asap.
/usr/local/bin/create-react-app -> /usr/local/lib/node_modules/create-react-app/index.js
+ create-react-app@4.0.3
updated 1 package in 1.077s

// vscode 터미널에서 vue create 하니까 됨
**root@jonah-15U530-LH10K:/home/jonah/Documents/vue-lesson# vue create vue-todo-cli3**
🎉  Successfully created project vue-todo-cli3.
👉  Get started with the following commands:

 $ cd vue-todo-cli3
 $ npm run serve
```

- 필요없는 디렉토리는 전부 삭제

```bash
$ sudo rm -rf [directory]
```

## 프로젝트 소개 및 컴포넌트 설계 방법

- 총 4개의 컴포넌트로 이루어져 있음

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(6).png)

## **파비콘, 아이콘, 폰트, 반응형 태그 설정하기**

- viewport meta tag : https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag
- favicon generator : https://www.favicon-generator.org/
- fontawesome font : https://cdnjs.com/libraries/font-awesome

## **TodoHeader 컴포넌트 구현**

- 생략

## **TodoInput 컴포넌트의 할 일 저장 기능 구현**

- localstorage : https://developer.mozilla.org/ko/docs/Web/API/Window/localStorage

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(7).png)

## 11_리팩토링

- 재정비
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(8).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(9).png)
    
    - 프레젠트 컴포넌트 : 단순히 화면을 표현하는 컴포넌트 (input, list, footer)
    - 컴포넌트 : 앱의 동작, 비즈니스 로직, 데이터 조작 표현단 (app)
    - 즉, 전체적 컴포넌트에서 사용할 데이터를 app 한군데로 몰아넣고, 여기서 데이터 조작이 발생.

### 리팩토링 정리

- app.vue에 메서드 모음(컴포넌트 컨테이너)

```html
<todo-input @addTodoItem="addOneItem"/>
<todo-list
  :propsData="todoItems"
  @removeItem="removeOneItem"
  @toggleCompleteItem="toggleCompleteOneItem"
/>
<todo-footer @clearAll="clearAllItems"></todo-footer>
```

```jsx
addOneItem (todoItem) {
  // ...
}},
removeOneItem (todoItem, index) {
  // ...
},
toggleCompleteOneItem (index) {
  // ...
},
clearAllItems() {
  // ...
}
```

- todo.vue에서는 ui적 표현, emit으로 이벤트 올리기만 담당(프레젠테이셔널 컴포넌트)

```jsx
// input
addTodo() {
  this.$emit('addTodoItem', this.newTodoItem);
}
// list
removeTodo(todoItem, index) {
  this.$emit('removeItem', todoItem, index);
},
toggleComplete(index) {
  this.$emit('toggleCompleteItem', index);
}
```

## 16_**Todo App - 사용자 경험 개선**

- 어떤 것들이 수정되고, 삭제됐는지 육안으로 구별이 어려움 → vue 라이브러리에서 제공하는 트랜지션, 애니메이션을 이용해 문제점 해결하기
- 모달 : https://vuejs.org/v2/examples/modal.html
- x-template : ES5 기준 / 탬플릿을 모듈화한 형태를 사용할 때 씀
    
    ```html
    <script type="text/x-template" id="modal-template">
    ```
    
    ```jsx
    // register modal component
    Vue.component("modal", {
      template: "#modal-template"
    });
    // #modal-template id를 가진 x-template을 찾아 modal 컴포넌트로 만들겠다
    ```
    
- Slot 태그 : <slot>태그를 써 놓으면 Modal.vue가 사용되는 컴포넌트에서 재정의 가능
    - Modal.vue
    
    ```html
    <!--MODAL HEADER-->
      <div class="modal-header">
        <slot name="header">
          default header
        </slot>
      </div>
    <!--MODAL BODY-->
      <div class="modal-body">
        <slot name="body">
          default body
        </slot>
      </div>
    <!--MODAL FOOTER-->
      <div class="modal-footer">
        <slot name="footer">
          default footer
          <button class="modal-default-button" @click="$emit('close')">
            OK
          </button>
        </slot>
        <!--THIS slot PART: you can refactor this <slot>part</slot> on TodoInput.vue(where it is slot implemented)-->
      </div>
    ```
    
    - Input.vue
    
    ```html
    <modal v-if="showModal" @close="showModal = false">
      <!--
      *** you can use custom content here to overwrite
      default content ***
      -->
      <h3 slot="header">custom header<!--Not "default header" in Modal.vue--></h3>
      <h3 slot="body">custom body<!--재정의--></h3>
      <h3 slot="footer">custom footer<!--재정의--></h3>
      <!-- slot: refactoring  specific component or any part. so, you may reuse UI parts in any compnent-->
    </modal>
    ```
    
    - 화면 : default heaer가 아닌 custom header가 출력됨
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(10).png)
    

## 18_**트렌지션 소개 및 구현**

- https://vuejs.org/v2/guide/transitions.html#List-Entering-Leaving-Transitions
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(11).png)
    
    - List를 추가했을 때, 보다 부드럽게 들어가고, 지울때도 부드럽게 지워짐

## ES6

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(12).png)

- https://babeljs.io/

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(13).png)

- ES6를 사용하면 시간상 효율적이고, 빠르게 프로토타이핑 할 수 있고, 빠르게 재개발 할 수 있으며, 개발자 스스로가 편해짐

## ES6란?

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(14).png)

- ES6는 모든 브라우저에서 지원되는 언어는 아님
- 그래서, BABEL로 최대한 트랜스파일링(호환 가능한 ES5로 변환하는 컴파일링)해야 함

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(15).png)

- vue CLI를 이용해서 프로젝트 구성하기 때문에,  webpack.config 등을 설정할 필요가 없지만, 무슨 기능을 하는지는 알고 있어야함.

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(16).png)

- `위쪽`이 ES6 문법 → `아래쪽` 브라우저가 호환 가능한 ES5문법으로  변환

## const & let

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(17).png)

- 기존 js가 가진 유연함, 혹은 애매모호함을 미연에 방지함.
- const 는 값 재할당 불가
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(18).png)
    
- let은 값 재할당 가능
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(19).png)
    

## **[ES5의 주요 특징]변수 스코프와 호이스팅**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(20).png)

- for문 안에서 var i를 선언했을 때, i는 전역변수가 됨

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(11).png)

- Hoist : 끌어올려진다
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(22).png)
    
- 함수 표현식 X, 함수 선언문과 변수만 메모리 공간 확도 먼저 됨

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(23).png)

- 위 코드는 오류가 나지 않음
    - 1순위 - var i, function이 위로 끌어올려짐
    - 2순위 - sum, i = 10 할당하는 것은 맨 마지막에 이루어짐
- 결론적으로, 위 코드는 아래처럼 됨

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(24).png)

## **const와 let 추가 설명 및 정리**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(25).png)

- for문 안에서 선언한 let i는 for문 밖에서 접근 불가

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(26).png)

- const : 문자열은 재할당 불가이나, 객체의 프로퍼티나 배열은 재할당 가능
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(27).png)
    

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(28).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(29).png)

- let x, const x는 다른 메모리 공간을 가지고 있으므로, 둘은 충돌이 나지 않음

## **화살표 함수 소개 및 설명**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(30).png)

```jsx
// ES5 : function
function () {}
// EX6 : arrow
() => {}
```

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(31).png)

- 실습 : [BABEL홈페이지](https://babeljs.io/repl#?browsers=defaults%2C%20not%20ie%2011%2C%20not%20ie_mob%2011&build=&builtIns=false&corejs=3.6&spec=false&loose=false&code_lz=Q&debug=false&forceAllTransforms=false&shippedProposals=false&circleciRepo=&evaluate=false&fileSize=false&timeTravel=false&sourceType=module&lineWrap=true&presets=env%2Creact%2Cstage-2&prettier=false&targets=&version=7.16.6&externalPlugins=&assumptions=%7B%7D)

## **속성 메서드의 축약 특징 설명**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(32).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(33).png)

## **속성명의 축약 특징 설명**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(34).png)

## 모듈

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(35).png)

- ES5 기준 모듈 기능이 없었음 → Common js를 가져다 써서 모듈을 사용했음
- 모듈 : 특정 기능을 시행하는 한 단위, 덩어리
    - 재사용성이 뛰어난 기능들을 묶어 필요할 때마다 갖다 씀
    - 파일별로 스코프를 가져감
    - import 를 할 때 export가 실행됨

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(36).png)

- default : 한 개 파일에서 하나만 export 됨 → 다른 것들이 쓸데없이 import되지 않게 함 ⇒ 모듈화(encapsulation)

## Vuex - 상태관리 라이브러리

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(37).png)

- 수많은 컴포넌트를 효율적으로 관리
- 리액트(flux 패턴), 앵귤러를 답습, 장점을 결합하는 과정에서 생긴 형제 프레임워크
- state(`data`), getters(`computed`), mutations(`sync method`), actions(`async method`)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(38).png)

## Vuex란?

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(39).png)

- 앱이 커졌을 때, 관리할 수 있는 효과적인 방법

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(40).png)

- 페이스북 개발자들이 MVC패턴, 리액트로 개발하다가 만들어냄
- 전체적 앱의 흐름을 추적하기 위함
- Unidirectional data flow : 모든 데이터 흐름이 한 방향으로만 움직임
- Dispatcher : 모델을 바꾸기 위한 역할 딱 하나 있음.

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(41).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(42).png)

- 데이터의 흐름을 추적할 수 없음 → 어떤 버그가 생기는지 확인할 수 없음.

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(42).png)

- 데이터의 흐름을 정형화시켜 향후에 발생할 수 있는 문제점 방지
- store = model

## **Vuex가 필요한 이유, Vuex 컨셉, Vuex 구조**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(43).png)

- 만약 porps를 사용한다면, 코드가 복잡해짐

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(44).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(45).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(46).png)

- state : 상태
- view(`템플릿 화면에서 add 버튼 클릭`) → action 발생(`addTodo메서드 발생`) → state 변경됨(`this.item.push(’item’)`)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(47).png)

- 시작점 : vue components
- 흐름 순서 :
    - 컴포넌트
        
        → 비동기로직(action) : 비동기 메서드 로직만 처리, data를 바꾸지는 않음. mutation 콜만 할 수 있음.
        
        → 동기로직(mutation) : 동기 메서드. 실제 data는 이 단계에서 바꿈.
        
        → 상태(state)
        
- [비동기, 동기에 대한 개념](https://joshua1988.github.io/web-development/javascript/javascript-asynchronous-operation/)
- [자바스크립트 Promise 쉽게 이해하기](https://joshua1988.github.io/web-development/javascript/promise-for-beginners/)

## 20_vuex 설치하기

- EX6로 설치

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(48).png)

- vuex는 보통 store라고 하는데, 관행적으로 저장하는 폴더가 있음 → /src/store/store.js
- store.js

```jsx
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex); // use vue plugin
```

- use : 뷰를 사용할 때, 전역으로 특정 기능을 추가하고 싶을 때 → 특정 컴포넌트에서 `this.$store`와 같이 쓸 수 있음

## **state와 getters 소개**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(49).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(50).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(51).png)

## 21_**[리팩토링] state 속성 적용**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(52).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(53).png)

## **mutations와 commit() 형식 소개**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(54).png)

- mutation의 첫번째 인자는 무조건 state
- 20 = anotherNum

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(55).png)

- payload : 관행상 이런 이름으로 사용

## 22_**[리팩토링&퀴즈] mutations 퀴즈 풀이 및 할 일 지우기 기능 구현**

- 생략

## **왜 mutations로 상태를 변경해야 하는가?**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(56).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(57).png)

- `vue components` → (commit) → `mutation` → (mutate) → `state` : mutation은 state의 값을 변경하기 위함
- `Devtools(개발자도구)`로 state값을 확인할 수 있음

## actions 소개 및 예제

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(58).png)

- context : actions에서 mutation을 접근할 수 있는데, 접근할 수 있는 경로
- 즉, actions는 mutation에게 신호를 보내는 역할

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(59).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(60).png)

## **왜 actions에 비동기 로직을 선언해야 하는가?**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(61).png)

- actions에서 비동기 메서드가 처리되면, 무조건 mutation으로 들고와서 값을 처리 → 규격화됨

## **헬퍼 함수 및 ES6 Spread 연산자 소개**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(62).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(63).png)

- this.$store.state.num
- this.$store.getters.countedNum
- this.$store.commit.clickBtn
- this.$store.dispatcher.asyncClickBtn

## **mapState, mapGetters 소개 및 ES6 Spread 연산자 쓰는 이유**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(64).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(65).png)

## 23_**[리팩토링] getters와 mapGetters 적용하기**

- 생략

## **[리팩토링 & 퀴즈] mapMutations 적용 및 퀴즈**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(66).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(67).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(68).png)

## 24_**[리팩토링 & 퀴즈] mapMutations 적용 및 퀴즈**

- 생략

> 💡 **getters는 computed와 속성이 같으므로 computed에, mutations는 method와 속성이 같으므로 method에 helper함수를 선언!**

## **헬퍼 함수가 주는 간편함**

- getters가 3개 있을 때,
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(69).png)
    
- 이걸 쓰기 위해 접근할 때 하나하나 가져와서 사용하면 번거로움
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(70).png)
    
- map helper 함수를 사용하면 타이핑 시간을 줄일 수 있음
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(71).png)
    

## **뷰엑스로 리팩토링한 애플리케이션 구조 분석 및 정리**

- app : 하위 컴포넌트만 등록되어 있음
- store : 기존 app에 있던 메서드 등 코드 기능들이 전부 store에서 요청
- list, input, footer : store에서 필요한 기능들을 불러와서 호출
    
    ⇒ 하지만 store에 모든 메서드를 두게 되면 추적이 힘들어지므로, 모듈화, 분리가 필요함. (modules를 이용해 구조화)
    

## 25_**스토어 속성 모듈화 방법**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(72).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(73).png)

## 26_**스토어 모듈화 방법**

![[또 다른 예시](https://theheydaze.tistory.com/407)](https://raw.githubusercontent.com/abarthdew/vue-lesson/main/vue-todo-cli3/src/assets/vue-lesson(74).png)

[또 다른 예시](https://theheydaze.tistory.com/407)

## ubuntu 오류 모음

### 1. [vue/cli2, 3 실행 명령어](https://blog.metafor.kr/201)

```bash
// cli2
# npm i -g @vue/cli-init
# sudo vue init webpack vue-todo
$ cd vue-todo
$ npm run dev
// cli3
**root@jonah-15U530-LH10K:/home/jonah/Documents/vue-lesson# vue create vue-todo-cli3**
$ cd vue-todo-cli3
$ npm run serve
```

### 2. 권한 오류[[1]](https://stackoverflow.com/questions/48910876/error-eacces-permission-denied-access-usr-local-lib-node-modules)[[2]](https://pinkwink.kr/1343)

- vscode 에서 파일 이름을 바꾸거나 삭제하려고 할 때 뜨는 오류

```bash
Error: EACCES: permission denied, rename '/home/jonah/Documents/vue-lesson/vue-todo-cli3/src/components/HelloWorld.vue' -> '/home/jonah/Documents/vue-lesson/vue-todo-cli3/src/components/111.vue'
```

- 해당 디렉토리에 대한 권한 설정을 해 줌(사용자 계정)
    
    → 귀찮아서 전체 디렉토리 권한 허용함
    

```bash
jonah@jonah-15U530-LH10K:~$ ls -la /usr/local/lib/node_modules
total 16
drwxr-xr-x 4 jonah jonah 4096 Dec  6 23:42 .
drwxr-xr-x 5 root  root  4096 Dec  6 23:16 ..
drwxr-xr-x 3 jonah jonah 4096 Dec  6 23:42 create-react-app
drwxr-xr-x 4 jonah jonah 4096 Dec  6 23:20 @vue
-- 원래 이렇게 해야 하는데
jonah@jonah-15U530-LH10K:~$ sudo chown -R jonah:jonah /usr/local/lib/node_modules/
[sudo] password for jonah: 
-- 안되길래 전체 권한 허용
jonah@jonah-15U530-LH10K:~$ sudo chown -R jonah *
```

### 3. git push 인증 오류

- https://curryyou.tistory.com/344
- 계정 저장 : https://www.hahwul.com/2018/08/22/git-credential-helper/

## Reference

- https://velog.io/@ywoosang/Node.js-%EC%84%A4%EC%B9%98
- https://github.com/ABarthDew/vue-lesson
- vscode git 권한설정 : https://hyeo-noo.tistory.com/184
- 크롬 플러그인 설정 : https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd/related?hl=ko
- npm install -g option error : [https://superbaik.tistory.com/entry/Error-npm-글로벌-설치-관련-에러](https://superbaik.tistory.com/entry/Error-npm-%EA%B8%80%EB%A1%9C%EB%B2%8C-%EC%84%A4%EC%B9%98-%EA%B4%80%EB%A0%A8-%EC%97%90%EB%9F%AC)
- sudo npm -g install @vue/cli : https://askubuntu.com/questions/1139728/how-do-i-install-vue-cli-in-ubuntu
- vue/cli2, 3 차이점 : https://blog.metafor.kr/201
- vue create error : https://stackoverflow.com/questions/47545940/when-i-run-npm-install-it-returns-with-err-code-eintegrity-npm-5-3-0