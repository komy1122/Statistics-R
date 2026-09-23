# 개인 R 학습 기록

이 저장소는 곽기영 교수의 `kykwahk/Statistics-R`을 fork한 학습 저장소입니다. 교재 소스의 저자·출처를 유지하며, 개인 실습은 `test/`에 둡니다.

## 원격

- origin: 개인 fork `komy1122/Statistics-R`
- upstream: 교재 원본 `kykwahk/Statistics-R`
- 기본 브랜치: master

2026-09-24 검토 시 로컬 HEAD, origin/master, upstream/master는 같았습니다. 개인 실습 변경은 이후 별도 커밋으로 기록합니다. upstream에 직접 push하지 않습니다.

## 실행

```powershell
Rscript --vanilla test/test_fahcel.R
Rscript --vanilla test/FahCel.R 32 212 -40
```

자기 자신을 source하던 코드를 제거하고 순수 변환 함수와 입력 검사를 추가했습니다. 사용자 PC의 고정 경로 이동과 save.image 호출을 제거했습니다. 교재 17개 R 스크립트는 원본을 유지합니다. 교재 분석 전체는 필요한 패키지/데이터를 설치한 뒤 장별로 실행해야 하며 문법 검사 통과가 분석 결과 검증을 의미하지 않습니다.

## 동기화

```powershell
git fetch origin
git status --short --branch
git pull --ff-only origin master
# 검토한 개인 실습만 stage/commit
git push origin master
```

작업 중인 변경이 있으면 먼저 기록하고 pull합니다. upstream 업데이트는 fetch 후 diff를 확인하고 명시적으로 merge합니다. .RData, .Rhistory, .Rproj.user는 Git에서 제외합니다.
