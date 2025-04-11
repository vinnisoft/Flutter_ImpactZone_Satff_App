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
    Get.lazyPut<CalendarController>(
          () => CalendarController(),
    );
    Get.lazyPut<ChatListController>(
          () => ChatListController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
