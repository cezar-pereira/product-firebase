import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:products_firebase/app/modules/home/domain/usecases/fetch_products_usecase.dart';

class HomeController extends GetxController {
  HomeController({required this.fetchProductUseCase});
  final FetchProductsUsecaseInterface fetchProductUseCase;
  var isLoading = true.obs;
  var isError = "".obs;
  var productList = <ProductEntity>[].obs;

  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    isLoading(true);
    var result = await fetchProductUseCase();
    result.fold((l) {
      isError.value = l.message;
    }, (r) {
      productList.value = r;
    });
    isLoading(false);
  }
}
