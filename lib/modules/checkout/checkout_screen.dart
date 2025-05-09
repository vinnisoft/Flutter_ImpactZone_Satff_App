import 'package:impact_zone/export.dart';


class CheckoutScreen extends GetView<CheckOutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyCheckout.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child:  GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: controller.checkOutTypeList.map((option) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        if(option['title']==keyCardOnFile.tr){
                          Get.toNamed(AppRoutes.routePosCardOnFileScreen);
                          return;
                        }
                        if(option['title']==keyPrePay.tr){
                          Get.toNamed(AppRoutes.routePrePayScreen);
                          return;
                        }
                        Get.toNamed(AppRoutes.routePosCheckoutDetailsScreen,
                            arguments: {
                              "title":option["title"]
                            }
                        );
                      },
                      child: Container(
                        height: 120.h,
                        width: 120.w,
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
                      style: textStyleHeadlineSmall().copyWith(fontSize: 12.sp)
                    )
                  ],
                );
              }).toList(),
            ),
          ),

            Column(
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.routePayLaterScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(30),
                  height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.containerGreyColor)
                    ),
                    child: AssetImageWidget(AppImages.iconsPayLaterIcon,
                      imageHeight: 40.h,
                      imageWidth: 40.w,),
                  ).paddingSymmetric(horizontal: 40,vertical: 5.h),
                ),
                Text(
                 keyPayLater.tr,
                  style:textStyleHeadlineSmall().copyWith(fontSize: 12.sp)
                )
              ],
            ).paddingOnly(bottom: 20.h)
        
          ],
        ),
      ),
    );
  }
}
