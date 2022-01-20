import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  setUpAll(() {
    repository = ProductRepositoryMock();
  });

  group('fetchProducts:', () {
    test('Should return a List<ProductEntity>', () async {
      List<ProductEntity> list = [];
      when(() => repository.fetchProducts())
          .thenAnswer((_) async => Right(list));
      var result = await repository.fetchProducts();
      expect(result, Right(list));
      verify(() => repository.fetchProducts()).called(1);
    });
    test('Should return a ErrorFetchProducts', () async {
      FailureProductInterface error = ErrorFetchProducts(message: '');
      when(() => repository.fetchProducts())
          .thenAnswer((_) async => Left(error));
      var result = await repository.fetchProducts();
      expect(result, Left(error));
      verify(() => repository.fetchProducts()).called(1);
    });
  });

  group('fetchUrlImageProduct:', () {
    test('Should return a urlImage', () async {
      String urlImage = '';
      when(() => repository.fetchUrlImageProduct(fileName: ''))
          .thenAnswer((_) async => Right(urlImage));
      var result = await repository.fetchUrlImageProduct(fileName: '');
      expect(result, Right(urlImage));
      verify(() => repository.fetchUrlImageProduct(fileName: '')).called(1);
    });
    test('Should return a ErrorFetchImageProduct', () async {
      FailureProductInterface error = ErrorFetchImageProduct(message: '');
      when(() => repository.fetchUrlImageProduct(fileName: ''))
          .thenAnswer((_) async => Left(error));
      var result = await repository.fetchUrlImageProduct(fileName: '');
      expect(result, Left(error));
      verify(() => repository.fetchUrlImageProduct(fileName: '')).called(1);
    });
  });

  group('removeProduct:', () {
    test('Should return true', () async {
      when(() => repository.removeProduct(id: ''))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.removeProduct(id: '');
      expect(result, const Right(true));
      verify(() => repository.removeProduct(id: '')).called(1);
    });
    test('Should return a ErrorRemoveProduct', () async {
      FailureProductInterface error = ErrorRemoveProduct(message: '');
      when(() => repository.removeProduct(id: ''))
          .thenAnswer((_) async => Left(error));
      var result = await repository.removeProduct(id: '');
      expect(result, Left(error));
      verify(() => repository.removeProduct(id: '')).called(1);
    });
  });
}
