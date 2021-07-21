import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebViewController extends GetxController {
  /// 进度条
  final _progress = 0.0.obs;
  double get progress => this._progress.value;
  set progress(double value) => this._progress.value = value;

  /// 标题
  final _title = ''.obs;
  String get title => this._title.value;
  set title(String value) => this._title.value = value;

  /// 网址
  late String url;

  InAppWebViewController? webViewController;

  @override
  void onInit() {
    url = Get.arguments['url'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
