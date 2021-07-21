import 'package:get/get.dart';

import 'package:flutter_cli/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_cli/app/modules/home/views/home_view.dart';
import 'package:flutter_cli/app/modules/web_view/bindings/web_view_binding.dart';
import 'package:flutter_cli/app/modules/web_view/views/web_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => WebViewView(),
      binding: WebViewBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
