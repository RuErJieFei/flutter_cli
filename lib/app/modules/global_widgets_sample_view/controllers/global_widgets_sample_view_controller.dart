import 'package:flutter_cli/app/global_widgets/index.dart';
import 'package:flutter_cli/utils/index.dart';
import 'package:get/get.dart';

class GlobalWidgetsSampleViewController extends GetxController {
  //TODO: Implement GlobalWidgetsSampleViewController

  final count = 0.obs;
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
  void increment() => count.value++;

  void showDialog() {
    Get.dialog(DialoG(
      backgroundColor: Get.theme.canvasColor,
      titleText: 'MyDialog',
      bodyText: 'Dialog info.',
      confirmText: 'OK',
      cancelText: 'Cancel',
      onConfirm: () async {
        if (Tools.rand(2) == 0) {
          Toast.i('提交失败', '');
          return false;
        } else {
          return true;
        }
      },
    ));
  }

  void showBottomSheet() async {
    final level = await UI.showSelectionBottomSheet(
      selections: List.generate(3, (index) => '难度$index'),
      title: '底部弹窗',
    );
    if (level is int) {
      // sLog.e(level);
    }
  }
}
