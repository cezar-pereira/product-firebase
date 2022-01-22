import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';

abstract class ProductRepositoryInterface {
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product});
}
