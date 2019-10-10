#  Goals


## You'll create multi-window document-based app inspired by TextEdit. In the process, you'll learn about:

### 1. Windows and window controllers
### 2. The Document architectures
### 3. NSTextView
### 4. Modal Windows
### 5. The menu bar and menu items



## Document

- A document is an instance of the NSDocument class that acts as the controller for the data or model in memory -> you can view this model in a window. It can be written to or read from a disk or iCloud
- 다큐먼트는 파일과 다름
- 다큐먼트는 파일 이용 인터페이스, 읽기 저장 프린트 등 First responder 역할
- undo, redo operations
- 닫기 동작시 델리게이트를 이용하여 진짜 닫을것인지 이벤트 전달됨


### NSDocument
- abstract class
- NSWindowController & NSDocumentController


## NSDocumentController
- manages all of the document objects in the app


### NSDocument
- Creates, presents and stores document data


#### NSWindowController
- manages a window in which a document is displayed


##### NSWindow

뭔말이야..

## implementation
- document 아키텍처는 기본으로 읽기/쓰기 기능이 내장, 하위클래스에서 커스터마이징 가능
