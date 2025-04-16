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
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
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
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                maxLines: 2,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 10),
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
                Text(keyCreditBalance.tr,style: TextStyle(fontWeight: FontWeight.w500,fontSize:18,color: AppColors.primaryTextColor),),
                Text("\$2.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize:14,color: AppColors.textRedColor),),
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
          Text(keyDetails.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
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
        Text(title,style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 14)),
        Text("\$2.00",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 14)),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

}
