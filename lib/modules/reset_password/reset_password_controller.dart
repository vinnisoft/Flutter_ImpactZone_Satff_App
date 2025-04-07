import 'package:impact_zone/export.dart';

class ResetPasswordController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  RxBool viewPassword = true.obs;

  RxBool viewConfirmPassword = true.obs;

  RxBool resetPasswordLoading = false.obs;

  RxString email = ''.obs;
  RxString otp = ''.obs;

  Rx<MessageResponseModel> messageResponseModel = MessageResponseModel().obs;

  @override
  void onInit() {
    if(Get.arguments != null){
      email.value = Get.arguments['email'];
      otp.value = Get.arguments['otp'];
    }
    super.onInit();
  }

  resetPasswordApi() {
    resetPasswordLoading.value = true;
    Map<String, dynamic> requestModel = RequestModel.resetPasswordRequestModel(
        email: email.value,
        password: passwordTextController.text.trim(),
      otp: otp.value,
    );
    _repository.resetPasswordApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        resetPasswordLoading.value = false;
        messageResponseModel.value = value;
        Get.to(()=> PasswordResetSuccessful());
      }
    }).onError((error, stackTrace) {
      resetPasswordLoading.value = false;
      showToast(message: error.toString());
    });
  }


}
