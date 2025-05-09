import 'package:impact_zone/export.dart';

class PosPrePayScreen extends GetView<PosPrePayController> {
  const PosPrePayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyPrePay.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: Column(
      children: [
        _details()
      ],
      ),
    );
  }

  _details() {
    return Container(
      padding: EdgeInsets.all(20.h),
      height: Get.height*0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailsContainer(),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 20.h),
          Row(
            children: [
              AssetImageWidget(
                AppImages.iconsProfileImage,
                imageWidth: 35.w,
                imageHeight: 35.h,
              ).paddingOnly(right: 10.w),
              Text(
                "Alex Linderson",

                style: textStyleHeadlineMedium(),
                maxLines: 2,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 46.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blueBgColor,
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(keyCreditBalance.tr,style:textStyleHeadlineMedium()),
                Text("\$2.00",style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700,fontSize:14.sp,color: AppColors.textRedColor),),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          PrimaryBottomButton(callBack: (){}, title: keyConfirmPayment.tr)
        ],),
    ).paddingAll(20.h);
  }


  _detailsContainer() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: AppColors.blueBgColor,
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyDetails.tr,style:textStyleHeadlineLarge()),
          _itemDetails(keyDiscounts.tr),
          _itemDetails(keyTax.tr),
          _itemDetails(keyTotal.tr),
        ],
      ),
    );
  }

  _itemDetails(String title){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:textStyleBodyMedium().copyWith(fontSize: 14.sp)),
        Text("\$2.00",style: textStyleHeadlineMedium().copyWith(fontSize:14.sp,fontWeight: FontWeight.w700)),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

}
