import 'package:get/get.dart';

import '../../export.dart';
import '../../models/todo_task/todo_task_details_model.dart';
import '../../repository/api_repository.dart';
import '../../utils/custom_toast.dart';

class TodoTaskDetailsController extends GetxController{
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isTodoDetailsLoading=false.obs;
  RxString todoId = ''.obs;
  Rx<TaskDetailResponseModel> myTodoResponse = TaskDetailResponseModel().obs;
  Rx<TaskDetailDataModel> myTodoDetails = TaskDetailDataModel().obs;

  @override
  void onInit() {
    if(Get.arguments!= null){
      todoId.value = Get.arguments['task_id'];
    }

    super.onInit();
  }

  @override
  void onReady() {
    todoListDetailsApi();
    super.onReady();
  }


  todoListDetailsApi() {
    // print(todoId.value);
    // return;
    isTodoDetailsLoading.value = true;
    _repository.todoDetailsApiCall(todoId.value).then((value) async {
      if (value != null) {
        isTodoDetailsLoading.value = false;
        myTodoResponse.value = value;
        if(myTodoResponse.value.data != null){
          myTodoDetails.value = myTodoResponse.value.data??TaskDetailDataModel();
        }
      }
    }).onError((error, stackTrace) {
      isTodoDetailsLoading.value = false;
      showToast(message: error.toString());
    });
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString).toLocal();
    return DateFormat('EEE, dd MMM').format(date);
  }
}