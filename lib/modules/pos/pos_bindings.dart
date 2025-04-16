import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos/pos_controller.dart';

class PosBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosController>(
          () => PosController(),
    );
  }
}