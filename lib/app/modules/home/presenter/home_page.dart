import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator.adaptive();
          }

          if (controller.isError.value.isNotEmpty) {
            return Text(controller.isError.value);
          }

          return ListView.separated(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return Text(controller.productList[index].title);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        }),
      ),
    );
  }
}
