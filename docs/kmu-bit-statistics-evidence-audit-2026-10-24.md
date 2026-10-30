# KMU BIT 통계데이터분석 | 2026-10-24 자료 교차검증·범위 보정 (학습/연구)
> Status: Evidence-calibrated draft · Reviewer check required · 비공식 개인 학습자료  
> Scope: 2026-2 곽기영 교수 통계데이터분석, 기존 스터디·치트시트·모의고사와 연계.

## 1. 확인된 사실 / 확인되지 않은 사실

| 주장 | 판정 | 근거 |
|---|---|---|
| 1~3주 R 기초(부록 A), 4주 데이터요약(1장), 5주 가설검정(2장), 6주 평균검정(3장), 7주 분산분석(4장) | 공식 **수업 진도** | [교수 수업계획서 Drive](https://drive.google.com/file/d/1ArAvBTd7CsNVuC-NabiAnsrksMfJ6Vu6/view) |
| 10/24 8주차 중간시험, 평가비중 중간 45% | 수업계획서상 예정 | 상동 |
| 중간시험이 1~7주/교재 1~4장 전체를 포함 | **확정 불가**: 강의 진도를 출제범위와 동일시하면 안 됨 | 수업계획서는 출제범위 미기재 |
| 이전 별도 시험 안내에서 'R 부록A + 교재 1~3장' 언급 | 사용자 제공 과거 안내 기록; LMS 원문 재확인 필요 | 대화의 시험 안내, 현재 직접 공지 미조회 |
| 오픈북 여부, RStudio·인터넷·AI 허용 | 공식 문서로 미확인 | 교수/학교 LMS 공지 우선 |
| 시험지 사진 첫 페이지의 출제 주제 | **확인됨:** `setwd()` 경로, RStudio 할당 연산자 단축키, 탐색경로(search path) | 사용자 제공 2026-10-24 사진 1페이지; 공개 재배포 안 함 |
| 모의고사 20/36문항 | **모델 제작 연습문제**, 기출 아님 | 기존 학습 ZIP |
| 로컬 R 스크립트 실행 검증 | **미실시:** 제작 환경에 `Rscript` 부재 | 코드 형태 점검과 실제 실행 구별 |

**교정 원칙:** 중간시험 핵심 자료 = 부록 A + 1~3장(별도 안내 재확인 전 임시 범위); 교재 4장 ANOVA는 7주차 학습/시험범위 확인 전 보충. 9주차 이후의 `chisq.test()`, `cor()`, `lm()`은 진도 밖 심화로 별도 보관.

## 2. 실제 사진 기반 R 기초 오류 방지 (3문항 범위만)

- 현재 작업폴더 보기: `getwd()`; 설정: `setwd("D:/MyWorkSpaceR")` 또는 `setwd("D:\\\\MyWorkSpaceR")`. 실제 존재하는 폴더를 사용. [R 공식 문서](https://search.r-project.org/R/refmans/base/html/getwd.html)
- RStudio Windows에서 `<-` 입력 기본 단축키: **Alt + -**. R의 `<- `는 오른쪽 값을 왼쪽 객체에 할당.
- R 검색 경로: `search()`; 파일 탐색용 `list.files()`나 인터넷 검색과 구별. `search()`는 객체를 찾을 때 참조하는 환경·연결 패키지 경로를 보여줌.
- 사진에 보이는 수기 표시만으로 실제 점수·정답 번호 전수 확인 불가. 시험 전 문항/정답을 공용 저장소에 그대로 전재하지 않음.

## 3. 시험/연구를 구별한 통계적 해석

- 시험 수준: `p <= alpha`일 때 해당 가정 하에서 **H0 기각**; `p > alpha`는 **기각하지 못함**이지 H0의 진실을 증명하지 않음.
- `t.test()`의 독립 두 집단 기본은 `var.equal=FALSE`인 **Welch**. [R 문서](https://search.r-project.org/R/refmans/stats/help/t.test.html)
- Shapiro/분산검정 `p>0.05`는 가정 충족의 증명이 아님. 가정검정만으로 분석법을 자동 전환하지 않음.
- `aov()` 전체 p값과 `TukeyHSD()` 집단쌍 `p adj`는 서로 다른 질문. [공식 ANOVA](https://search.r-project.org/R/refmans/stats/html/aov.html) / [Tukey](https://search.r-project.org/R/refmans/stats/html/TukeyHSD.html)
- 통계적 유의성은 효과 크기·실무 중요도·인과효과와 같지 않음. [Wasserstein & Lazar (2016), ASA](https://doi.org/10.1080/00031305.2016.1154108); [West (2021), Welch](https://doi.org/10.1177/0004563221992088).
- `psych::alpha`의 Cronbach alpha 0.7은 편의적 경험칙이며 자동 신뢰성 보증 기준이 아님. 4주차 개별 필수 범위인지 불확실.

## 4. 교과 → 연구 연계 (방법 선택 전에 자료단위·가정 확인)

| 연구 축 | 연구단위/종속변수 | 예비 분석 | 필수 주의 |
|---|---|---|---|
| RAD/Agentic AI | 정책별 독립 실험 회차의 연속형 latency | ANOVA/회귀 | 정책×위험도 상호작용, 무작위화, 분석단위 선확정. 동일 시나리오 반복이면 독립 ANOVA 부적절할 수 있음 |
| AIOps/NetOps | 장애 처리시간·MTTR | 기술통계/전후 paired 비교 | 장애 난이도, 계절성, 반복·검열 구조 통제 |
| Human–AI | 적절한 의존/개입 여부(이진) | 분류·로지스틱 (후반 확장) | 자기보고 trust와 실제 행동을 별개로 측정 |
| AIVC/기업 AI역량 | 기업-시점 패널 지표 | 회귀/패널 (후반 확장) | 횡단 설문과 기업 종단 흔적의 측정 수준 혼합 금지 |
| bfMBA 경영통계 | 분포·추정·신뢰구간 | R 요약·분포 함수 | 학교별 진도·시험범위와 구분 |

이 연구 매핑은 **분석 설계 후보**이며 검정 실행 결과나 인과 효과의 증거가 아님. Canonical 연구 SSOT와 데이터·스크립트 provenance 기록 후 분석.

## 5. Google Scholar와 문헌 검증 절차

[Google Scholar 한국어](https://scholar.google.com/?hl=ko)에서 아래 정확한 서지정보/DOI를 검색하고, '인용'으로 서지 형식을 복사한 뒤 저널 원문과 DOI로 대조한다. 결과는 기본적으로 관련성 정렬이므로 연도 제한과 날짜순을 별도로 조정한다. [Scholar 공식 도움말](https://scholar.google.com/intl/uk/scholar/help.html).

검색어:
1. `"The ASA Statement on p-Values" Wasserstein Lazar 2016`
2. `"Moving to a World Beyond" p 0.05 2019`
3. `"Best practice in statistics" "Welch t-test" 2021`
4. `repeated measures non independent data ANOVA mixed effects experiment`

**증거 상태:** 이번 Consensus 신규 검색은 월간 한도 초과로 실패. 따라서 이 문서의 외부 인용은 별도로 확인한 출판사 원문/공식 R 문서 기반이며 'Consensus 문헌 전수검색'으로 표기하지 않는다.

## 6. 분리/보존 원칙

- `master`의 교수 교재 장별 스크립트는 수정하지 않는다.
- 이 문서는 개인 학습 검증 메모이며 실제 시험문항·응시자 표시·성적·답안은 공개하지 않는다.
- 부록A 기반 실습: [`study/midterm_r_basics_review.R`](../study/midterm_r_basics_review.R); ANOVA는 별도 후속 학습 자료로 구분.
- Notion: [과목 정본](https://app.notion.com/p/3e1d67f01bc1812bb4b7fe05381eec06) / [BIT Research Architecture](https://app.notion.com/p/3e2d67f01bc181bf88fcc25113789510)
- Google Drive: [과목 학습 검토](https://drive.google.com/file/d/1J0kNUUl0iYOxf9B45XOcEdoPlcSnWe_k/view). 개인 연구 파일과 공개 코드의 일치 여부는 별도 확인.
- [2026-10-24 Google Drive 최신 교차검증 보고서](https://docs.google.com/document/d/1KlZNy1oO2MGEXEKJpUkl0CEv5DprWPQ-czRA-GJ2GZ8/edit): 시험범위·자료 출처·연구방법론을 원문 변경 없이 별도 보고서로 보존.

## 7. 미해결 관문

- [ ] 중간시험 범위·허용도구·실제 실시 방식의 원본 LMS 공지 확인
- [ ] 시험지 전체 페이지 확보 시 원본 비공개 보관 + 문항 유형만 비식별 분석
- [ ] R 설치 환경에서 새 실습 스크립트 실행 및 `sessionInfo()` 로그 보관
- [ ] 연구별 분석 단위, 효과 크기, CI, 다중검정 계획 및 data provenance 확정
