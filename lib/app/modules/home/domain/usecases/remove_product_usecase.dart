import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';

abstract class RemoveProductUsecaseInterface {
  Future<Either<FailureProductInterface, bool>> call(
      {required ProductEntity product});
}

class RemoveProductUsecase implements RemoveProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  RemoveProductUsecase({required this.repository});

  @override
  Future<Either<FailureProductInterface, bool>> call(
      {required ProductEntity product}) {
    return repository.removeProduct(product: product);
  }
}
