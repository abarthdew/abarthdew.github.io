---
title: Vue Master
date: 2021-12-06
categories: [Front, Vue]
tags: [Front, Vue]
---

# [vue-master](https://github.com/abarthdew/vue-master){:target="_blank"}

## 강의에서 다루는 내용

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(1).png)

## 실습 미리보기

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(2).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(3).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(4).png)

## 개발환경

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(5).png)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(6).png)

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

## VSCode 플러그인 설치

- vetur, TSLInt, ESLint, auto close tag, Metarial icon thema, Night owl
- vscode git 권한설정 : https://hyeo-noo.tistory.com/184

## **Vue.js 스타일 가이드 및 코딩 컨벤션 소개**

![https://vuejs.org/v2/style-guide/](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(7).png)
_https://vuejs.org/v2/style-guide/_

## 제작할 사이트 및 API 소개

![https://news.ycombinator.com/](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(8).png)
_https://news.ycombinator.com/_

## **애플리케이션 라우터 설계**

- 생략

## **비공개 리포지토리 소개 및 뷰 CLI 설명**

- 생략

## **Vue CLI 2.x vs Vue CLI 3.x**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(9).png)

![vue-cli2 webpack 설정](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(10).png)
_vue-cli2 webpack 설정_

- `vue-cli2`에서는 webpack 설정 파일이 드러나있음
- 프로젝트 내 node_modules 가 추가되어 있지 않기 때문에 초기에 npm install 필요함.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(11).png)
    
- gitHub에서 탬플릿을 다운받는 형식으로 씀.

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(12).png)

- `vue-cli3`은 webpack 설정 파일이 라이브러리 내부에서 알아서 처리됨. 노출X. → [webpack 설정하려면 직접 추가.](https://cli.vuejs.org/guide/webpack.html#simple-configuration)
- 플러그인을 사용해서 원하는 기능을 추가할 수 있도록 함.

## **Vue CLI로 프로젝트 생성 및 ESLint 로그 확인**

- preset으로 구성 선택 가능

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(13).png)

## **ESLint 도구 소개와 사용해야 하는 이유?**

- 자바스크립트 엔진이 코드를 분석하며 마지막에 ;를 넣어줌 → ;를 붙이지 않아도 코드 동작에 무리가 없음
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(14).png)
    
- 하지만 ;를 찍게끔 유도함 → 자바스크립트 해석기가 혼동을 할 수도 있기 때문
    
    ![맨 밑](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(15).png)
    _맨 밑_
    
- 객채 내 한 쌍이 오는 경우에는 ,를 찍지 않아도 됨
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(16).png)
    
- 두 번째 쌍이 오는 경우 ,를 찍음
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(17).png)
    

⇒ ESLint : 오류가 없는 코드를 유도하기 위한 장치.

## 01_**Vue CLI 3.x에서 ESLint 설정 끄는 방법**

- ESLInt 설정
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(18).png)
    
