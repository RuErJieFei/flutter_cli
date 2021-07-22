import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controllers/pageview_controller.dart';
import 'controllers/tab_bar_controller.dart';

/// 配合 [TabBaR] 使用
///
/// 实现 PageView 和 TabBar 的双向绑定
///
/// ```
/// TabBaR(
///   tabs: tabs,
///   tag: 'tabbar_tag',
///   pageViewTag: 'pageview_tag',
/// ),
/// PageVieW(
///   tag: 'pageview_tag',
///   tabBarTag: 'tabbar_tag'
/// )
/// ```
///
class PageVieW extends StatelessWidget {
  PageVieW({
    required this.pages,
    this.tabBarTag,
    this.tag,
    this.physics,
  });

  final List<Widget> pages;
  final String? tag;
  final String? tabBarTag;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageViewController>(
      tag: tag,
      init: PageViewController(),
      builder: (controller) => PageView(
        physics: physics,
        controller: controller.controller,
        children: pages,
        onPageChanged: tabBarTag == null
            ? null
            : (index) => Get.find<TabBarController>(tag: tabBarTag)
                .controller
                .animateTo(index),
      ),
    );
  }
}
