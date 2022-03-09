import 'package:baseproject/core/api_handler/api-handler.dart';
import 'package:baseproject/core/api_handler/api-repo.dart';
import 'package:baseproject/core/theme/theme_service.dart';
import 'package:baseproject/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  runApp(
    GetMaterialApp(
      title: "Flutter demo",
      initialRoute: AppPages.init,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    ),
  );
}

