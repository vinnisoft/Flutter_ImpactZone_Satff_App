import 'package:get/get.dart';

class PayLaterController extends GetxController{
  RxInt selectedIndex=0.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void selectPaymentMethod(int index){
    selectedIndex.value=index;
  }
}