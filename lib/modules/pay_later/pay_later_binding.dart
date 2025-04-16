import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pay_later/pay_later_controller.dart';

class PayLaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayLaterController>(
          () => PayLaterController(),
    );
  }
}
