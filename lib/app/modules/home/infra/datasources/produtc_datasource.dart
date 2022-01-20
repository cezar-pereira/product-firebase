import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductEntity>> fetchProducts();
  Future<String> fetchUrlImageProduct({required String fileName});
  Future<bool> removeProduct({required String id});
}
