import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/home/infra/datasources/produtc_datasource.dart';

class ProductRrepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface dataSource;

  ProductRrepository({required this.dataSource});

  @override
  Future<Either<FailureProductInterface, List<ProductEntity>>>
      fetchProducts() async {
    try {
      var result = await dataSource.fetchProducts();
      return Right(result);
    } catch (e) {
      return Left(ErrorFetchProducts(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureProductInterface, String>> fetchUrlImageProduct(
      {required String fileName}) async {
    try {
      var result = await dataSource.fetchUrlImageProduct(fileName: fileName);
      return Right(result);
    } catch (e) {
      return Left(ErrorFetchImageProduct(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureProductInterface, bool>> removeProduct(
      {required ProductEntity product}) async {
    try {
      var result = await dataSource.removeProduct(product: product);
      return Right(result);
    } catch (e) {
      return Left(ErrorRemoveProduct(message: e.toString()));
    }
  }
}
