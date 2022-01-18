import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/fetch_products_usecase.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final FetchProductsUsecaseInterface useCase;

  setUpAll(() {
    repository = ProductRepositoryMock();
    useCase = FetchProductsUsecase(repository: repository);
  });
  test('Should return List<ProductEntity>', () async {
    List<ProductEntity> list = [];
    when(() => repository.fetchProducts()).thenAnswer((_) async => Right(list));
    var result = await useCase();
    expect(result, Right(list));
    verify(() => repository.fetchProducts()).called(1);
  });
  test('Should return ErrorFetchProducts', () async {
    var error = ErrorFetchProducts(message: 'error');
    when(() => repository.fetchProducts()).thenAnswer((_) async => Left(error));
    var result = await useCase();
    expect(result, Left(error));
    verify(() => repository.fetchProducts()).called(1);
  });
}
