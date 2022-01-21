import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/remove_product_usecase.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final RemoveProductUsecaseInterface useCase;
  late final ProductEntity product;

  setUpAll(() {
    product = ProductEntity(title: '', type: '', price: 0);
    repository = ProductRepositoryMock();
    useCase = RemoveProductUsecase(repository: repository);
  });

  test('Should return TRUE when remove product', () async {
    var status = true;
    when(() => repository.removeProduct(product: product))
        .thenAnswer((_) async => Right(status));
    var result = await useCase.call(product: product);
    expect(result, Right(status));
    verify(() => repository.removeProduct(product: product)).called(1);
  });

  test('Should return ERROR when remove employee', () async {
    var error = ErrorRemoveProduct(message: 'Error');
    when(() => repository.removeProduct(product: product))
        .thenAnswer((_) async => Left(error));
    var result = await useCase.call(product: product);
    expect(result, Left(error));
    verify(() => repository.removeProduct(product: product)).called(1);
  });
}
