import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/presenter/components/card_product/card_product_component.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator.adaptive();
          }

          if (controller.isError.value.isNotEmpty) {
            return Text(controller.isError.value);
          }

          return Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollEndNotification>(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return CardProductComponent(
                          productEntity: controller.productList[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                  onNotification: (scrollEnd) {
                    if (scrollEnd.metrics.atEdge &&
                        scrollEnd.metrics.pixels > 0) {
                      if (!controller.isLoading.value) {
                        controller.isFetchMore.value = true;
                        controller.fetchProducts();
                      }
                    }
                    return true;
                  },
                ),
              ),
              Visibility(
                  visible: controller.isFetchMore.value,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const CircularProgressIndicator.adaptive())),
            ],
          );
        }),
      ),
    );
  }
}
