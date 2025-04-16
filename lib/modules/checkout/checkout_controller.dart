import 'package:get/get.dart';
import 'package:impact_zone/app_values/app_images.dart';

class CheckOutController extends GetxController{


List<Map<dynamic,String>> checkOutTypeList=[
  {
   "icon": AppImages.iconsCashIcon,
    "title":"Cash"
  },
  {
    "icon": AppImages.iconsCheckIcon,
    "title":"Check"
  },
  {
    "icon": AppImages.iconsCardOnFileIcon,
    "title":"Card on File"
  },
  {
    "icon": AppImages.iconsPrePayIcon,
    "title":"Pre-Pay"
  },
  {
    "icon": AppImages.iconsCreditCardIcon,
    "title":"Credit Card"
  },
  {
    "icon": AppImages.iconsRewardIcon,
    "title":"Reward"
  },
];
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
}