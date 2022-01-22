// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/product/domain/usecases/update_product_usecase.dart';

class ProductController extends GetxController {
  ProductController({required this.updateProductUseCase});
  UpdateProductUsecaseInterface updateProductUseCase;

  var titleController = TextEditingController();
  var typeController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  var heightController = TextEditingController();
  var widthController = TextEditingController();
  var ratingController = TextEditingController();

  var productEdit;

  initValues({required ProductEntity product}) {
    titleController.text = product.title;
    typeController.text = product.type;
    priceController.text = product.price.toString();
    descriptionController.text = product.description;
    heightController.text = product.height.toString();
    widthController.text = product.width.toString();
    ratingController.text = product.rating.toString();
  }

  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product}) async {
    product as ProductModel;

    productEdit = product.copyWith(
        title: titleController.text,
        type: typeController.text,
        price: double.parse(priceController.text),
        description: descriptionController.text,
        height: int.parse(heightController.text),
        width: int.parse(widthController.text),
        rating: int.parse(ratingController.text));

    return updateProductUseCase(product: productEdit);
  }
}
