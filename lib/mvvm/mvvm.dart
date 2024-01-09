// 뷰모델을 사용하지 않는 기존 개발 방식
// func1 기능 정의가 복잡 -> 데이터를 받아와 화면을 업데이트하고 에러가 발생하면 창 닫기
// func1 결과는 어떻게 테스트하지?
func1() {
  final data = await test1();

  view.updateTitle(data.title);
  view.updateText(data.text);

  if(data.hasError) {
    Navigator.pop();
  }
}

// 뷰모델을 사용하는 경우
// func1 기능 정의가 명확 -> 외부에서 데이터를 받아와 내부에 저장
// 함수 호출 전/후 데이터를 비교해 기능 테스트 실시
func2() {
  this.data = await test1();

  if(data.hasError) {
    emit(HasError());
  }
}

//mvvm 패턴이 잘 나타낸 todo 앱
// 1. 외부에서 데이터를 받아 화면 갱신
// 2. 컴포넌트 간 데이터 공유
// 3. 앱을사용하는 중간에 언제든지 비동기 요청 발생 가능
// 4. 다른 화면 간 데이터 공유
// 5. 위젯 생성 시 사용하는 const 키워드
// 6. 위젯 유효성 여부를 검사하는 mounted 조사
// 7. StreamSubscription.cancel()
// 8. CancelableOperation.cancel()


