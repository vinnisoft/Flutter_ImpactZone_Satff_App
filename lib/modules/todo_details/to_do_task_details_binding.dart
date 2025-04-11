import 'package:impact_zone/export.dart';

import 'todo_task_details_controller.dart';

class ToDoTaskDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoTaskDetailsController>(
          () => TodoTaskDetailsController(),
    );
  }
}
