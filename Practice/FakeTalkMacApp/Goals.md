#  Goals


- 튜토리얼 지겨움 일단 뷰 특성위주 파악하는 용도로 UI 가 주가된 가짜 채팅앱 맨들기

## 1차 - 앱 구성(Domain)
- 도메인과 피처부분 구성
- 도메인에는 fake 객체로 

## 2차
- 3탭 구성
- 탭바? 컨트롤러 혹은 split view?
- 전체 scene 구조 및 플로우 구성
- 새끼 윈도우 띄우기 및 윈도우간 라이프사이클 특성 파악

## 3차 - viewModels
- Foundation 및 RxSwift 만 임포트하여(일부 relay등 iOS 모듈에서 떼왔다 가정)
- 뷰모델 위주 TC 작성(domain은 어짜피 가짜)


## 4차 - view
- 고전 방식으로 뷰 적용
- interface builder 사용 x
- 뷰모델 연결


## 5차 - viewModel 내 rx -> combine으로 포팅
- 5-1차: 말단만 포팅(가능하다면)
- 5-2차: 전체 수정


## 6차 - SwiftUI이용 View 구성
- ㅎㅎㅎ
- combine 및 swiftUI 환경내 Unit-Test 작성방법 조사


## 7차 - 메뉴바 및 앱 설정
- 메뉴바 동작, 대응 화면과의 연결 방식 탐구
- 배포방식 조사