- ESLint를 다음 명령어로 컴포넌트에 추가할 수 있지만, 수가 많아질 수록 번거로움.
    
    ```jsx
    eslint-disable-next-line
    eslint-disable
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(19).png)
    
- [다른 방법 : vue.config.js파일 생성](https://cli.vuejs.org/core-plugins/eslint.html#configuration)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(20).png)
    
    ```jsx
    // vue.config.js
    module.exports = {
        lintOnSave: false
    }
    ```
    

## **라우터 설치 및 라우터 구현**

```jsx
npm i vue-router --save
```

- package.json의 `dependencies` : 앱을 실행시키는 데 필요한 비지니스 로직, 앱의 동작을 담당하는 라이브러리가 포함됨. (배포할 때도 포함되어야 하는 라이브러리)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(21).png)
    

### 02_코드

- 라우터를 `main.js에 설정`함.
- main.js는 개발자가 프로젝트 구조, 라이브러리, 등을 한눈에 볼 수 있는 파일이므로, `router를 별도 폴더에 뺌`.
- router객체를 만들고 그 안에 routes정보를 세팅함. 여기서, `path에 대한 component`는 page의 개념과 같음. → 이 page들은 `views폴더를 만들어 그 안에서 관리`함.
- view page component를 import해서 component에 넣기
- router를 export 해서 main.js에 import한 다음 vue 객체에 넣기

## 03_**router-view를 이용한 라우팅 컴포넌트 표시**

- App.vue
    
    ```jsx
    <template>
      <div id="app">
        <router-view></router-view>
      </div>
    </template>
    ```
    

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(22).png)

### 03_vue_router_and export_default_router_1, 2

- 두 가지 import, export 방법
    
    ```jsx
    //  router/index.js
    const router = new VueRouter({ ... });
    export default router;
    // main.js
    import router from './router/index'
    ```
    
    ```jsx
    //  router/index.js
    export const router = new VueRouter({
    // main.js
    import { router } from './router/index'
    ```
    
    ⇒ [{ router }, router 차이](https://hoorooroob.tistory.com/entry/React-React-Naive-TIPS-import-%ED%95%A0-%EB%95%8C-%EB%A5%BC-%EB%84%A3%EA%B3%A0-%EB%B9%BC%EA%B3%A0%EB%8A%94-%EB%AC%B4%EC%8A%A8-%EC%B0%A8%EC%9D%B4-%EC%9D%BC%EA%B9%8C)
    

## **redirect 속성과 router-link**

### 04_redirect

### 05_router-link

- 컴포넌트 이름 코딩 스타일
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(23).png)
    
    - <too-bar>로 써야 하는 이유 : alt+컴포넌트 클릭하면 해당 컴포넌트로 넘어갈 수 있어서 더 편리.

## 06_**[실습 안내] ItemView와 UserView 라우터 구현**

- 생략

### 06_**라우터 폴더 작명 팁과 라우터 mode 안내**

- router 폴더를 routes로 바꿈
- mode: history 추가

## 07_**axios를 이용한 api 호출**

- views에 들어가는 page(컴포넌트)내에는 페이지 라우팅에 관련된 정보만 포함시키는 게 좋다.
- views에 데이터 패치 등 로직이 포함되어 있으면 안 좋음. → 별도의 컴포넌트에서 로직 불러오기.
- 여기서는 실습을 위해 일단 views에 코드를 쓰고 나중에 개선.
- axios 설치

```jsx
npm install axios
// http, xhr 등을 편하게 쓸 수 있는 라이브러리
```

## 08_**[실습 안내] axios의 api 함수 구조화 방법 및 실습 안내**

- NewsView의 axios 로직 /api/index로 옮김

```jsx
axios.get('https://api.hnpwa.com/v0/news/1.json')
        .then(res => {
            console.log(res.data)
            this.users = res.data;
        })
        .catch(error => console.log(error));
// ==>  // new Promise()
        // .then(function(response) {
        //     console.log(response);
        // })
        // .catch(function() {

        // })
```

### 08_**[실습] JobsView와 AskView 구현**

- [Reactivity in Depth](https://vuejs.org/v2/guide/reactivity.html#ad)

## **자바스크립트 this 4가지와 화살표 함수의 this**

- 다른 언어는 지역 scope로 시작한다면, 자바스크립트는 전역 scope로 시작함.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(24).png)
    
- 첫번째 this :그냥 this
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(25).png)
    
- 두번째 this : 함수 안 this
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(26).png)
    
    - 함수 안에서도 this는 전역을 가리킴
- 세번째 this : Vue생성자 함수 생성
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(27).png)
    
    ```jsx
    function Vue(el) {
    	console.log(this); // => Vue {}
    	// 비동기처리에서의 this
    	this.el = el;
    }
    ```
    
    - `sum 함수`의 this가 `전역`을 가리키는 것과 다르게 `Vue 생성자`의 this는 `함수 자체`를 가리킴.
- NewsView
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(28).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(29).png)
    
    - 호출 전에는 vue component, 호출 후에는 undefined를 가리킴.
    - http로 서버에 갖다오기 때문에 비동기로 호출됨 → 현재 위치에서 벗어난  this가 발생(자바스크립트 기본 동작 방식)
    - 컴포넌트, 객체 등을 가리키고 싶을 때는 `var vm = this;` 를 사용했음. → 바인딩을 해줘야 하는 번거로움이 있음.
- ES6 화살표 문법으로 바꿔서 다시 콘솔 찍어보면 호출 전과 후가 같음 → `this.user = response.data;`의 this가 호출되는 위치의 this를 가지고 옴.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(30).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(31).png)
    

## 07_**자바스크립트 비동기 처리(1) - Callback**

- callback.html
    
    ![file:///home/jonah/Documents/vue-master/vue-master-cli3/src/callback.html](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(32).png)
_file:///home/jonah/Documents/vue-master/vue-master-cli3/src/callback.html_
    
    - 함수 결과(3)이 먼저 나오고 데이터 호출 결과(2)가 나중에 나와서, result 객체 안에 값이 들어가지 않음. → 자바스크립트 비동기처리 때문.
    - ajax 데이터 요청이 가고 나서, 기다리지 않고 다음 코드를 실행 → 비동기처리 콜백함수.
- 콜백을 처리하고 나서, success가 됐을 때 결과를 찍음.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(33).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(34).png)
    
    - 데이터 호출 결과, 함수 결과가 찍힘.
- 콜백 과정이 많아지게 되면 콜백 지옥이 생김. 코딩 사고에 위배.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(35).png)
    

## **자바스크립트 비동기 처리(2) - Promise**

- Promise : 콜백 관리를 효율적으로 하고, 코드를 직관적으로 짜기 위해 등장.
    
    ```jsx
    // ajax call function
    function callAjax() {
        return new Promise(function (resolve, reject) { // Promise must get parameter named resolve and reject
            $.ajax({ // ajax call
                url: 'https://api.hnpwa.com/v0/news/1.json',
                success: function (data) {
                    resolve(data); // when ajax call success, resolve handle success data
                }
            });
        });
    };
    ```
    
    ```jsx
    function fetchData() {
        var result = [];
        callAjax() // Promise Object call
        .then(function() { // Promise resolve : Situation when Promise call success
            console.log('data call result', data);
            result = data;
            console.log('function result', result);
        })
        .catch(function(err) { // Promise reject
            console.log(err);
        }); 
    }
    ```
    
    - new Promise로 인해 어떤 동작을 실행하고 나서 resolve하면, callAjax의 then으로 연결됨.
    - 즉, callAjax는 new Promise를 반환하는데, 데이터를 받아와서 데이터를 resolve했을 때, then안의 구문이 실행됨.
    - .then()을 연결시켜 체이닝도 가능.
    - 제이쿼리에도 Promise 성격의 내장 객체([디퍼드](http://preview.hanbit.co.kr/2721/sample_ebook.pdf))가 있지만, 보완이 필요함
    - [프로미스 쉽게 이해하기 글 주소](https://joshua1988.github.io/web-development/javascript/promise-for-beginners/)
    - [Promise MDN 주소](https://developer.mozilla.org/ko-KR/docs/Web/JavaScript/Reference/Global_Objects/Promise)

## **Vuex 설치 및 Vuex가 적용된 앱 구조 소개**

- 구조도
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(36).png)
    
    - NewView에서 api를 바로 불러오는 게 아니라, vuex라는 상태, 즉  state에 api를 담아 옴
- vuex : 상태 관리 도구. 여러 컴포넌트 간 공유되는 데이터 속성.
    - state를 이용해, NewsView가 users라는 데이터를 다른 컴포넌트와 공유할 수 있게 됨.

## 09_**Vuex 모듈화 및 state 적용**

- 생략

## 10_**NewsView에 actions와 mutations 적용**

- api에서 actions 호출, actions에서 mutations 호출, mutations에서 state 값을 변환한 다음 NewsView에 적용.
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(37).png)
    

## 11_**[실습 안내] JobsView와 AskView 실습 안내**

- 생략

## **[실습] JobsView에 스토어 적용**

- 생략

## **[실습] map 헬퍼 함수를 이용한 AskView 풀이**

- 생략

## 12_**스토어 속성 모듈화**

- 생략

## 13_**중간 정리 및 스타일링**

- 생략

## 14_**동적 라우트 매칭 원리 및 적용**

- https://router.vuejs.org/kr/guide/essentials/dynamic-matching.html
- 아이디가 path로 넘어옴
    
    ```jsx
    <router-link :to="`/user/${news.user}`">{{ news.user }}</router-link>
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(38).png)
    

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(39).png)

