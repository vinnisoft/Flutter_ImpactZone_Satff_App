import 'package:impact_zone/export.dart';


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
            controller.title.value=="Check"?Text(keyCheck.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),):SizedBox(),
            controller.title.value=="Check"?_checkTextField():SizedBox(),
            Expanded(child: SizedBox()),
            PrimaryBottomButton(callBack: (){
              _confirmPaymentSheet();
            }, title:keyConfirmPayment.tr )
        ],),
      ).paddingAll(20.h),
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
    return TextFieldWidget(
      hint: keyEnter.tr,
      prefixIcon: AssetImageWidget(
        AppImages.iconsCheckIcon,
        imageHeight: 12.h,
      ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),

      validate: (value) => EmailValidator.validateEmail(value ?? ''),
    ).paddingSymmetric(vertical: 12.h);
  }

  _form() => Pinput(
    length: 4,
    onChanged: (value) {
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
