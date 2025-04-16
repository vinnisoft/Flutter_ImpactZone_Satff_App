
import 'package:impact_zone/export.dart';

class PosController extends GetxController{
  List<Map<String, String>> iconItems = [
    {
      'icon': AppImages.iconsService,
      'title': keyServices.tr,
    },
    // {
    //   'icon': AppImages.iconsAgreements,
    //   'title': keyAgreements.tr,
    // },
    {
      'icon': AppImages.iconsProduct,
      'title':  keyProducts.tr,
    },
  ];
  RxInt selectedTab = 0.obs;
  RxInt categoryIndex=0.obs;
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

  tapOnCategory(int index){
    categoryIndex.value=index;
  }
}