## 15_**라우터 params을 이용한 User 상세 페이지 구현**

- mapActions 2가지 방법
    
    ```jsx
    created() {
        console.log(this.$route.params.id);
        const userName = this.$route.params.id;
        this.$store.dispatch('FETCH_USER', userName);
    },
    ```
    
    ```jsx
    created() {
        console.log(this.$route.params.id);
        const userName = this.$route.params.id;
        this.FETCH_USER(userName);
    },
    methods: {
        ...mapActions({
            FETCH_USER: 'FETCH_USER',
        }),
    }
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(40).png)
    

## **[실습] 질문 상세 페이지 구현 실습 안내**

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(41).png)

## 16_**[실습] 질문 상세 페이지 실습 풀이 및 오류 디버깅**

- 화면
    
    ![http://localhost:8080/ask](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(42).png)
    
    http://localhost:8080/ask
    
    ![http://localhost:8080/item/29930670](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(43).png)
    
    http://localhost:8080/item/29930670
    

## 17_**질문 상세 페이지 스타일링 및 v-html 디렉티브 사용법 소개**

- 생략

## 18_**라우터 트랜지션**

- [라우터 트랜지션](https://router.vuejs.org/kr/guide/advanced/transitions.html) : vue 내부에서 화면이 보다 더 부드럽게 전환되도록 해 주는 기능
- [여러가지 트랜지션 이펙트](https://vuejs.org/v2/guide/transitions.html)
- prefix가 fade이므로, 다른 이름(page)로 바꿔도 됨

```jsx
<transition name="fade">
  <router-view></router-view>
