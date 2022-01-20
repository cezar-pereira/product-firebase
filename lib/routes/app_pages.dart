// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/presenter/home_binding.dart';
import 'package:products_firebase/app/modules/home/presenter/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.HOME, page: () => const HomePage(), binding: HomeBinding())
  ];
}
