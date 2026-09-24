# STUDY-10: External Markdown Migration

Jira: https://sugar-coat-code.atlassian.net/browse/STUDY-10

Classification: https://github.com/abarthdew/abarthdew.github.io/issues/36

## Scope and Preservation

- Actual inventory: 41 dated posts (17 existing Java mirrors, 24 conversions). The undated `_posts/sample` fragment is not a post and is unchanged.
- All 41 existing titles, categories, tags, dates/filenames and permalinks are retained.
- Six standalone frontend/backend notes now belong in back-and-forth.
- Two English PostgreSQL documents use `_eng.md` beside their Korean originals; Korean files and images are unchanged.
- The original Git-to-Hell post body is inserted below the README heading; its numbered list remains unchanged below.
- Vue/JSP/Highcharts source documents lose blog front matter and theme-only attributes. Vue code formatting is preserved from the blog version instead of the formatter-damaged README snippets.
- Captions from `{: file='...' }` become ordinary text, not discarded. Image references and code content are retained; existing PostgreSQL image URLs become colocated relative links.
- Eight already-matching source documents retain their current contents, including repaired image paths from STUDY-7.
- No media binaries are added, copied, removed, or re-uploaded. Existing referenced media has not been relicensed or independently audited.

## Validation

- Preservation audit: 16 portable copies/appends, 8 matched source bodies (normalizing formatting and known repaired image paths), 17 pre-existing mirrors.
- All 41 wrappers retain their original non-mirror metadata and contain no duplicated body.
- Unit/regression tests cover relative/absolute/reference links, images, anchors, literal code, source front matter, failures, and the 41-post inventory.
- Full local Jekyll build against the prepared source checkouts checks all 41 outputs, image URL resolution, excerpts, Vue template literals, and PostgreSQL tables.
- A build uses the then-current source branch. This is build-time mirroring, not an automatic source-repository webhook.

## Source Map

### Source PRs to Merge First

- https://github.com/abarthdew/back-and-forth/pull/35
- https://github.com/abarthdew/dbms-for-dev/pull/5
- https://github.com/abarthdew/git-to-hell/pull/13
- https://github.com/abarthdew/vue-lesson/pull/35
- https://github.com/abarthdew/vue-master/pull/56
- https://github.com/abarthdew/jsp-with-eclipse/pull/1
- https://github.com/abarthdew/highcharts-gpt-chatbot/pull/3

All 41 source documents were fetched from public GitHub raw URLs at the commit
SHAs below and compared with the verified local contents. All matched.

Links below point at source revisions when this inventory was generated; new documents become available at their source PR commits. Runtime branches and paths are recorded in each post wrapper.

