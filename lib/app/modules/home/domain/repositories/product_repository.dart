import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';

abstract class ProductRepositoryInterface {
  Future<Either<FailureProductInterface, List<ProductEntity>>> fetchProducts();
  Future<Either<FailureProductInterface, String>> fetchUrlImageProduct(
      {required String fileName});
}
