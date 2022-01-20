import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/domain/repositories/product_repository.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/fetch_image_product_usecase.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/remove_product_usecase.dart';
import 'package:products_firebase/app/modules/home/external/datasources/product_firebase_datasource.dart';
import 'package:products_firebase/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:products_firebase/app/modules/home/infra/repositories/product_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    /* CONTROLLERS */
    Get.lazyPut<HomeController>(() {
      return HomeController(
          fetchProductUseCase: Get.find<FetchProductsUsecaseInterface>(),
          removeProductUsecase: Get.find<RemoveProductUsecaseInterface>());
    });

    /* DATASOURCES */
    Get.lazyPut<ProductDatasourceInterface>(() => ProductFirebaseDataSource());

    /* REPOSITORIES */
    Get.lazyPut<ProductRepositoryInterface>(() =>
        ProductRrepository(dataSource: Get.find<ProductDatasourceInterface>()));

    /* USECASES */
    Get.lazyPut<FetchProductsUsecaseInterface>(() => FetchProductsUsecase(
        repository: Get.find<ProductRepositoryInterface>()));
    Get.lazyPut<FetchImageProductUsecaseInterface>(() =>
        FetchImageProductUsecase(
            repository: Get.find<ProductRepositoryInterface>()));
    Get.lazyPut<RemoveProductUsecaseInterface>(() => RemoveProductUsecase(
        repository: Get.find<ProductRepositoryInterface>()));
  }
}
