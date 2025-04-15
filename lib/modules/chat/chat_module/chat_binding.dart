import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/chat/chat_module/chat_controller.dart';
import 'package:impact_zone/modules/checkout/checkout_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
          () => ChatController(),
    );
  }
}