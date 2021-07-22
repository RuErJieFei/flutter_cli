import 'package:get/get.dart';

// import '../../modules/splash/controllers/splash_controller.dart';
import 'browser.dart';
import 'sentry.dart';
import 'index.dart';

/// 服务初始化
Future initServices() async {
  Get.lazyPut(() => SentryService());
  await Get.put(() => BrowserService());
}
