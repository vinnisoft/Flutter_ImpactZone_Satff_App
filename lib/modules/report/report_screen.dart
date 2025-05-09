import 'package:impact_zone/export.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyReports.tr,actionWidget: [
        AssetImageWidget(AppImages.iconsNotification,
        imageHeight: 20.h,
        ),
      ],),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              children: controller.checkOutTypeList.map((option) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                       if(option['title'] == keyTimeSheet.tr) {
                         Get.toNamed(AppRoutes.routeTimeSheetScreen);
                         return;
                       }
                      },
                      child: Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          border: Border.all(
                            color: AppColors.containerBorderGreyColor,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: AssetImageWidget(
                            option['icon'].toString(),
                            imageHeight: 40.h,
                            imageWidth: 40.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      option['title'].toString(),
                      style:textStyleHeadlineMedium().copyWith(fontSize: 14.sp),
                    )
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
