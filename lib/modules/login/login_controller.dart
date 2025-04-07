import 'package:impact_zone/export.dart';

class LoginController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  RxBool viewPassword = true.obs;

  RxBool loginLoading = false.obs;

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;


  loginApi() {
    loginLoading.value = true;
    Map<String, dynamic> requestModel = RequestModel.loginRequestModel(
      email: emailTextController.text.trim(),
      password: passwordTextController.text.trim(),
      // deviceToken: _localStorage.getFirebaseToken(),
    );
    _repository.loginApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        loginLoading.value = false;
        loginResponseModel.value = value;
          Get.offAllNamed(AppRoutes.routeDashboard);
          saveDataToLocalStorage();
          showToast(message: loginResponseModel.value.message ?? "");
      }
    }).onError((error, stackTrace) {
      loginLoading.value = false;
      showToast(message: error.toString());
    });
  }

  saveDataToLocalStorage() {
    _localStorage.saveRegisterData(loginResponseModel.value.data);
    _localStorage.saveAuthToken(loginResponseModel.value.data?.token ?? '');
  }

}
