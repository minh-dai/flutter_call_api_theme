import 'package:baseproject/features/home/binding/home_binding.dart';
import 'package:baseproject/features/home/home_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const init = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
