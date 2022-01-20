import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';

abstract class FetchImageProductUsecaseInterface {
  Future<Either<FailureProductInterface, String>> call(
      {required String fileName});
}

class FetchImageProductUsecase implements FetchImageProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  FetchImageProductUsecase({required this.repository});

  @override
  Future<Either<FailureProductInterface, String>> call(
      {required String fileName}) async {
    return await repository.fetchUrlImageProduct(fileName: fileName);
  }
}
