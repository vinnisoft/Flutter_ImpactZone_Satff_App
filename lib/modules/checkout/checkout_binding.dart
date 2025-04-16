import 'package:impact_zone/export.dart';


class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(
          () => CheckOutController(),
    );
  }
}