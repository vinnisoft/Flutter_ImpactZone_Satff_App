import 'package:impact_zone/export.dart';

class MyAppointmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppointmentDetailController>(
          () => MyAppointmentDetailController(),
    );
  }
}
