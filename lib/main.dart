import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/presenter/home_binding.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    title: 'Produt Firebase',
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
    initialBinding: HomeBinding(),
  ));
}
