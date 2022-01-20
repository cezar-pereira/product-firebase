import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
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
                      return GestureDetector(
                        child: CardProductComponent(
                          productEntity: controller.productList[index],
                          onRemove: (product) async {
                            _confirmDeleteProduct(product: product);
                          },
                        ),
                      );
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

  void _confirmDeleteProduct({required ProductEntity product}) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.defaultDialog(
        title: 'Remove Produto',
        content: Text('Confirma a remoção de ${product.title}?'),
        confirm: SizedBox(
          height: 30,
          width: 80,
          child: GestureDetector(
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.black54, fontSize: 22),
            ),
            onTap: () {
              controller.removeProduct(product: product);
              Get.back();
            },
          ),
        ),
        cancel: SizedBox(
          height: 30,
          width: 80,
          child: GestureDetector(
            child: const Text('Cancelar', style: TextStyle(fontSize: 22)),
            onTap: () {
              Get.back();
            },
          ),
        ),
      );
    });
  }
}
