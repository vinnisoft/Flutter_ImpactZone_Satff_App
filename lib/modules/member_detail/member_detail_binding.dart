import 'package:impact_zone/export.dart';

class MemberDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberDetailController>(
          () => MemberDetailController(),
    );
  }
}
