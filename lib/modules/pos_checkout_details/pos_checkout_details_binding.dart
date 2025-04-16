import 'package:impact_zone/export.dart';

class PosCheckoutDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosCheckOutDetailsController>(
          () => PosCheckOutDetailsController(),
    );
  }
}