</transition>

/* router transition */
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
```

```jsx
<transition name="page">
  <router-view></router-view>
</transition>

/* router transition */
.page-enter-active, .page-leave-active {
  transition: opacity .5s;
}
.page-enter, .page-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
```

- 이렇게 적용하면 라우터 이동할 때 화면이 부드럽게 넘어감.
- enter, leave는 보통 쌍으로 짝을 지어 css를 적용함.

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(44).png)

## **컴포넌트 공통화 리팩토링 소개**

- view에서 바로 개발하는 게 아닌, component 기반으로 리팩토링

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(45).png)

## 19_css

- 생략

## 20_**[실습 안내] 공통 컴포넌트 ListItem 제작 및 실습 안내**

- NewsView 에는 list-item 이라는 컴포넌트가 생김

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(46).png)

- AskView 에는 없음

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(47).png)

## 21_**공통 컴포넌트 구현(1) - 페이지별 데이터 분기**

- 영상 안 보고 내 맘대로 함

## 22_**공통 컴포넌트 구현(2) - computed 속성**

- ListItem

```jsx
computed: {
    listItems() {
        if (this.router === 'news') {
            return 'news';
        } else if (this.router === 'jobs') {
            return 'jobs';
        } else if (this.router === 'asks') {
            return 'asks';
        }
    }
},
```

## 23_**공통 컴포넌트 구현(3) - template 속성과 v-if 디렉티브 활용 1, 2**

- ListItem.vue

```jsx
<p>
    <template v-if="item.domain">
        <a :href="item.url">
        {{ item.title }}
        </a>
    </template>
    <template v-else>
        <router-link :to="`/item/${item.id}`">
        {{ item.title }}
        </router-link>
    </template>
</p>
```

## 24_**사용자 프로필 컴포넌트 소개 및 등록**

- UserProfile

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(48).png)

> 💡 **Router path와 router-link 형식이 맞지 않으면 컴포넌트나 뷰가 뜨지 않음.**


```jsx
<template>
      <router-link to="/user">User</router-link>
</template>

{
    path: '/user/:id',
    component: UserView,
},
```

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(49).png)

```jsx
<template>
      <router-link to="/user/:id">User</router-link>    </div>
</template>

{
    path: '/user/:id',
    component: ItemView,
}
```

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(50).png)

## 25_**사용자 컴포넌트 데이터 흐름 처리 1**

- 생략

## 26_**사용자 컴포넌트 데이터 흐름 처리 2**

- 생략

## **2가지 데이터 처리 흐름 비교**

- UserProfile에서 computed로 접근
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(51).png)
    
- UserView에서 props로 전달
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(52).png)
    

## 27_**slot을 이용한 사용자 프로필 컴포넌트 구현**

- user, item 형식을 []에서 {}로 바꿔줌.
    
    ```jsx
    state: {
        news: [],
        jobs: [],
        asks: [],
        user: {},
        item: {},
    },
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(53).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(54).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(55).png)
    

## 28_**사용자 프로필 컴포넌트 스타일링 및 코드 정리**

- 생략

## 29_**컴포넌트 재활용 방법 및 재활용할 포인트 소개**

- 페이지 컴포넌트 재활용

## 30_**이벤트 버스를 이용한 스피너 컴포넌트 구현**

- 페이지 이동할 때 데이터 불러오는 동안 spinner를 띄웠다가, 꺼지는 순간 spinner 를 끄면 됨.

### 30_2_그렇다면, spinner를 언제 켜고 끄는지 고민해보자.

