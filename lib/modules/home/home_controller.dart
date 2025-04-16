import 'package:impact_zone/export.dart';




class HomeController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  RxBool isAppointmentLoading = false.obs;
  RxBool isTaskLoading = false.obs;

  Rx<MyAppointmentListResponseModel> myAppointmentListResponse = MyAppointmentListResponseModel().obs;
  RxList<MyAppointmentDataModel> myAppointmentList = <MyAppointmentDataModel>[].obs;
  Rx<EmployeeTaskResponseModel> myTodoListResponse = EmployeeTaskResponseModel().obs;
  RxList<EmployeeTaskModel> myTodoList = <EmployeeTaskModel>[].obs;



  @override
  void onInit() {
    appointmentsListApi();
    todoListApi();
    super.onInit();
  }


  appointmentsListApi() {
    isAppointmentLoading.value = true;
    _repository.appointmentsApiCall().then((value) async {
      if (value != null) {
        isAppointmentLoading.value = false;
        myAppointmentListResponse.value = value;
        if(myAppointmentListResponse.value.data != null){
          myAppointmentList.value = myAppointmentListResponse.value.data ?? [];
        }

      }
    }).onError((error, stackTrace) {
      isAppointmentLoading.value = false;
      showToast(message: error.toString());
    });
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
      update();
    }).onError((error, stackTrace) {
      isTaskLoading.value = false;
      showToast(message: error.toString());
    });
  }



}
