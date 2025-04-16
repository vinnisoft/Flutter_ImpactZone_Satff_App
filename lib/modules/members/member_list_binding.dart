import 'package:impact_zone/export.dart';

class MemberListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembersController>(
          () => MembersController(),
    );
  }
}