- spinner는 NewsView에서 props로 내려주는 것 보다는, app에서 emit으로 관리하는 게 더 나음. (이벤트 버스)
- /src/utils/bus.js : 빈 이벤트 객체를 만들어 컴포넌트 간 이벤트 전달
- default와 그외의 차이점
    
    ```jsx
    // bus.js
    export const bus = new Vue();
    // App.vue
    import { bus } from './bus.js'
    
    // default
    // bus.js
    export default new Vue();
    // App.vue
    import Bus from './bus.js' // 뭘 선언하든 받을 수 있음(Bus가 되든, bbbb든 다 됨)
    ```
    
- start:spinner가 돌고 있는 모습
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(56).png)
    
- start로 spinner가 생기고, end로 사라짐 ⇒ 언제 생기게 하고 사라지게 만들건지만 고민하면 됨
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(57).png)
    
- 마지막에 off 필수
    - 이벤트를 등록하면 이벤트 버스에 이벤트 객체가 계속 쌓이기 때문에.
    - 항상 페이지에서 앱을 종료하기 전에 또는 컴포넌트의 역할(이벤트를 받는)이 끝나고 나서 off를 해 줘야 이벤트 객체가 해지됨.

```jsx
created() {
  // bus.$on('start:spinner', () => this.spinner = true);
  bus.$on('start:spinner', this.startSpinner); // recieved
  bus.$on('end:spinner', this.endSpinner); // recieved
},
```

```jsx
beforeDestroy() {
  bus.$off('start:startSpinner')
  bus.$off('start:endSpinner')
}
```

## 31_**스피너 실행 및 종료 시점 알아보기**

- 가상의 네트워크(속도가 느린)를 만들어 spinner 테스트
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(58).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(59).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(60).png)
    
- actions.js

```jsx
FETCH_NEWS(context) {
    fetchNewsList()
        .then(res => { // 데이터를 가져와서
            context.commit('SET_NEWS', res.data); // mutation으로 데이터를 넣고
            return res; // 프로미스 객체를 리턴
        })
        .catch(err => console.log(err));
},
```

## 32_**하이 오더 컴포넌트(HOC) 소개 및 구현**

- [리액트의 hook, vue의 mixin](https://joshua1988.github.io/vue-camp/design/pattern5.html)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(61).png)

- createListView 생성 → router에서 사용
    - NewsView 컴포넌트로 바로 연결하지 않음
        
        → 기존 컴포넌트 위에 컴포넌트(하이오더)가 하나 더 생김
        
    
    ```jsx
    {
        path: '/news', // url address
        name: 'news',
        // component: NewsView,
        component:  createListView('NewsView'),
    },
    {
        path: '/ask', // If you go to '/ask',
        name: 'asks',
        // component: AskView,
        component: createListView('NewsView'),
    },
    {
        path: '/jobs',
        name: 'jobs',
        // component: JobsView,
        component: createListView('NewsView'),
    },
    ```
    
- 비교
    - NewView 로 바로 감
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(62).png)
    
    - createListView를 통해 가는 건 App밑에 컴포넌트 하나 더 생김
- ListView.vue를 만들어 createListView에 랜더링
    
    ```jsx
    import ListView from './ListView'
    
    export default function createListView (name) { 
        return { 
           name: name,
           render(createElement) {
                return createElement(ListView);
           }
        }
    }
    ```
    

## 33_**하이 오더 컴포넌트에서 사용할 ListView 컴포넌트 구현**

- ListView.vue : 데이터를 뿌려주는 역할
- createListView : 데이터를 요청하는 역할
- router/index.js : createListView를 거쳐 페이지 이동을 하도록 함
    
    ```jsx
    {
        path: '/news', // url address
        name: 'news',
        // component: NewsView,
        component:  createListView('NewsView'), // high order component
    },
    {
        path: '/ask', // If you go to '/ask',
        name: 'asks',
        // component: AskView,
        component: createListView('AskView'),
    },
    {
        path: '/jobs',
        name: 'jobs',
        // component: JobsView,
        component: createListView('JobsView'),
    },
    ```
    
- CreateListView에서 데이터 받음
    
    ```jsx
    created() {
        console.log(11111);
        bus.$emit('start:spinner'); 
        setTimeout(() => { 
            this.$store.dispatch('FETCH_LIST', this.$route.name)
                .then(() => {
                    bus.$emit('end:spinner');
                })
                .catch(err => console.log(err));
        }, 1500);
    },
    ```
    
