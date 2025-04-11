import 'package:impact_zone/export.dart';

class RestPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
  }
}
