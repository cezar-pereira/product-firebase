import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';

void main() {
  late final ProductModel productModel;

  setUpAll(() {
    productModel = ProductModel.fromMap(map: data['products'][0]);
  });

  test('Should create a ProductModel', () {
    expect(productModel, isA<ProductModel>());
  });
}

Map<String, dynamic> data = {
  "products": [
    {
      "id": '1',
      "title": "Brown eggs",
      "type": "dairy",
      "description": "Raw organic brown eggs in a basket",
      "filename": "0.jpg",
      "height": 600,
      "width": 400,
      "price": 28.1,
      "rating": 4,
      "createdAt": Timestamp.now(),
      "urlImg": "url"
    }
  ]
};
