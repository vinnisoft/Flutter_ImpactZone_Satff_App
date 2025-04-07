import 'package:impact_zone/export.dart';

class OnBoardingBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
  }
}
