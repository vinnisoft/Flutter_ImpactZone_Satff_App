import 'package:impact_zone/export.dart';

class PosPrePayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosPrePayController>(
          () => PosPrePayController(),
    );
  }
}