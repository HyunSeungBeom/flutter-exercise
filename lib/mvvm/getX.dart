//서비스
class LocalService extends GetxService {
  // 서비스 등록
  Get.put(LocalService());

  // 등록한 서비스를 불러올 때는 아래처럼 호출(어디서든 호출 가능)
  LocalService obj = Get.find();
}

//뷰 모델
class ListViewModel extends GetxController {

  //필드 하나하나를 Rx로 선언해 Obx 위젯이 변경 내역을 통보받을 수 있게 함
  RxInt clickCount = 0.obs;
  RxBool listLoading = false.obs;
  Rx<List<Article>> list = [].obs;

  addClickCount() {
    clickCount.value++;
  }
}

class HomePage extends StatelessWidget { 
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 등록
    Get.put(ListViewModel());
  }
}