- 그걸 ListView로 랜더링
    
    ```jsx
    // (2) rendering
     render(createElement) {
          console.log(22222);
          return createElement(ListView);
     }
    ```
    
- ~~NewsView에  ListView 내용 뿌려줌~~ > NewsView, JobsView,  AskView.vue 필요 없으므로 삭제
    
    ```jsx
    createListView('NewsView') 가 작동되며, ListView가 페이지 역할을 함.
    ```
    
- ListView.vue는 ListItem 내용을 뿌려줌
- ListItem에 화면 구성 : 데이터가 전단계에서 완료됐으므로 가져오기만 하면 됨
    
    ```jsx
    <li v-for="item in listItems" :key="item.id">
    
    computed: {
        listItems() {
            return this.$store.state.list;
        }
    },
    ```
    
- 컴포넌트 구조(이전에는 NewsView 아래 바로 ListItem이 있었음) : 실질적 hoc는 NewsView
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(63).png)
    

## 34_**하이 오더 컴포넌트가 적용된 앱 구조 설명 및 흐름 정리**

- createListView

```jsx
name: 'HOC component',
// 그냥 name을 바인딩하면 
// component: createListView('AskView'), component: createListView('JobsView'),
// 처럼 인자가 컴포넌트 이름이 됨
```

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(64).png)

- 즉, NewsView, AskView, JobsView가 하이오더컴포넌트(hoc)

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(65).png)

- 이제 NewsView, JobsView,  AskView.vue 필요 없으므로 삭제

### 구조

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(66).png)

> 💡 **단계**
router change → createListView(get data) → ListView(page view) → ListItem(component)

## **Mixin의 개요와 활용처 그리고 HOC와의 차이점**

- hoc의 단점 : hoc를 많이 쓸 수록 컴포넌트가 깊어지므로, 컴포넌트 간 통신이 어려움

![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(67).png)

