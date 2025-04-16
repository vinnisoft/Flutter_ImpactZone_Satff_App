import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/chat/chat_list_screen.dart';

class DashboardController extends GetxController {

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<LoginDataModel> userData = LoginDataModel().obs;


  RxList<Widget> screens = <Widget>[
    HomeScreen(),
    Container(),
    ChatListScreen(),
    Container(),
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
