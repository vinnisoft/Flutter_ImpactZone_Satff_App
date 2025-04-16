import 'package:impact_zone/export.dart';

class PosBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosController>(
          () => PosController(),
    );
  }
}