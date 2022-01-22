import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/product/infra/datasources/produtc_datasource.dart';

class ProductFirebaseDataSource implements ProductDatasourceInterface {
  var reference = FirebaseFirestore.instance.collection('products');

  @override
  Future<bool> updateProduct({required ProductEntity product}) async {
    try {
      product as ProductModel;
      await reference.doc(product.id).update(product.toMap());
      return true;
    } catch (e) {
      throw ErrorUpdateProduct(message: e.toString());
    }
  }
}
