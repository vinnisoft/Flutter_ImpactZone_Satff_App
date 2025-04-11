import 'package:impact_zone/export.dart';

class MyAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppointmentsController>(
          () => MyAppointmentsController(),
    );
  }
}
