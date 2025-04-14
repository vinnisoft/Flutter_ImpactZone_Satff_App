import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/modules/pos_checkout_details/pos_checkout_details_controller.dart';
import 'package:impact_zone/widgets/primary_bottom_button.dart';
import 'package:impact_zone/widgets/top_banner.dart';

import '../../app_values/app_colors.dart';
import '../../app_values/app_images.dart';
import '../../app_values/text_styles.dart';
import '../../export.dart';
import '../../translation/local_keys.dart';

class PosCheckoutDetailsScreen extends GetView<PosCheckOutDetailsController> {
  const PosCheckoutDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> Scaffold(
        appBar: CustomAppBar(appBarTitleText:controller.title.value, actionWidget: [
          AssetImageWidget(
            AppImages.iconsNotification,
            imageHeight: 20.h,
          ),
        ],),
        body: Column(
          children: [
            // topBanner(title: "Check"),
            _details()
          ],
        ),
      ),
    );
  }

  _details() {
    return Obx(
        ()=> Container(
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
            controller.title.value=="Check"?Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 20.h):SizedBox(),
            controller.title.value=="Check"?Text("Check",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),):SizedBox(),
            controller.title.value=="Check"?_checkTextField():SizedBox(),
            Expanded(child: SizedBox()),
            PrimaryBottomButton(callBack: (){
              _confirmPaymentSheet();
            }, title:keyConfirmPayment.tr )
        ],),
      ).paddingAll(20.h),
    );
  }

  _bottomButton({Function()? onClickCallBack}) {
    return InkWell(
      onTap: onClickCallBack,
      child: Container(
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(child: Text(keyConfirmPayment.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
      ),
    );
  }

  _confirmPaymentSheet() => Get.bottomSheet(
      Container(
        width: Get.width,
        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 6.h,
              width: 120.w,
              decoration: BoxDecoration(
                  color: AppColors.bottomSheetBarColor,
                  borderRadius: BorderRadius.circular(15.r)),
            ),
            Text(
              keyConfirmPayment.tr,
              style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 18),
            ).paddingOnly(top: 15.h,),
            Text(
              keyOtpSendMessage.tr,
              textAlign: TextAlign.center,
              style:TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,fontSize: 14),
            ).paddingOnly(top: 15.h, bottom: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _form(),
                Text(keyResendCode.tr+keyIN.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700),).paddingOnly(bottom: 20.h,top: 10.h),
              ],
            ),
            PrimaryBottomButton(callBack: (){
              Get.back();
              _congratulationSheet();
            }, title: keyContinue.tr)
          ],
        ).paddingOnly(top: 5.h),
      ),
      barrierColor: Colors.black26,
      backgroundColor: Colors.white);
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

  _checkTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerGreyColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        children: [
          Image.asset(AppImages.iconsCheckIcon,width: 25,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter',
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                filled: true,
                isDense: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.secondaryTextColor)
              ),
              onTap: () {
                // open your modal, popup, or dropdown logic here
              },
            ),
          ),
        ],
      ),
    );
  }

  _form() => Pinput(
    // controller: controller.otpTextController,
    // focusNode: controller.otpFocusNode,
    length: 4,
    onChanged: (value) {
      // controller.otpCode.value = value;
    },

    defaultPinTheme: PinTheme(
        width: 50.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
            border: Border.all(
                color: AppColors.textFieldBorderColor, width: 1.w))),
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    focusedPinTheme: PinTheme(
        width: 50.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
            border: Border.all(
                color: AppColors.textFieldBorderColor, width: 1.w))),
    errorPinTheme: PinTheme(
        width: 50.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 1.w))),
    disabledPinTheme: PinTheme(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
            border: Border.all(
                color: AppColors.textFieldBorderColor, width: 1.w))),
    // validator: (value) => OtpFormValidator.validateOtpField(value: value!),
  );


  _congratulationSheet() => Get.bottomSheet(
      Container(
        width: Get.width,
        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 6.h,
              width: 120.w,
              decoration: BoxDecoration(
                  color: AppColors.bottomSheetBarColor,
                  borderRadius: BorderRadius.circular(15.r)),
            ),
            Text(
              keyCongratulation.tr,
              style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 18),
            ).paddingOnly(top: 15.h,),
            Text(
              keyPaymentConfirmMessage.tr,
              textAlign: TextAlign.center,
              style:TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,fontSize: 14),
            ).paddingOnly(top: 15.h, bottom: 30.h),

            PrimaryBottomButton(callBack: ()=> Get.back()
            , title: keyGoBack.tr)
          ],
        ).paddingOnly(top: 5.h),
      ),
      barrierColor: Colors.black26,
      backgroundColor: Colors.white);
}
