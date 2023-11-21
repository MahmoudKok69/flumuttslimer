import 'package:flumuttslimer/roles/student/features/news/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
