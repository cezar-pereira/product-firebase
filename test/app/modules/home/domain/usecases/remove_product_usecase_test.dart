import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/remove_product_usecase.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final RemoveProductUsecaseInterface useCase;

  setUpAll(() {
    repository = ProductRepositoryMock();
    useCase = RemoveProductUsecase(repository: repository);
  });

  test('Should return TRUE when remove product', () async {
    var status = true;
    when(() => repository.removeProduct(id: ''))
        .thenAnswer((_) async => Right(status));
    var result = await useCase.call(id: '');
    expect(result, Right(status));
    verify(() => repository.removeProduct(id: '')).called(1);
  });

  test('Should return ERROR when remove employee', () async {
    var error = ErrorRemoveProduct(message: 'Error');
    when(() => repository.removeProduct(id: ''))
        .thenAnswer((_) async => Left(error));
    var result = await useCase.call(id: '');
    expect(result, Left(error));
    verify(() => repository.removeProduct(id: '')).called(1);
  });
}
