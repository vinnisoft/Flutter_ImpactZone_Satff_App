import 'package:impact_zone/export.dart';

class HomeController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  RxBool isAppointmentLoading = false.obs;

  Rx<MyAppointmentListResponseModel> myAppointmentListResponse = MyAppointmentListResponseModel().obs;
  RxList<MyAppointmentDataModel> myAppointmentList = <MyAppointmentDataModel>[].obs;



  @override
  void onInit() {
    appointmentsListApi();
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



}
