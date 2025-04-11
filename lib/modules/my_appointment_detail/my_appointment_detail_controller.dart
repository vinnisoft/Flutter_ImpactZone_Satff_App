import 'package:impact_zone/export.dart';

class MyAppointmentDetailController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  RxBool isAppointmentLoading = false.obs;
  RxString appointmentId = ''.obs;

  Rx<MyAppointmentDetailResponseModel> appointmentDetailResponse = MyAppointmentDetailResponseModel().obs;
  Rx<MyAppointmentDetailDataModel> appointmentData = MyAppointmentDetailDataModel().obs;



  @override
  void onInit() {
    if(Get.arguments!= null){
      appointmentId.value = Get.arguments['appointment_id'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    appointmentDetailApi();
    super.onReady();
  }


  appointmentDetailApi() {
    isAppointmentLoading.value = true;
    _repository.appointmentDetailApiCall(id: appointmentId.value).then((value) async {
      if (value != null) {
        isAppointmentLoading.value = false;
        appointmentDetailResponse.value = value;
        if(appointmentDetailResponse.value.data!= null){
          appointmentData.value = appointmentDetailResponse.value.data!;
        }
      }
    }).onError((error, stackTrace) {
      isAppointmentLoading.value = false;
      showToast(message: error.toString());
    });
  }

}