import 'package:flutter/material.dart';
import 'package:flutter_cli/app/routes/index.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => controller.toWeb(),
              child: Text('Web'),
              backgroundColor: Colors.blue,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => controller.upToast(),
              child: Text('Toast'),
              backgroundColor: Colors.blue,
            ),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => Get.toNamed(Routes.GLOBAL_WIDGETS_SAMPLE_VIEW),
              child: Text('widget'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
