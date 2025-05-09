import 'package:impact_zone/export.dart';

class ViewEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewEventController>(
          () => ViewEventController(),
    );
  }
}
