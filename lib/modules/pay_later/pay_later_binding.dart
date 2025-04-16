import 'package:impact_zone/export.dart';

class PayLaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayLaterController>(
          () => PayLaterController(),
    );
  }
}
