import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';
import 'package:products_firebase/app/modules/home/presenter/home_controller.dart';
import 'package:products_firebase/app/modules/product/presenter/components/text_form_field_component.dart';
import 'package:products_firebase/app/modules/product/presenter/functions/product_validations.dart';
import 'package:products_firebase/app/modules/product/presenter/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final product = Get.arguments;

  var controller = Get.find<ProductController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var validations = ProductValidations();
  @override
  void initState() {
    product as ProductModel;
    controller.initValues(product: product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 80),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormFieldComponent(
                    validation: validations.title,
                    hint: 'Título',
                    controller: controller.titleController),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                    validation: validations.type,
                    hint: 'Tipo',
                    controller: controller.typeController),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                  validation: validations.price,
                  hint: 'Preço',
                  controller: controller.priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                    hint: 'Descrição',
                    controller: controller.descriptionController),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                    hint: 'Altura',
                    controller: controller.heightController,
                    keyboardType: const TextInputType.numberWithOptions()),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                    hint: 'Largura',
                    controller: controller.widthController,
                    keyboardType: const TextInputType.numberWithOptions()),
                const SizedBox(height: 5),
                TextFormFieldComponent(
                  validation: validations.rating,
                  hint: 'Nota',
                  controller: controller.ratingController,
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var result =
                            await controller.updateProduct(product: product);

                        result.fold((l) => Get.snackbar('Erro', l.message),
                            (r) {
                          var homeController = Get.find<HomeController>();

                          homeController.updateProductLocal(
                              product: controller.productEdit);
                          Get.back();
                          Get.snackbar('Atualizar Produto',
                              '${controller.titleController.text} atualizado com sucesso.');
                        });
                      }
                    },
                    child: const Text('Atualizar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
