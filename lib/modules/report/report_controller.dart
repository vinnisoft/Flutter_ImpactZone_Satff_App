import 'package:impact_zone/export.dart';
class ReportController extends GetxController{


  List<Map<dynamic,String>> checkOutTypeList=[
    {
      "icon": AppImages.iconsTimeSheetIcon,
      "title":keyTimeSheet.tr
    },
    {
      "icon": AppImages.iconsCommissionIcon,
      "title":keyCommission.tr
    },
    {
      "icon": AppImages.iconsSalesReportIcon,
      "title":keyDailySalesReport.tr
    },
    {
      "icon": AppImages.iconsTransactionReportIcon,
      "title":keyTransactionsReport.tr
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