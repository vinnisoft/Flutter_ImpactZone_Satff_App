import 'package:impact_zone/export.dart';

import '../members/members_controller.dart';

class MemberListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembersController>(
          () => MembersController(),
    );
  }
}
