import 'package:impact_zone/export.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
          () => ChatController(),
    );
  }
}