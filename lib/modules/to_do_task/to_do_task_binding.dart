import 'package:impact_zone/export.dart';

class ToDoTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoTaskController>(
          () => ToDoTaskController(),
    );
  }
}
