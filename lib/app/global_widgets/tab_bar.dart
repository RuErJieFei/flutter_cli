import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/screen.dart';
import 'controllers/pageview_controller.dart';
import 'controllers/tab_bar_controller.dart';

const double _kTabHeight = 46.0;

/// 配合 [PageView] 使用
///
/// 实现 PageView 和 TabBar 的双向绑定
///
/// ```
/// TabBaR(
///   tabs: tabs,
///   tag: 'tabbar_tag',
///   pageViewTag: 'pageview_tag',
/// ),
/// PageView(
///   tag: 'pageview_tag',
///   tabBarTag: 'tabbar_tag'
/// )
/// ```
///
class TabBaR extends StatefulWidget implements PreferredSizeWidget {
  TabBaR({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.tag,
    this.pageViewTag,
    this.onTap,
  }) : super(key: key);

  final List<String> tabs;
  final bool isScrollable;
  final String? tag;
  final String? pageViewTag;
  final Function(int)? onTap;

  @override
  Size get preferredSize {
    return Size.fromHeight(_kTabHeight + 8.w);
  }

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBaR> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarController>(
      tag: widget.tag,
      init: TabBarController(tabs: widget.tabs, vsync: this),
      didUpdateWidget: (controller, state) {
        state.setState(() {
          Get.find<TabBarController>(tag: widget.tag).controller =
              TabController(length: widget.tabs.length, vsync: this);
        });
      },
      builder: (controller) => Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
            labelStyle: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w700),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Theme.of(context).disabledColor,
            isScrollable: widget.isScrollable,
            controller: controller.controller,
            tabs: widget.tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
            onTap: widget.onTap == null && widget.pageViewTag == null
                ? null
                : (index) {
                    widget.onTap?.call(index);
                    if (widget.pageViewTag != null)
                      Get.find<PageViewController>(tag: widget.pageViewTag)
                          .controller
                          .jumpToPage(index);
                  }),
      ),
    );
  }
}
