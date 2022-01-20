import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:products_firebase/app/modules/home/infra/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProductFirebaseDataSource implements ProductDatasourceInterface {
  var reference = FirebaseFirestore.instance.collection('products');
  var storage = firebase_storage.FirebaseStorage.instance;
  static DocumentSnapshot? _lastDocument;

  @override
  Future<List<ProductEntity>> fetchProducts(
      {DocumentSnapshot? lasDoc, int pageSize = 8}) async {
    List<ProductEntity> list = [];
    Query _query = reference.orderBy('createdAt');

    if (_lastDocument != null) {
      _query = _query.startAfterDocument(_lastDocument!).limit(pageSize);
    } else {
      _query = _query.limit(pageSize);
    }

    var snap = await _query.get();
    if (snap.docs.isNotEmpty) {
      _lastDocument = snap.docs.last;
    } else {
      _lastDocument = null;
    }
    snap as QuerySnapshot<Map<String, dynamic>>;

    list = await Future.wait(snap.docs.map((doc) async {
      var data = doc.data();
      data['id'] = doc.id;
      data['urlImg'] = await fetchUrlImageProduct(fileName: data['filename']);
      return ProductModel.fromMap(map: data);
    }));
    return list;
  }

  @override
  Future<String> fetchUrlImageProduct({required String fileName}) async {
    return await storage.ref(fileName).getDownloadURL();
  }
}
