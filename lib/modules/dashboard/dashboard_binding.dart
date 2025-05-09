import 'package:impact_zone/export.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<CalendarController2>(
          () => CalendarController2(),
    );
    Get.lazyPut<ChatListController>(
          () => ChatListController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
