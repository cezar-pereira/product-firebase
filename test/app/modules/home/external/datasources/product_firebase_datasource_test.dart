import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/errors/errors_product.dart';
import 'package:products_firebase/app/modules/home/infra/datasources/produtc_datasource.dart';

class ProductFirebaseDataSourceMock extends Mock
    implements ProductDatasourceInterface {}

void main() {
  ProductDatasourceInterface dataSource = ProductFirebaseDataSourceMock();
  group('fetchProducts:', () {
    test('Should return a List<ProductEntity>', () async {
      List<ProductEntity> list = [];
      when(() => dataSource.fetchProducts()).thenAnswer((_) async => list);
      var result = await dataSource.fetchProducts();
      expect(result, list);
      verify(() => dataSource.fetchProducts()).called(1);
    });
    test('Should return a ErrorFetchProducts', () async {
      FailureProductInterface error = ErrorFetchProducts(message: '');
      when(() => dataSource.fetchProducts()).thenThrow(error);
      expect(
          () => dataSource.fetchProducts(), throwsA(isA<ErrorFetchProducts>()));
      verify(() => dataSource.fetchProducts()).called(1);
    });
  });

  group('fetchUrlImageProduct:', () {
    test('Should return a urlImage', () async {
      String urlImage = '';
      when(() => dataSource.fetchUrlImageProduct(fileName: ''))
          .thenAnswer((_) async => urlImage);
      var result = await dataSource.fetchUrlImageProduct(fileName: '');
      expect(result, urlImage);
      verify(() => dataSource.fetchUrlImageProduct(fileName: '')).called(1);
    });
    test('Should return a ErrorFetchImageProduct', () async {
      FailureProductInterface error = ErrorFetchImageProduct(message: '');
      when(() => dataSource.fetchUrlImageProduct(fileName: ''))
          .thenThrow(error);
      expect(() => dataSource.fetchUrlImageProduct(fileName: ''),
          throwsA(isA<ErrorFetchImageProduct>()));
      verify(() => dataSource.fetchUrlImageProduct(fileName: '')).called(1);
    });
  });

  group('removeProduct:', () {
    test('Should return true', () async {
      when(() => dataSource.removeProduct(id: ''))
          .thenAnswer((_) async => true);
      var result = await dataSource.removeProduct(id: '');
      expect(result, true);
      verify(() => dataSource.removeProduct(id: '')).called(1);
    });
    test('Should return a ErrorRemoveProduct', () async {
      FailureProductInterface error = ErrorRemoveProduct(message: '');
      when(() => dataSource.removeProduct(id: '')).thenThrow(error);
      expect(() => dataSource.removeProduct(id: ''),
          throwsA(isA<ErrorRemoveProduct>()));
      verify(() => dataSource.removeProduct(id: '')).called(1);
    });
  });
}
