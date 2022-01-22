import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/product/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/product/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/product/domain/usecases/update_product_usecase.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final UpdateProductUsecaseInterface useCase;
  late final ProductEntity product;

  setUpAll(() {
    product = ProductEntity(title: '', type: '', price: 0);
    repository = ProductRepositoryMock();
    useCase = UpdateProductUsecase(repository: repository);
  });

  test('Should return TRUE', () async {
    when(() => repository.updateProduct(product: product))
        .thenAnswer((_) async => const Right(true));
    var result = await useCase(product: product);
    expect(result, const Right(true));
    verify(() => repository.updateProduct(product: product)).called(1);
  });
  test('Should return ErrorUpdateProduct', () async {
    var error = ErrorUpdateProduct(message: 'error');
    when(() => repository.updateProduct(product: product))
        .thenAnswer((_) async => Left(error));
    var result = await useCase(product: product);
    expect(result, Left(error));
    verify(() => repository.updateProduct(product: product)).called(1);
  });
}
