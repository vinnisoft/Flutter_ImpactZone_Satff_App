import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/notification/notification_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
          () => NotificationController(),
    );
  }
}
