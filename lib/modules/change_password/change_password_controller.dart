import '../../export.dart';

class ChangePasswordController extends GetxController {

  final APIRepository _repository = Get.find<APIRepository>();
  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController oldPasswordTextController = TextEditingController();
  FocusNode oldPasswordFocusNode = FocusNode();

  RxBool viewPassword = true.obs;

  RxBool viewConfirmPassword = true.obs;

  RxBool viewOldPassword = true.obs;

  RxBool isPasswordLoading = false.obs;







  changePasswordApi() {

    if(passwordTextController.text.trim()!=confirmPasswordTextController.text.trim()){
      showToast(message: keyPasswordAndConfirmPasswordDoesNotMatch.tr);
      return;
    }
    isPasswordLoading.value = true;
    Map<String, dynamic> requestModel = {
      "password": oldPasswordTextController.text.trim(),
       "newPassword":passwordTextController.text.trim(),
    };
    _repository.changePasswordApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        isPasswordLoading.value = false;
          showToast(message: value.message.toString());
      }
    }).onError((error, stackTrace) {
      isPasswordLoading.value = false;
      showToast(message: error.toString());
    });
  }
}