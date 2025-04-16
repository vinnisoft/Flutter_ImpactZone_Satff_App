import 'package:impact_zone/export.dart';

class ToDoTaskDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoTaskDetailsController>(
          () => TodoTaskDetailsController(),
    );
  }
}
