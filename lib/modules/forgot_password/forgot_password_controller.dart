import 'package:impact_zone/export.dart';

class ForgotPasswordController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  RxBool isOtpRequested = false.obs;

  Rx<MessageResponseModel> messageResponseModel = MessageResponseModel().obs;

  requestOTPApi() {
    isOtpRequested.value = true;
    Map<String, dynamic> requestModel = RequestModel.requestOtpRequestModel(
      email: emailTextController.text.trim(),
    );
    _repository.forgotPasswordApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        isOtpRequested.value = false;
        messageResponseModel.value = value;
        Get.offAllNamed(AppRoutes.routeOtpVerification, arguments: {
          'email' : emailTextController.text.trim()
        });
        showToast(message: messageResponseModel.value.message.toString());
      }
    }).onError((error, stackTrace) {
      isOtpRequested.value = false;
      showToast(message: error.toString());
    });
  }

}
