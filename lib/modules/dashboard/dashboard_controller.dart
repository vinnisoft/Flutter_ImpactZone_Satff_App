import 'package:impact_zone/export.dart';


class DashboardController extends GetxController {

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<LoginDataModel> userData = LoginDataModel().obs;


  RxList<Widget> screens = <Widget>[
    HomeScreen(),
    // CustomCalendarScreen(),
    // CalendarScreen(),
    // MyHomePage(),
    CustomCalendarScreen(),
    ChatListScreen(),
    ProfileScreen(),
  ].obs;

  RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  getUserData() async {
    userData.value = await _localStorage.getSavedLoginData();
  }


}
