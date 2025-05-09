import 'package:impact_zone/export.dart';

class TimeSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeSheetController>(
          () => TimeSheetController(),
    );
  }
}
