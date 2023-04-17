# swift-onban-01
팀01 - Sol, 데미안

## Pair Programming Ground Rules

### 1. 짝코딩 진행 방식
    a. 매일, 하루 3시간
    b. 밤 7시 ~ 10시
    c. 오프라인에서
    d. 정상적으로 진행된다면 주말은 휴식
    e. 단, 진도가 너무 느리다고 판단되면, 토요일 학습, 일요일 짝코딩 추가 진행
    f. 주말 짝코딩은 오후 2시부터 서로가 만족할때까지

### 2. 역할 교체 방식
    a. 기능 단위로 하되, 최대 25분을 넘기지 않는다
    b. 역할을 교체할때 코드작성을 한 팀원은 해당 브랜치에 push를 하고 역할을 교체한다

### 3. 코딩스타일
    a. 하나의 메서드는 하나의 기능만 한다
    b. 들여쓰기 레벨은 최대 2
    c. api guideline 참고하여 이름 짓기
    d. 3항 연산자 금지
    e. 메서드 최대 25라인(공백 제외, 마지막 브레이스 포함)
    f. 무조건 가독성 위주로 코드 작성

### 4. 깃허브 저장소 관리
    a. 커밋템플릿은 Karma git template 적절하게 커스텀하여 사용
    b. 이슈 주도 개발
        - 구현 과정의 체크포인트를 설정하고, 체크포인트 전까지의 모든 과정을 이슈에 기능단위로 등록
        - 이슈 등록은 기능 단위로
        - 이슈가 마무리 되면 기능구현이 마무리 되었다는 의미이므로, 바로 pr 요청
    c. 브랜치는 기능별로 새로운 이슈가 시작될때 생성
    d. 브랜치는 merge 된 이후 삭제

## 학습계획

### 1. 상품 목록 화면 구성
    a. CollectionView
    b. Custom Cell
    c. AutoLayout
    d. Xib

### 2. 의존성 관리 도구
    a. CocoaPods
    b. Swift Lint
    c. Toaster

### 3. 네트워크 프로그래밍
    a. HTTP protocol
    b. JSON
    c. URLSession
    d. API

### 4. 동시성 프로그래밍
    a. Concurrency
    b. Cache
    c. GCD Queue
    d. Download Task
    e. Operation Queue
    f. UICollectionView lazy loading

### 5. 상품 상세화면 전환
    a. delegate protocol
    b. Scene Life Cycle
    c. Scroll View 
    d. Slack API
    e. curl

## 요구사항 분석

### 1. 상품목록 화면 구성
    a. CollectionView 추가
        - [ ] Safe 영역 설정
        - [ ] 오토레이아웃 설정
    b. Cell
        - [ ] custom style 지정
        - [ ] 오토레이아웃
        - [ ] landscpae 가로/세로 모두 대응
        - [ ] 설명 레이블 wrap
    c. 반찬 섹션 구분
        - [ ] main
        - [ ] soup
        - [ ] side
    d. Cell Header Custom View
        - [ ] 오토레이아웃 적용
    e. 해당 화면이 모든 아이폰 사이즈에 대응하도록 오토레이아웃 적용
    
### 2. 의존성 관리도구
    - [ ] Cocoapod 설치
    - [ ] Swift Lint 설치
    - [ ] Cocoapod으로 Toaster 패키지 설치
    - [ ] import Toaster
    - [ ] 섹션 제목, 상품 개수 toast 형태 표시

### 3. 네트워크 프로그래밍
    a. URLSession GET 메소드 사용하여 JSON 모델 객체 구현
        - [ ] 메인반찬 JSON 데이터 받아오기
        - [ ] 국물요리 JSON 데이터 받아오기  
        - [ ] 밑반찬 JSON 데이터 받아오기
    b. JSON 모델 객체 이용하여 View 생성
        - [ ] 섹션별 모델 및 뷰 갱신(전체 갱신 지양)
        - [ ] 컬렉션뷰의 메뉴아이템을 터치할때 상세화면 api 요청하도록 구현

### 4. 동시성 프로그래밍
    a. 이미지 다운로드
        - [ ] 병렬처리
    b. 이미지 파일 이름 캐싱
    c. cell 이미지 표시할때 캐싱되어 있는 이미지가 아니면 다운로드 하여 표시
        - [ ] 다운로드, 화면처리 스레드 분리
        - [ ] 이미지 로딩 표시

### 5. 상품 상세화면 전환
    a. 추후 작성 예정
