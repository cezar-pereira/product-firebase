import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/product/infra/datasources/produtc_datasource.dart';

class ProductHiveDataSourceMock extends Mock
    implements ProductDatasourceInterface {}

void main() {
  late final ProductDatasourceInterface dataSource;
  late final ProductEntity product;
  setUpAll(() {
    product = ProductEntity(title: '', type: '', price: 0);
    dataSource = ProductHiveDataSourceMock();
  });
  test('Should return TRUE when call updateProduct', () async {
    when(() => dataSource.updateProduct(product: product))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.updateProduct(product: product);
    expect(result, true);
  });
}
