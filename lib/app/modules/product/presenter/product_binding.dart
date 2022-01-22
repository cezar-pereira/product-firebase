import 'package:get/get.dart';
import 'package:products_firebase/app/modules/product/domain/usecases/update_product_usecase.dart';
import 'package:products_firebase/app/modules/product/external/datasources/product_firebase_datasource.dart';
import 'package:products_firebase/app/modules/product/infra/repositories/product_repository.dart';

import 'package:products_firebase/app/modules/product/presenter/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    /* CONTROLLERS */
    Get.lazyPut(() => ProductController(
        updateProductUseCase: UpdateProductUsecase(
            repository:
                ProductRepository(dataSource: ProductFirebaseDataSource()))));

    // /* DATASOURCES */
    // Get.lazyPut<ProductDatasourceInterface>(() => ProductFirebaseDataSource());

    // /* REPOSITORIES */
    // Get.lazyPut<ProductRepositoryInterface>(() =>
    //     ProductRepository(dataSource: Get.find<ProductDatasourceInterface>()));

    // /* USECASES */
    // Get.lazyPut<UpdateProductUsecaseInterface>(() => UpdateProductUsecase(
    //     repository: Get.find<ProductRepositoryInterface>()));
  }
}
