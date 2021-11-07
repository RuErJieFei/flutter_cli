import 'package:flutter/material.dart';
import 'package:flutter_cli/app/global_widgets/index.dart';

import 'package:get/get.dart';

import '../controllers/global_widgets_sample_view_controller.dart';

class GlobalWidgetsSampleViewView
    extends GetView<GlobalWidgetsSampleViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalWidgetsSampleViewView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBaR(
            tabs: ['Page1', 'Page2', 'Page3'],
            tag: 'tabbar_tag',
            pageViewTag: 'pageview_tag',
          ),
          Divider(
            color: Theme.of(context).disabledColor,
          ),
          Expanded(
            child: PageVieW(
              tag: 'pageview_tag',
              tabBarTag: 'tabbar_tag',
              pages: [
                KeepAliveWrapper(
                  child: page1(),
                ),
                KeepAliveWrapper(
                    child: Center(
                  child: Text('Page2'),
                )),
                KeepAliveWrapper(
                    child: Center(
                  child: Text('Page3'),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimButton(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 200,
            height: 50,
            child: Text(
              'AnimButton',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ButtoN(
          text: '普通button',
        ),
        ButtoN(
          text: 'showDialog',
          onTap: () => controller.showDialog(),
        ),
        ButtoN(
          text: 'show bottom sheet',
          onTap: () => controller.showBottomSheet(),
        )
      ],
    );
  }

  Widget page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimButton(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 200,
            height: 50,
            child: Text(
              'AnimButton',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
