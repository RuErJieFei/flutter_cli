import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../../utils/index.dart';
import '../controllers/web_view_controller.dart';

/// 显示网页
class WebViewView extends GetView<WebViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.title,
              style: TextStyle(fontSize: 45.sp),
            )),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(() => controller.progress < 1.0
                ? Container(
                    color: Theme.of(context).primaryColor,
                    height: 3.w,
                    width: ScreenUtil.screenWidth * controller.progress,
                  )
                : SizedBox(
                    height: 3.w,
                  )),
            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: Uri.parse('https://www.baidu.com')),
                  initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(),
                    ios: IOSInAppWebViewOptions(),
                    crossPlatform: InAppWebViewOptions(
                      supportZoom: false,
                      useShouldOverrideUrlLoading: false,
                      clearCache: true,
                      disableVerticalScroll: false,
                      javaScriptEnabled: true,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController webViewController) {
                    controller.webViewController = webViewController;
                  },
                  onLoadStart:
                      (InAppWebViewController webViewController, Uri? uri) {
                    // sLog.d("onLoadStart $uri");
                  },
                  onLoadStop:
                      (InAppWebViewController webViewController, Uri? uri) {
                    webViewController.getTitle().then((t) {
                      if (t != null) {
                        controller.title = t;
                      }
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController webViewController, int progress) {
                    controller.progress = progress / 100;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
