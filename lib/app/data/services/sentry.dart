import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'mixins/sentry_event.dart';

final T = () => SentryService.to;

/// 埋点服务
class SentryService extends GetxService {
  static SentryService get to => Get.find();

  @override
  onClose() {
    super.onClose();
  }

  /// 上报事件
  event(String event) {
    if (!kReleaseMode) {
      return;
    }
    Sentry.captureMessage(event);
  }

  /// 上报错误日志
  error(Object e, [StackTrace? s]) {
    if (!kReleaseMode) {
      return;
    }
    Sentry.captureException(e, stackTrace: s);
  }

  /// page 打开
  pageStart(String page) {
    if (!kReleaseMode) {
      return;
    }
  }

  /// page 关闭
  pageEnd(String page) {
    if (!kReleaseMode) {
      return;
    }
  }
}
