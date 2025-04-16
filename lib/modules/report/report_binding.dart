import 'package:impact_zone/export.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(
          () => ReportController(),
    );
  }
}
