import 'package:impact_zone/export.dart';

class PosCardOnFileController extends GetxController{


  RxInt selectedIndex=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void selectPaymentMethod(int index){
    selectedIndex.value=index;
  }
}