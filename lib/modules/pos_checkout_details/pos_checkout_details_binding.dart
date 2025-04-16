import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos_checkout_details/pos_checkout_details_controller.dart';

class PosCheckoutDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosCheckOutDetailsController>(
          () => PosCheckOutDetailsController(),
    );
  }
}