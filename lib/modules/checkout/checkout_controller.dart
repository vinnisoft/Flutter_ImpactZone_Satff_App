import 'package:impact_zone/export.dart';


class CheckOutController extends GetxController{


List<Map<dynamic,String>> checkOutTypeList=[
  {
   "icon": AppImages.iconsCashIcon,
    "title":keyCash.tr
  },
  {
    "icon": AppImages.iconsCheckIcon,
    "title":keyCheck.tr
  },
  {
    "icon": AppImages.iconsCardOnFileIcon,
    "title":keyCardOnFile.tr
  },
  {
    "icon": AppImages.iconsPrePayIcon,
    "title":keyPrePay.tr
  },
  {
    "icon": AppImages.iconsCreditCardIcon,
    "title":keyCreditCard.tr
  },
  {
    "icon": AppImages.iconsRewardIcon,
    "title":keyReward.tr
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