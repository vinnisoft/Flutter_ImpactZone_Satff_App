import 'package:impact_zone/export.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
          () => NotificationController(),
    );
  }
}
