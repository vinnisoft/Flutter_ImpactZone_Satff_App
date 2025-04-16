import 'package:impact_zone/export.dart';

class ToDoTaskController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isCompletedTodo=true.obs;

  RxBool isTaskLoading = false.obs;
  Rx<EmployeeTaskResponseModel> myTodoListResponse = EmployeeTaskResponseModel().obs;
  RxList<EmployeeTaskModel> myTodoList = <EmployeeTaskModel>[].obs;

  @override
  void onReady() {
   todoListApi();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void changeTodoHeaderStatus(bool todoHeaderStatus){
    isCompletedTodo.value=todoHeaderStatus;
    todoListApi();
    update();
  }








  todoListApi() {
    isTaskLoading.value = true;
    _repository.todoListApiCall().then((value) async {
      if (value != null) {
        isTaskLoading.value = false;
        myTodoListResponse.value = value;
        if(myTodoListResponse.value.data != null){
          myTodoList.value = myTodoListResponse.value.data ?? [];
        }
      }
    }).onError((error, stackTrace) {
      isTaskLoading.value = false;
      showToast(message: error.toString());
    });
  }




  todoListUpdateApi(String id, String status) {
    Map<String, dynamic> requestModel = <String, dynamic>{};
    requestModel['status']=status;
     isTaskLoading.value = true;
    _repository.todoListUpdateApiCall(id,dataBody: requestModel).then((value) async {
      todoListApi();
      // if (value != null) {
      //   isMembersListApiCall.value = false;
      //   memberListResponse.value = value;
      //   if(memberListResponse.value.data != null){
      //     myMemberList.value = memberListResponse.value.data ?? [];
      //   }
      // }
      // update();
    }).onError((error, stackTrace) {
      isTaskLoading.value = false;
      showToast(message: error.toString());
    });
  }

  updateBookMarkStatus(String id,bool bookmarkStatus){
    Map<String, dynamic> requestModel = <String, dynamic>{};
    requestModel['bookmarkStatus']=bookmarkStatus;
    isTaskLoading.value = true;
    _repository.todoListUpdateApiCall(id,dataBody: requestModel).then((value) async {
      todoListApi();
      // if (value != null) {
      //   isMembersListApiCall.value = false;
      //   memberListResponse.value = value;
      //   if(memberListResponse.value.data != null){
      //     myMemberList.value = memberListResponse.value.data ?? [];
      //   }
      // }
      // update();
    }).onError((error, stackTrace) {
      isTaskLoading.value = false;
      showToast(message: error.toString());
    });
  }
}