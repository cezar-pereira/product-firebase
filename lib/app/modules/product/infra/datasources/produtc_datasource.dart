import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';

abstract class ProductDatasourceInterface {
  Future<bool> updateProduct({required ProductEntity product});
}
