import 'package:get/get.dart';

import '../controllers/global_widgets_sample_view_controller.dart';

class GlobalWidgetsSampleViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalWidgetsSampleViewController>(
      () => GlobalWidgetsSampleViewController(),
    );
  }
}