| Blog wrapper | Source | Migration |
| --- | --- | --- |
| `2019-06-21-go_to_git-to-hell_for_beginners.md` | [`git-to-hell/README.md`](https://github.com/abarthdew/git-to-hell/blob/abf3e894e75213fe63138aa79f71719e04c5d2fc/README.md) | append |
| `2021-03-15-spring_reactive_camp1.md` | [`back-and-forth/02-backend-development/spring/reactive-camp-1.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/02-backend-development/spring/reactive-camp-1.md) | existing |
| `2021-03-15-spring_reactive_camp2.md` | [`back-and-forth/02-backend-development/spring/reactive-camp-2.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/02-backend-development/spring/reactive-camp-2.md) | existing |
| `2021-03-15-spring_reactive_camp3.md` | [`back-and-forth/02-backend-development/spring/reactive-camp-3.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/02-backend-development/spring/reactive-camp-3.md) | existing |
| `2021-03-15-spring_reactive_camp4.md` | [`back-and-forth/02-backend-development/spring/reactive-camp-4.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/02-backend-development/spring/reactive-camp-4.md) | existing |
| `2021-03-16-method_reference.md` | [`back-and-forth/01-programming-languages/java/method-reference.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/01-programming-languages/java/method-reference.md) | existing |
| `2021-08-25-git_for_advanced.md` | [`infras-for-dev/04-devops-and-cicd/git/git-for-advanced.md`](https://github.com/abarthdew/infras-for-dev/blob/23f97daeea0d78f6910c979fae4566e01d0ef972/04-devops-and-cicd/git/git-for-advanced.md) | existing |
| `2021-09-11-linux_with_centos.md` | [`infras-for-dev/02-linux-and-shell/linux-with-centos.md`](https://github.com/abarthdew/infras-for-dev/blob/23f97daeea0d78f6910c979fae4566e01d0ef972/02-linux-and-shell/linux-with-centos.md) | existing |
| `2021-12-06-vue_lesson.md` | [`vue-lesson/README.md`](https://github.com/abarthdew/vue-lesson/blob/58f60e46a08a3d2ef0715642a68b9d8fce1fe981/README.md) | existing |
| `2021-12-06-vue_master.md` | [`vue-master/README.md`](https://github.com/abarthdew/vue-master/blob/5f578d19331d7b75fc6b2a627bdb020a2dd536c7/README.md) | existing |
| `2022-04-01-jsp_with_eclipse.md` | [`jsp-with-eclipse/README.md`](https://github.com/abarthdew/jsp-with-eclipse/blob/f8b9dce5b2a69437dd13ce54d1564ce2319c62cb/README.md) | existing |
| `2022-04-01-jsp_with_eclipse1.md` | [`jsp-with-eclipse/jsp_with_eclipse1.md`](https://github.com/abarthdew/jsp-with-eclipse/blob/f8b9dce5b2a69437dd13ce54d1564ce2319c62cb/jsp_with_eclipse1.md) | existing |
| `2022-04-01-jsp_with_eclipse2.md` | [`jsp-with-eclipse/jsp_with_eclipse2.md`](https://github.com/abarthdew/jsp-with-eclipse/blob/f8b9dce5b2a69437dd13ce54d1564ce2319c62cb/jsp_with_eclipse2.md) | existing |
| `2022-04-01-jsp_with_eclipse3.md` | [`jsp-with-eclipse/jsp_with_eclipse3.md`](https://github.com/abarthdew/jsp-with-eclipse/blob/f8b9dce5b2a69437dd13ce54d1564ce2319c62cb/jsp_with_eclipse3.md) | existing |
| `2022-04-08-select_all_from_postgresql1.md` | [`dbms-for-dev/03-databases/postgresql/select-all-from-postgresql-1_eng.md`](https://github.com/abarthdew/dbms-for-dev/blob/10c0f6dfbcae9f9237cc1bee522a62583b9f68f3/03-databases/postgresql/select-all-from-postgresql-1_eng.md) | new |
| `2022-04-08-select_all_from_postgresql2.md` | [`dbms-for-dev/03-databases/postgresql/select-all-from-postgresql-2_eng.md`](https://github.com/abarthdew/dbms-for-dev/blob/10c0f6dfbcae9f9237cc1bee522a62583b9f68f3/03-databases/postgresql/select-all-from-postgresql-2_eng.md) | new |
| `2022-04-10-this_is_java.md` | [`this-is-Java/README.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/README.md) | existing |
| `2022-04-11-this_is_java1.md` | [`this-is-Java/00.basics/This-is-Java1.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java1.md) | existing |
| `2022-04-12-this_is_java2.md` | [`this-is-Java/00.basics/This-is-Java2.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java2.md) | existing |
| `2022-04-13-this_is_java3.md` | [`this-is-Java/00.basics/This-is-Java3.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java3.md) | existing |
| `2022-04-14-this_is_java4.md` | [`this-is-Java/00.basics/This-is-Java4.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java4.md) | existing |
| `2022-04-15-this_is_java5.md` | [`this-is-Java/00.basics/This-is-Java5.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java5.md) | existing |
| `2022-04-16-this_is_java6.md` | [`this-is-Java/00.basics/This-is-Java6.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java6.md) | existing |
| `2022-04-17-this_is_java7.md` | [`this-is-Java/00.basics/This-is-Java7.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java7.md) | existing |
| `2022-04-18-this_is_java8.md` | [`this-is-Java/00.basics/This-is-Java8.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java8.md) | existing |
| `2022-04-19-this_is_java9.md` | [`this-is-Java/00.basics/This-is-Java9.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java9.md) | existing |
| `2022-04-20-this_is_java10.md` | [`this-is-Java/00.basics/This-is-Java10.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java10.md) | existing |
| `2022-04-21-this_is_java11.md` | [`this-is-Java/00.basics/This-is-Java11.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java11.md) | existing |
| `2022-04-22-this_is_java12.md` | [`this-is-Java/00.basics/This-is-Java12.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java12.md) | existing |
| `2022-04-23-this_is_java13.md` | [`this-is-Java/00.basics/This-is-Java13.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java13.md) | existing |
| `2022-04-24-this_is_java14.md` | [`this-is-Java/00.basics/This-is-Java14.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java14.md) | existing |
| `2022-04-25-this_is_java15.md` | [`this-is-Java/00.basics/This-is-Java15.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java15.md) | existing |
| `2022-04-26-this_is_java16.md` | [`this-is-Java/00.basics/This-is-Java16.md`](https://github.com/abarthdew/this-is-Java/blob/79d2fc87d94160787d3ad196f8f05944e6b06dda/00.basics/This-is-Java16.md) | existing |
| `2022-04-27-how_to_make_github.io_blog.md` | [`infras-for-dev/04-devops-and-cicd/github-pages/how-to-make-github-io-blog.md`](https://github.com/abarthdew/infras-for-dev/blob/23f97daeea0d78f6910c979fae4566e01d0ef972/04-devops-and-cicd/github-pages/how-to-make-github-io-blog.md) | existing |
| `2022-05-09-composition_api_and_just_component_composition_in_vue.md` | [`back-and-forth/04-frontend-development/vue/composition-api-and-component-composition.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/04-frontend-development/vue/composition-api-and-component-composition.md) | new |
| `2022-05-09-what_is_different_between_npm_and_yarn.md` | [`back-and-forth/04-frontend-development/tooling/npm-and-yarn.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/04-frontend-development/tooling/npm-and-yarn.md) | new |
| `2022-05-09-what_is_different_between_spring_core_and_spring_mvc.md` | [`back-and-forth/02-backend-development/spring/spring-core-and-spring-mvc.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/02-backend-development/spring/spring-core-and-spring-mvc.md) | new |
| `2022-05-13-what_is_different_between_vue2_and_vue3.md` | [`back-and-forth/04-frontend-development/vue/vue2-and-vue3.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/04-frontend-development/vue/vue2-and-vue3.md) | new |
| `2023-06-29-gpt_prompt_for_highcharts.md` | [`highcharts-gpt-chatbot/gpt_prompt_for_Highcharts.md`](https://github.com/abarthdew/highcharts-gpt-chatbot/blob/cb0cbccc73d20d89036b59e0c5d51c6853a6a195/gpt_prompt_for_Highcharts.md) | existing |
| `2026-02-15-front_quick_briefing.md` | [`back-and-forth/04-frontend-development/browser/cookies-cache-and-sessions.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/04-frontend-development/browser/cookies-cache-and-sessions.md) | new |
| `2026-02-15-misunderstandings_about_JS.md` | [`back-and-forth/01-programming-languages/javascript/misunderstandings-about-js.md`](https://github.com/abarthdew/back-and-forth/blob/af1c9f2206be123167264bd8370852cccd51a345/01-programming-languages/javascript/misunderstandings-about-js.md) | new |
