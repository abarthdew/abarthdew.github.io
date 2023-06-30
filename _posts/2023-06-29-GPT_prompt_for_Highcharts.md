---
title: GPT prompt for Highcharts
date: 2023-06-29
categories: [AI, Gpt]
tags: [AI, Gpt]
math: true
mermaid: true
image:
  path: assets/img/2023/1.jpg
  width: 800
  height: 500
---

> [GPT prompt for Highcharts](https://abarthdew.github.io/highcharts-gpt-chatbot/#/){:target="_blank"} 접속하기 👈 go!
{: .prompt-tip }
> [Maker's GitHub](https://github.com/abarthdew/highcharts-gpt-chatbot){:target="_blank"} 제작자의 GitHub 🖐 Welcome🙃
{: .prompt-info }

# All Lists - 목차
[Before get Start - 서문](#before-get-start---서문)   
[ - 1. 개발자의 Gpt 활용 방식](#1-개발자의-gpt-활용-방식)   
[ - 2. 개발에 필요한 교육 시간 현저하게 줄이기](#2-개발에-필요한-교육-시간-현저하게-줄이기)   
[ - 3. 차트 구현이라는 훌륭한 예시](#3-차트-구현이라는-훌륭한-예시)   
[ - 4. Highcharts 문서의 가독성과 양의 방대함](#4-highcharts-문서의-가독성과-양의-방대함)   
[ - 5. 다양한 그래프 종류 구현과 실시간 혹은 비정형적인 질문이 가능한 환경 제공](#5-다양한-그래프-종류-구현과-실시간-혹은-비정형적인-질문이-가능한-환경-제공)   
[How to Use - 준비](#how-to-use---준비)   
[ - 1. 어플리케이션 실행](#1-어플리케이션-실행)   
[ - 2. api key 입력하기](#2-api-key-입력하기)   
[ - 3. Sample Chart 확인하기](#3-sample-chart-확인하기)   
[ - 4. Highchart의 궁금한 점에 대해 gpt에게 실시간으로 물어보기](#4-highchart의-궁금한-점에-대해-gpt에게-실시간으로-물어보기)   
[ - 5. 답변 요청하기](#5-답변-요청하기)   
[How to Run - 사용](#how-to-run---사용)   
[ - 1. 전처리 프롬프터 활용하기](#1-전처리-프롬프터-활용하기)   
[ - 2. 질문과 답변](#2-질문과-답변)   
[ - 3. 답변을 가공한 차트 시각화](#3-답변을-가공한-차트-시각화)   
[ - 4. 예시 그래프 보기](#4-예시-그래프-보기)   
[How to Set - 세팅](#how-to-set---세팅)   
[ - 1. 스펙](#1-스펙)   
[ - 2. 서비스](#2-서비스)   
[ - 3. 동적 그래프](#3-동적-그래프)   
[ETC - 배포/오류/버그](#etc---배포오류버그)   
[ - 1. 배포 방식: Git Page](#1-배포-방식-git-pages)   
[ - 2. 오류](#2-오류)   
[ - 3. 버그/개선 목록](#3-버그개선-목록)   
[Reference - 참고](#reference---참고)   

# Before get Start - 서문
---
### 1. 개발자의 Gpt 활용 방식
Gpt를 활용하는 데 있어서, 일반 사용자와 개발자는 다를 수밖에 없다. 단순히 질답 형식으로 정보를 얻는 것 이상이 필요하다. 무엇보다 플랫폼을 만드는 부서에 있으면서, 관련 어플리케이션을 구현하는 데 Gpt를 이용하면 보다 효율적인 성과를 낼 수 있다고 생각했다. 구현에 필요한 부분과 부분들을 프레임워크화 하여 개발 시간을 줄이고, 개발자들의 편의를 도모하면 어떨까?
### 2. 개발에 필요한 교육 시간 현저하게 줄이기
세상에는 수많은 개발 언어와 오픈 소스, 라이브러리 등이 있다. 단일한 요소만을 사용해 개발한다면 정말 편리하겠지만, 그럴 일은 드물고, 언어의 발전 또한 개인을 기다려주지 않는다. 매년 쏟아져 나오는 방대한 지식 내용을 좀 더 쉽고 빠르게 습득할 수 없을까? 검색에 쓸 에너지도 아깝다면, 물어보는 족족 실시간으로 대답해 주는 누군가와 협업하면 정말 좋지 않을까?
### 3. 차트 구현이라는 훌륭한 예시
이 항목은 위에서 나온 두 가지 조건을 모두 충족한다. 복잡하고 방대한 문서량의 통계 그래프를 UI 프레임워크화 할 수 있기 때문이다.   
통계 메뉴는 어떤 웹사이트든 쉽게 찾아볼 수 있는데, 매번 문서를 보며 구현하기에는 다소 시간이 든다. 이 과정에 AI를 도입해 화면 구현에 소요되는 시간을 획기적으로 줄이고, 서버 단의 코드나 SQL 쿼리를 짜는 데 시간을 더 할애해 보다 성능이 높은 수준의 코드를 짤 수 있다!
### 4. Highcharts 문서의 가독성과 양의 방대함
- [Highcharts API 문서 일부](https://api.highcharts.com/highcharts/){:target="_blank"}
```javascript
accessibility:{...}
annotations:[{...}]
boost:{...}
caption:{...}
chart:{...}
colorAxis:[{...}]
colors:[ "#2caffe", "#544fc5", "#00e272", "#fe6a35", "#6b8abc", "#d568fb", "#2ee0ca", "#fa4b42", "#feb56a", "#91e8e12 ]
credits:{...}
data:{...}
defs:{...}
drilldown:{...}
exporting:{...}
legend:{...}
loading:{...}
navigation:{...}
noData:{...}
pane:{...}
plotOptions:{...}
responsive:{...}
series:[{...}]
sonification:{...}
subtitle:{...}
time:{...}
title:{...}
tooltip:{...}
xAxis:[{...}]
yAxis:[{...}]
zAxis:[{...}]
```
앞서 언급했듯, 통계 그래프의 문서는 양이 방대하다. X축, Y축, 범례, 값을 나타내는 개체의 모양과 라벨 내용까지, 무수한 property의 연속이다. 무엇보다 제일 성가신 점은, 개발이 끝난 후에는 내용을 잊어버린다는 것이다. 구현 빈도는 잦지만 보통 메뉴의 한 쪽만 차지하는 내용이라 개발과 개발 사이의 텀이 길고, 차트 라이브러리도 천차만별이어서 그렇다.   

### 5. 다양한 그래프 종류 구현과 실시간 혹은 비정형적인 질문이 가능한 환경 제공
예시로 구현된 `GPT prompt for Highcharts`는 수많은 라이브러리들 중 `Highcharts`만 특정한다. 사용자(개발자)가 차트에 관한 것을 물으면, 자동으로 `Highcharts`에 대한 내용을 답변해 준다. 또한, 개발자의 입장에서 필요할 법한 몇 가지 기능을 추가로 구현했다. 청사진을 목적으로 만들었기에 완벽하진 않지만.


# How to Use - 준비
---
### 1. 어플리케이션 실행
- 배포 주소   

> [GPT prompt for Highcharts](https://abarthdew.github.io/highcharts-gpt-chatbot/#/){:target="_blank"} 접속하기 👈 go!
{: .prompt-tip }

- 로컬에서 실행하는 경우
```bash
$ npm install
$ npm run dev
```

### 2. api key 입력하기
모든 기능을 온전히 사용하기 위해, [openai 홈페이지](https://platform.openai.com/){:target="_blank"} 에서 제공되는 개인 api key를 입력한다.
![Untitled](assets/img/2023/1(1).png)

### 3. Sample Chart 확인하기
차트 구조가 생소하다면, 기본 line chart 예시를 참고할 수 있도록 위와 같이 간단한 명칭 설명과 코드를 구현해 놓았다.   
![Untitled](assets/img/2023/1(2).png)

### 4. Highchart의 궁금한 점에 대해 Gpt에게 실시간으로 물어보기
전처리 명령 프롬프터 역할을 하는 System란에 `전제`를 깔아둘 수 있다. 이 세팅 덕분에, 사용자가 차트 종류를 특정하지 않더라도 반드시 `Highchart`에 관한 결과가 도출된다.   
![Untitled](assets/img/2023/1(3).png)
> 
번역: Highcharts, Vue2 버전을 기준으로, 하나의 json 형식 markdown 코드 블록을 제시하고, chartOptions 라는 객체만 사용한다. 포맷은 다음과 같고, html 이나 import 코드는 넣지 말 것. 설명을 덧붙일 순 있지만 일반 문자만 가능하다.
{: .prompt-info }
> - 자유롭게 물어보기   
Highcharts에 대해 질문하고 싶은 것을 입력할 수 있다.
![Untitled](assets/img/2023/1(4).png)
> - 자세한 예시 차트 검색하고 답변 받기   
sample로 제시된 line chart 보다 다소 복잡한 형식의 차트 예시 코드를 보고, 그에 대한 설명을 제공받을 수 있다.   
![Untitled](assets/img/2023/1(5).png)

### 5. 답변 요청하기
모든 요소가 충족되었으면, SEND MESSAGE 버튼 클릭!
![Untitled](assets/img/2023/1(6).png)


# How to Run - 사용
---
### 1. 전처리 프롬프터 활용하기
system은 앞서 설명했듯 질문에 전제되는 규칙이나 형식 등을 정하는 데 사용된다. 현재 어플리케이션에는 고정해 놓았지만, 입력받는 형식으로 만들면 자신이 원하는 주제에 대한 규칙이나 형식을 정할 수 있으므로 활용성이 높다. Gpt는 방대한 정보를 가지고 그 중에서 답변을 도출해내기 때문에, 이를 사용해 범위를 좁히는 작업이 필수적이다.   
만약 system이 공란인 상태에서 chart에 대한 정보를 질문한다면, Gpt는 Highcharts 뿐만 아니라 google chart, chart js, AmCharts에 관련된 답을 돌려 줄 것이다. 즉, 사용자는 일관적인 답변을 제공받지 못한다. 이미 무수한 차트 라이브러리가 존재하기 때문이다.
### 2. 질문과 답변
> 
질문: 간단한 Column Chart 코드를 써 줘.   
답변: chart 데이터를 chartOptions 객체로 감싸 답변 + 간단한 설명 + 동적 차트 시각화
{: .prompt-info }
![Untitled](assets/img/2023/1(7).png)
_json코드 리턴(생략)_
![Untitled](assets/img/2023/1(8).png)
_간단한 설명과 응답된 값을 토대로 차트 시각화_

### 3. 답변을 가공한 차트 시각화
여기서 system 전처리 기능이 빛을 발한다. 응답된 json 객체를 가공해 차트를 시각화하기 위해, `응답 객체의 이름은 chartOptions로 한다`는 전제가 필요하다.   
![Untitled](assets/img/2023/1(9).png)

### 4. 예시 그래프 보기
하지만, 차트의 각 api 요소를 모르는 상태에서 질문을 하기란 쉽지 않다. `"Column 차트에 대한 모든 요소를 코드로 구현해 줘."` 라는 요청을 해도, 그야말로 실제 어플리케이션 구현에 필요한 요소를 충분히 리턴해 주지는 않는다. 이 점을 보완하기 위해 보다 복잡한 차트를 예시로 확인할 수 있도록 했다. 추가로 설명도 덧붙여 준다. (현재는 `컬럼`, `스택 컬럼`, `풀 스택 컬럼`, `다중 x축`, `트리 맵` 차트 예시만 가능하다.)
![Untitled](assets/img/2023/1(10).png)
_OVERLAP 버튼을 클릭했을 때_
![Untitled](assets/img/2023/1(11).png)
_TREEMAP 버튼을 클릭했을 때_


# How to Set - 세팅
---
### 1. 스펙
- 구현: `Vue3`
- Gpt model: `gpt-3.5-turbo`
- chart: `vue3-highcharts`
- markdown ui: `vue3-markdown-it`   

> 구현은 `Vue3`, 코드 예시는 `Vue2`인 이유
<br>: Vue2 버전으로 리턴되는 json 형식이 보다 정형화되어 있기 때문에, 이해가 쉬움.
{: .prompt-danger }

### 2. 서비스
- openai.js 내 코드로 통신 및 응답 리스트 전송
```javascript
const createCompletion = (client) => ({
    messages,
}) => client.post('/v1/chat/completions', {
    model: 'gpt-3.5-turbo',
    messages,
});
```
{: file='Gpt api 호출 - 응답 코드'}

- 응답 형식
```javascript
message = [
    // 먼저 메세지 형식화
    { "role": "system", "content": systemMessage }, 
    // user - assistant 메세지가 번갈아 표시
    { "role": "user", "content": userMessage },
    { "role": "assistant", "content": assistantMessage },
    { "role": "user", "content": userMessage },
    // ...
]
```

### 3. 동적 그래프
- chartOptions 객체를 추출해내는 regex
```javascript
const chartOptions = async (content) => {
  let regex = new RegExp(/(```(.|\n)*```)/, "g");
    let reply = content.match(regex);
    try {
      const chartData = reply[0].split('\n').filter((item) => !!item);
      let result = [];
      for (let i=0; i<chartData.length - 1; i++) {
        if (i!==0) {
          result += chartData[i]
        }
      }
      data.chartOptions = JSON.parse(result);
    } catch (err) {
      data.error = err?.response?.data?.error?.message || err.message;
    }
}
```

 > 만일 Gpt가 system 형식에 부합하지 않는 답을 도출할 시, 해당 답변의 그래프 시각화는 중단되고 에러 메세지가 출력된다.
{: .prompt-warning }

- 차트 컴포넌트
```javascript
data.resultMessages.push(new Message(ROLE_ASSISTANT, message.content, data.chartOptions))
```
{: file='답변 가공 후 data.resultMessage 배열에 push'}


# ETC - 배포/오류/버그
---
### 1. 배포 방식: Git Pages
- deploy yml file
[.github/workflows/gh-pages.yaml](https://github.com/abarthdew/highcharts-gpt-chatbot/blob/main/.github/workflows/gh-pages.yml){:target="_blank"}
> - 배포에 필요한 명령어들을 작성한 파일.
> - [참고](https://codingapple.com/unit/vue-build-and-deploy-with-github-pages/){:target="_blank"}에 나오는 것처럼, `npm run build`를 호출해 압축 파일들을 /dist에 수동으로 저장할 필요 없음.
> - gitHub deploy시, 자동으로 gh-pages 브랜치가 생성되고 배포할 결과물이 저장된다. 

- [Settings] - choose deploy method
> - 배포에는 두 가지 방법이 있음.
> 1. git actions 사용, 2. git 브랜치로 배포(Deploy from a branch)
> - 현재 프로젝트는 2. 방식 채택.
> - 배포 결과물이 gh-pages에 저장되므로 배포 브랜치는 main이 아닌 gh-pages.   
> - 하지만, gh-pages 브랜치를 먼저 만들어 줘야 하므로 gh-pages.yml 파일을 push -> 파일 내용에 의해 [Actions](https://github.com/abarthdew/highcharts-gpt-chatbot/actions/runs/5410468901){:target="_blank"} 탭에서 자동으로 deploy됨 -> gh-pages 브랜치 생성 및 배포 파일 자동 저장됨.
> ![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/b6c78224-dfdf-416e-a999-22f5a3e304e2)
> - 그 다음, [Settings - Actions](https://github.com/abarthdew/highcharts-gpt-chatbot/settings/pages){:target="_blank"} 탭에서 main으로 되어 있는 설정을 gh-pages로 바꿈.
> ![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/bcfc726a-3fb2-407a-b34d-07553b94aa9f)

- [Actions] - check build & deploy
> - 위 [Settings]에서 gh-pages 브랜치 설정 후, [Actions](https://github.com/abarthdew/highcharts-gpt-chatbot/actions/runs/5410493027){:target="_blank"} 탭에서 다시 결과물이 배포됨.
> - 그 외, 코드 수정 후 git push -> 배포 자동 실행 및 로그 확인 가능.
> ![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/8fdeecab-eef1-4356-87f8-fef6e0970450)
> - [reference](https://github.com/memochou1993/gpt-prompt-trainer/actions/runs/4621383101){:target="_blank"}

### 2. 오류
2-1. npm install 오류
```bash
$ npm i --save vue3-highcharts

✘ [ERROR] Could not resolve "highcharts"

    node_modules/highcharts-vue/dist/highcharts-vue.min.js:1:90:
      1 │ ...?module.exports=e(require("highcharts"),require("vue")):"functio...
        ╵                              ~~~~~~~~~~~~

  You can mark the path "highcharts" as external to exclude it from the bundle,
  which will remove this error. You can also surround this "require" call with a
  try/catch block to handle this failure at run-time instead of bundle-time.
```
- solution
> Excluding highcharts via optimizeDeps.exclude would clear the error, but that would defeat your ultimate goal of using highcharts in your project. You'll notice that after using that config, your project still is not able to import highcharts. The error is indicating that your project is missing that dependency.
> The solution would be to install highcharts:
> [=> references](https://stackoverflow.com/questions/71790261/error-when-adding-highchartsjs-to-vue3-app){:target="_blank"}
```bash
$ npm install -S highcharts
```
- conclusion
```bash
$ npm i --save vue3-highcharts
$ npm install -S highcharts
```

2-2. deploy 오류
- [permission write&read](https://github.com/ad-m/github-push-action/issues/96){:target="_blank"}
```bash
remote: Permission to NRCHKB/node-red-contrib-homekit-docker.git denied to github-actions[bot].
fatal: unable to access 'https://github.com/NRCHKB/node-red-contrib-homekit-docker.git/': The requested URL returned error: 403
Error: Invalid exit code: 128
```
> 1. deploy yml file에 명령어로 넣는 방식, 2. 프로젝트 settings 에서 설정하는 방식 두 가지가 있음.
> 현재 프로젝트는 2. 방식 채택
> [Settings -> Actions -> general](https://github.com/abarthdew/highcharts-gpt-chatbot/settings/actions){:target="_blank"}
> ![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/a7e9034e-4d37-4518-a666-2f0f5b6e160e)

- [deploy is waiting for github-pages deployment approval](https://github.com/orgs/community/discussions/59600){:target="_blank"}
> ![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/c06d3e94-7165-4368-a257-181898ad0768)  
> deploy 상태가 waiting에서 안 넘어가길래 별짓을 다 해봤는데 알고 봤더니 gitHub 자체 업데이트 때문에 벌어진 일이었다. 앞으론 안 된다고 냅다 리포지토리 날리지 말고 [gitHub Status](https://www.githubstatus.com/){:target="_blank"} 상태도 확인하자...   
![image](https://github.com/abarthdew/highcharts-gpt-chatbot/assets/51596506/051cacb9-fd93-428d-8738-8f1ad08352b0)


### 3. 버그/개선 목록
`2023/06/30`
- 동적 차트 일괄 변경되는 문제 -> append로 코드 변경 고려(x) -> 객체 분리 ⭕
- 응답 코드 실시간 타이핑으로 변경 -> 언젠가
- system 데이터 입력받는 형식으로 변경 -> 언젠가
- favicon 변경 ⭕
- header: docs 주소 변경 ⭕
- treemap 차트 click event 추가 -> 언젠가
- user message 공란일 때 send message = return false;(x) -> data.userMessage 빈값일 시 버튼 disabled ⭕
- 가끔 엉뚱한 답변&느린 응답 -> gpt 잘못이니 신경 안 쓸 예정

# Reference - 참고
---
- vue3 global settings | global variable | vuex | setup
> refer [1](https://kyounghwan01.github.io/blog/Vue/vue3/global-state/#composition-api%E1%84%85%E1%85%A9-%E1%84%80%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%84%87%E1%85%A5%E1%86%AF-%E1%84%87%E1%85%A7%E1%86%AB%E1%84%89%E1%85%AE-%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5){:target="_blank"}
, [2](https://kkh0977.tistory.com/1954){:target="_blank"}

- global component/dynamic component
> refer [1](https://velog.io/@byunghun-jake/Vue-%EC%BB%B4%ED%8F%AC%EB%84%8C%ED%8A%B8-%EC%A0%84%EC%97%AD%EB%93%B1%EB%A1%9D){:target="_blank"}
, [2](https://empty-castle.tistory.com/3){:target="_blank"}
, [3](https://mine-it-record.tistory.com/350){:target="_blank"}

- vue3 vuex
> refer [1](https://kkh0977.tistory.com/1955){:target="_blank"}
,[2](https://kyounghwan01.github.io/Vue/vue3/composition-api-vuex/#%EC%A0%84%EC%97%AD-action-mutation-%EC%8B%A4%ED%96%89){:target="_blank"}
,[3](https://stackblitz.com/edit/vue3-vuex-mapgetters-namespaced-module?file=src%2FApp.vue){:target="_blank"}
,[4](https://kyounghwan01.github.io/blog/Vue/vue3/global-state/#composition-api%E1%84%85%E1%85%A9-%E1%84%80%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%84%87%E1%85%A5%E1%86%AF-%E1%84%87%E1%85%A7%E1%86%AB%E1%84%89%E1%85%AE-%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5){:target="_blank"}
,[5](https://vuex.vuejs.org/guide/modules.html#module-reuse){:target="_blank"}
,[6](https://velog.io/@rachaen/Vuex4-modules-Vue3-store-%EB%AA%A8%EB%93%88%ED%99%94-%EC%8B%9C%ED%82%A4%EA%B8%B0){:target="_blank"}
,[7](https://velog.io/@oneook/Vuex%EC%99%80-%ED%95%A8%EA%BB%98-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-%EC%A0%84%EC%97%AD-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC){:target="_blank"}

- gpt
> refer [1](https://www.visionboy.me/815){:target="_blank"}
, [2](https://velog.io/@g_c0916/%ED%86%A0%EC%9D%B4-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-chat-GPT-API){:target="_blank"}
, [3](https://re-hwi.tistory.com/121){:target="_blank"}
, [4](https://velog.io/@bk87/GPT%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-QnA-%EC%B1%97%EB%B4%87-%EB%A7%8C%EB%93%A4%EA%B8%B0){:target="_blank"}
, [5](https://welcometodannas.tistory.com/69){:target="_blank"}
, [6](https://donny00.tistory.com/33){:target="_blank"}
, [7](https://github.com/tmdgusya/study-english-with-gpt){:target="_blank"}
, [8](https://techbukket.com/blog/chatgpt-api-javascript){:target="_blank"}
, [9](https://passwd.tistory.com/entry/Python-OpenAI-API-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0){:target="_blank"}
, [10](https://passwd.tistory.com/entry/Python-OpenAI-API-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0){:target="_blank"}

- regex
> refer [1](https://dmstjq92.medium.com/%EC%A0%95%EA%B7%9C%EC%8B%9D-%EC%A4%84%EB%B0%94%EA%BF%88-%ED%8F%AC%ED%95%A8-%EB%AA%A8%EB%93%A0-%EB%AC%B8%EC%9E%90-%EC%9D%BC%EC%B9%98-js%EC%86%8D%EC%84%B1%EA%B2%80%EC%83%89-%ED%85%8C%ED%81%AC%EB%8B%89-f70c1432a33f){:target="_blank"}

- git status
> refer [1](https://www.githubstatus.com/){:target="_blank"}
, [2](https://github.com/orgs/community/discussions/59600){:target="_blank"}

- git actions & deploy
> refer [1](https://github.com/orgs/community/discussions/23885){:target="_blank"}
, [2](https://docs.github.com/en/actions/managing-workflow-runs/reviewing-deployments){:target="_blank"}
, [3](https://github.com/marketplace/actions/manual-workflow-approval){:target="_blank"}
