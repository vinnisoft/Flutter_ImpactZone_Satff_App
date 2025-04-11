import 'package:impact_zone/export.dart';

class SplashController extends GetxController {
  Timer? timer;

  final LocalStorage _localStorage = Get.find<LocalStorage>();


  RxString currentImage = AppImages.imagesSplashLogo.obs;

  @override
  void onInit() {
    _navigateToNextScreen();
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // getToken() async {
  //   final fcmToken = await FirebaseMessaging.instance.getToken();
  //   if (fcmToken != null) {
  //     debugPrint('token -----> $fcmToken');
  //
  //     _localStorage.saveFirebaseToken(fcmToken);
  //   }
  // }

  //*===================================================================== Check App validity ==========================================================*
  void _navigateToNextScreen() =>
      timer = Timer(const Duration(seconds: 3, milliseconds: 500), () async {
        if(!_localStorage.getFirstLaunchStatus()){
          Get.offAllNamed(AppRoutes.routeOnBoarding);
        }else  if(_localStorage.getAuthToken() != null && _localStorage.getAuthToken() != ""){
            Get.offAllNamed(AppRoutes.routeDashboard);
        }else{
          Get.offAllNamed(AppRoutes.routeLogin);
        }
        // getToken();
      });
}
