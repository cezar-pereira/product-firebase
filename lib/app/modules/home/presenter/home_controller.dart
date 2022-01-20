import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/remove_product_usecase.dart';

class HomeController extends GetxController {
  HomeController(
      {required this.fetchProductUseCase, required this.removeProductUsecase});
  final FetchProductsUsecaseInterface fetchProductUseCase;
  final RemoveProductUsecaseInterface removeProductUsecase;
  var isLoading = true.obs;
  var isFetchMore = false.obs;
  var isError = "".obs;
  var productList = <ProductEntity>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    var result = await fetchProductUseCase();
    result.fold((l) {
      isError.value = l.message;
    }, (r) {
      productList.value = [...productList, ...r];
    });
    isLoading(false);
    isFetchMore(false);
  }

  removeProduct({required ProductEntity product}) async {
    var result = await removeProductUsecase(id: product.id);
    result.fold((l) {
      isError.value = l.message;
    }, (r) {
      productList.remove(product);
    });
  }
}
