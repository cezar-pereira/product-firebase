import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/product/domain/repositories/product_repository.dart';

abstract class UpdateProductUsecaseInterface {
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductEntity product});
}

class UpdateProductUsecase implements UpdateProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  UpdateProductUsecase({required this.repository});

  @override
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductEntity product}) {
    return repository.updateProduct(product: product);
  }
}
