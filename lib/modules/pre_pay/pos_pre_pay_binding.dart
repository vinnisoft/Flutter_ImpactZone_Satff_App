import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pre_pay/pos_pre_pay_controller.dart';

class PosPrePayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosPrePayController>(
          () => PosPrePayController(),
    );
  }
}