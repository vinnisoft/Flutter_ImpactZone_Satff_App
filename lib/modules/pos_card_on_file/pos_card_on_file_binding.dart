import 'package:impact_zone/export.dart';

class PosCardOnFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosCardOnFileController>(
          () => PosCardOnFileController(),
    );
  }
}