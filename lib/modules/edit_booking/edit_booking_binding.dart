import 'package:impact_zone/export.dart';

class EditBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditBookingController>(
          () => EditBookingController(),
    );
  }
}
