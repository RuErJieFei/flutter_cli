import 'package:flutter_cli/app/data/services/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void toWeb() {
    BrowserService.to.openAppBrowser('https://www.baidu.com');
  }
}
