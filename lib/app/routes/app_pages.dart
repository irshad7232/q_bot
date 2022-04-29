import 'package:get/get.dart';

import '../modules/bot/bindings/bot_binding.dart';
import '../modules/bot/views/bot_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOT,
      page: () => BotView(),
      binding: BotBinding(),
    ),
  ];
}