- [Mixin](https://joshua1988.github.io/vue-camp/reuse/mixins.html) : 재활용 로직
    - 장점
        - mixin에 선언된 코드를 불러오기만 하면 되므로 코드가 깔끔하게 정리됨
        - spinner, modal등을 Mixin으로 빼면 효율이 좋음
        - crud를 제외한 부차적 로직은 전부 Mixin으로 빼면 됨

## 35_**[실습 안내] Mixin 적용 후 HOC 구조와 비교, [실습] Mixin 실습 및 컴포넌트 재활용 방법에 대한 리뷰**

- NewsView : mixins를 선언하면, 컴포넌트가 실행되면 로직을 불러옴

```jsx
export default {
    components: {
        ListItem,
    },
    mixins: [ListMixin]
}
```

- hoc 와 mixin 비교

![hoc - listview를 거침](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(68).png)
_hoc - listview를 거침_

![mixin - 바로 listitem](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(69).png)
_mixin - 바로 listitem_

## **UX를 고려한 데이터 호출 시점**

- 데이터 호출 시점
    1. [컴포넌트 라이프 사이클 훅](https://v3.ko.vuejs.org/api/options-lifecycle-hooks.html#created) : create
        1. 컴포넌트가 생성되자마자 생성되는 로직
        2. 기본적 vue의 동작 원리(데이터 관찰, computed, watch 콜백 등)에 접근할 수 있는 라이프 사이클 훅
        3. 화면에 인스턴스 내용들이 붙어있지 않는 상태
        4. 즉, 컴포넌트가 생성되자마자 호출되는 로직
    2. [라우터 네비게이션 가드](https://joshua1988.github.io/web-development/vuejs/vue-router-navigation-guards/) : 컴포넌트에 진입하기 전에 라우터 속성을 이용(공식문서)
        1. 라우터로 특정 url에 접근하기 전의 동작들을 정의
        2. 특정 url에 접근하지 못하게 한다던지, 인증값을 확인한다던지
        3. 즉, 특정 url로 접근하기 전의 동작을 정의하는 속성(함수)
            
            ```jsx
            router.beforeEach(function (to, from, next) {
              // 라우터 주소에 진입하기 전에 어떤 로직을 여기 콜백 안에 정의
              // 이 로직이 끝나고 next를 호출했을 때만 의도한 위치로 가능
            });
            ```
            
    3. 순서는 라우터 네비게이션 가드가 먼저임
        1. 라이프 사이클 훅 : 컴포넌트가 생성되고 나서 데이터를 호출할건지
        2. 라우터 네비게이션 가드 : 컴포넌트가 생성되기 전에 라우팅 상태에서 데이터를 호출할건지

## 36_**라이프 사이클 훅을 이용한 데이터 호출 방법의 문제와 비동기 처리 코드 수정**

- News 메뉴에서 Ask 메뉴로 이동하는데, NewsView 목록이 잠깐 보이고 AskView 목록이 출력되는 현상에 대하여

```jsx
state: {
    news: [],
    jobs: [],
		// 이렇게 각각 나뉘어져 있을 때는 오동작이 나지 않았음
    list: [],
		// list라는 데이터를 news, jobs, askview가 공유하기 때문에 오동작 발생
},
```

- spinner가 안 도는 오류 : return 빼먹음
    - return fetchList을 하는 이유 : 화면에서 dispatch를 호출하고 나서, then으로 체이닝을 해야 하는데 return이 안 넘어오면 의도대로 비동기 처리가 되지 않음
    
    ```jsx
    FETCH_LIST({ commit }, name) {
          return fetchList(name)
              .then(res => { // get data
                  commit('SET_LIST', res.data); // send mutation
                  return res; // return response(send Promise object to View Page - in this case, NewsView.vue)
              })
              .catch(err => console.log(err));
      },
      FETCH_USER(context) {
          return fetchUserInfo()
          .then(res => {
              context.commit('SET_USER', res.data);
          })
          .catch(err => console.log(err));
      },
      FETCH_ITEM({ commit }, id) {
          return fetchCommentItem(id)
          .then(({ data }) => {
              commit('SET_ITEM', data);
          })
          .catch(err => console.log(err));
      },
    ```
    
    - mixin.js
    
    ```jsx
    created() { 
        bus.$emit('start:spinner');
        // #1
        console.log(1);
        this.$store.dispatch('FETCH_LIST', this.$route.name)
        // #5
            .then(() => {
                console.log(5);
                bus.$emit('end:spinner');
            })
            .catch(err => console.log(err));
    },
    ```
    
    - actions.js
        - fetchList에 대한 결과가 Promise로 체이닝이 되어, #5에 .then()이 됨
        - fetchList 앞에 return이 없을 시 #5가 제대로 동작하지 않음
    
    ```jsx
    // #2
    FETCH_LIST({ commit }, name) {
        // #3
        console.log(3);
        return fetchList(name)
        // #4
            .then(res => {
                console.log(4);
                commit('SET_LIST', res.data); 
                return res; 
            })
            .catch(err => console.log(err));
    },
    ```
    

## 37_**라우터 네비게이션을 이용한 데이터 호출 방법**

- router/index
    
    ```jsx
    {
        path: '/news', // url address
        name: 'news',
        component: NewsView, // high order component
        beforeEnter: (to, from, next) => {
            console.log(to)
            console.log(from)
            console.log(next)
        } 
    },
    ```
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(70).png)
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(71).png)
    
    ```jsx
    beforeEnter: (to, from, next) => {
        next();
    }
    // next를 호출해 줘야 url넘어감
    ```
    

## **[실습] 라우터 네비게이션 가드 실습 안내**

- 내용없음

## 38_**[실습] 라우터 네비게이션 가드 실습 및 스피너 종료 시점 변경**

- spinner 시점이 약간 안 맞음 → mounted(인스턴스가 화면에 불러오는 것이 완료되었을 때)에 spinner 종료시키기

## **자바스크립트 비동기 처리 패턴의 발전 과정**

1. 일반 자바스크립트의 비동기 코드
    
    ![john이라는 id가 있을 시 products 함수 실행](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(72).png)
    
    john이라는 id가 있을 시 products 함수 실행
    
    ![받아 온 결과 값 products는 콜백 함수 안에서 처리해야 비동기 처리 가능](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(73).png)
    
    받아 온 결과 값 products는 콜백 함수 안에서 처리해야 비동기 처리 가능
    
2. promise로 쓰는 비동기 코드
    
    ![함수](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(74).png)
    _함수_
    
    ![함수에 대한 로직](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(75).png)
    _함수에 대한 로직_
    
3. 2에서 함수 이름을 좀 더 명시적으로
    
    ![Untitled](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(76).png)
    
- 결국, john 이라는 id가 있을 시 불러온 products값을 products 변수에 담고, 이 값을 불러올 수 있는지에 대한 과정이 핵심.
    
    ![논리과정 예시(실제로직 아님)](https://raw.githubusercontent.com/abarthdew/vue-master/main/vue-master-cli3/src/assets/vue-master(77).png)
    
    논리과정 예시(실제로직 아님)
    

## **async & await 문법 소개**

- [자바스크립트 async와 await](https://joshua1988.github.io/web-development/javascript/js-async-await/), [[2]](https://joshua1988.github.io/vue-camp/es6+/async-await.html)
- 함수 선언문 앞에 `async`를 붙이고, 그 async function 안에 비동기 처리를 담당하고 promise를 반환하는 로직 앞에 `await`를 붙여줌.

```jsx
async function 함수명() {
  await 비동기_처리_메서드_명();
}
```

## 39_**async & await 예제 소개**

- 생략

## 40_**async await 예제 실습**

- 생략

## 41_**async await 에러 처리 방법과 공통화 함수 작성 방법**

- promise의 then, catch : 네트워크 요청, 비동기 요청에 대해서만 예외처리

```jsx
loginUser() {
    axios.get('https://jsonplaceholder.typicode.com/users/1')
    .then(response => {
        if (response.data.id === 1 ) {
            axios.get('https://jsonplaceholder.typicode.com/todos')
            .then(response2 => console.log(response2))
            .catch(error => console.log(error));
        }
    })
    .catch(error => console.log(error));
}
```

- async, await의 try-catch : 비동기 처리 요청뿐 아니라, 일반적 자바스크립트 코드 에러까지 포괄적으로 예외처리

```jsx
async loginUser2() {
    try {
        var response = await axios.get('https://jsonplaceholder.typicode.com/users/1');
        if (response.data.id === 1) {
            var response2 = await axios.get('https://jsonplaceholder.typicode.com/todos');
            console.log(response2);
        }
    } catch(error) {
        handleException(error);
        console.log(error);
    }
}
```

- 공통 에러처리 : utils/handelException.js

```jsx
function handleException(status) {
    // handle error logic
}
```

## 42_**async 함수를 이용한 코드 리팩토링**

- api 결과값은 new Promise(); 형태

```jsx
function fetchList(name) {
    return axios.get(`${config.baseUrl}/${name}/1.json`);
		// = return new Promise();
}
```

- return response를 하지 않으면 화면에서 비동기 순서를 보장할 수 없으므로, 프로미스 체이닝
- 결과값을 반환해줘야 FETCH_LIST2(); 를 실행하고 나서 다음 단계를 이어 실행할 수 있게 됨.
    
    ⇒ FETCH_LIST2().then().catch();
    
- async 함수에서 어떤 것을 리턴하던 promise가 리턴됨.

```jsx
async FETCH_LIST({ commit }, name) {
    const response = await fetchList(name);
    commit('SET_LIST', response.data);
    return response; // promise
},
```

## **[실습 안내] async await 실습 안내**

- 내용 없음

## 43_**[실습] async await 실습 풀이**

- 생략

## **라이브러리 모듈화의 이유와 배경**

- [Chart.js 공식 문서](https://www.chartjs.org/docs/latest/)
- [State of JS 2018 사이트](https://2018.stateofjs.com/front-end-frameworks/overview/)
1. 외부 라이브러리 모듈화
    - 이유 : vue.js 관련 라이브러리가 없을 때 일반 라이브러리를 결합할 수 있어야 함.
    - 종류 : 차트, 데이트 피커, 테이블, 스피너

## 44_**차트 라이브러리 설치 및 차트 그리기**

- 설치

```jsx
npm install chart.js
```

# Reference
- https://www.inflearn.com/course/vue-js/lecture/16981?volume=1.00&quality=1080
- router, routes 차이 : [https://im-nc2u.tistory.com/entry/Vue-Router-Router-인스턴스와-Route-객체-비교](https://im-nc2u.tistory.com/entry/Vue-Router-Router-%EC%9D%B8%EC%8A%A4%ED%84%B4%EC%8A%A4%EC%99%80-Route-%EA%B0%9D%EC%B2%B4-%EB%B9%84%EA%B5%90)
- [https://www.notion.so/vue-lesson-bb01133a21e94a969b42f1a82f8c24c7](https://www.notion.so/vue-lesson-bb01133a21e94a969b42f1a82f8c24c7?pvs=21)
- https://velog.io/@ywoosang/Node.js-%EC%84%A4%EC%B9%98
- vscode git 권한설정 : https://hyeo-noo.tistory.com/184