import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';

class ProductFirebaseDataSource implements ProductDatasourceInterface {
  var reference = FirebaseFirestore.instance.collection('products');
  @override
  Future<List<ProductEntity>> fetchProducts() async {
    var snap = await reference.get();
    return snap.docs.map((doc) {
      var data = doc.data();
      String id = doc.id;
      data['id'] = id;
      return ProductModel.fromMap(map: data);
    }).toList();
  }
}
