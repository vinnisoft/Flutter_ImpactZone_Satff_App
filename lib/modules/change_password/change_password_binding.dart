import 'package:impact_zone/export.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
          () => ChangePasswordController(),
    );
  }
}