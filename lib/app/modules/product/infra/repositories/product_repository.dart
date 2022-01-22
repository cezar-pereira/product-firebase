import 'package:dartz/dartz.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/product/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/product/infra/datasources/produtc_datasource.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface dataSource;

  ProductRepository({required this.dataSource});

  @override
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product}) async {
    try {
      var result = await dataSource.updateProduct(product: product);
      return Right(result);
    } catch (e) {
      return Left(ErrorUpdateProduct(message: 'Erro ao atualizar produto $e'));
    }
  }
}
