import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/checkout/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(
          () => CheckOutController(),
    );
  }
}