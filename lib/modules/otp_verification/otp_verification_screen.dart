import 'package:impact_zone/export.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GetInkWell(
            onTap: () {
              Get.offAllNamed(AppRoutes.routeLogin);
            },
            child: AssetImageWidget(
              AppImages.iconsBack,
              imageHeight: 16.h,
            ).paddingSymmetric(horizontal: 14.w),
          ),
        ),
        body: Stack(
          children: [
            AssetImageWidget(
              AppImages.imagesAuthBg,
              imageFitType: BoxFit.cover,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _appLogo(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 22.h, horizontal: 5.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                       BoxShadow(
                            color: Colors.black12,
                            spreadRadius:2,
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          keyOTPVerification.tr,
                          style: textStyleDisplayMedium(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${keyOTPVerificationDesc.tr} ${controller.email.value.split('@').first.split('').first}**@${controller.email.value.split('@').last}',
                          style: textStyleTitleLarge()
                              .copyWith(fontWeight: FontWeight.w400),
                        ).paddingSymmetric(vertical: 10.h),
                      ),
                      _form(),
                      _otpMatches(),
                      _submitButton(),
                      _resend(),
                    ],
                  ).paddingSymmetric(horizontal: 18.w),
                ).paddingSymmetric(vertical: 20.h, horizontal: 18.h),
              ],
            )
          ],
        ));
  }

  _appLogo() => AssetImageWidget(
        AppImages.iconsAppLogo,
        imageHeight: 60.h,
      ).paddingOnly(top: 70.h, bottom: 10.h);

  _form() => Pinput(
        controller: controller.otpTextController,
        focusNode: controller.otpFocusNode,
        length: 4,
        onChanged: (value) {
          controller.otpCode.value = value;
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

  _otpMatches() => Obx(
        () => Visibility(
      visible: controller.otpErrorMessage.value != '',
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          controller.otpErrorMessage.value,
          textAlign: TextAlign.start,
          style: textStyleBodyLarge().copyWith(
              color: Colors.red,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
        ).paddingOnly(left: 15.w, top: 5.h),
      ),
    ).paddingOnly(bottom: 15.h),
  );

  _submitButton() => CustomButtonWidget(
        onPressed: () {
          controller.onOtpTextFieldChange(controller.otpCode.value);
        },
        isLoading: controller.verifyOtpLoading,
        buttonText: keyContinue.tr,
      ).paddingOnly(top: 10.h, bottom: 16.h);

  _resend() => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (controller.resendLoading.value)
                ? Text(keyResendCode.tr,
                    style: textStyleTitleMedium().copyWith(color: Colors.grey, fontWeight: FontWeight.w600))
                : controller.start.value == 0
                    ? GetInkWell(
                        onTap: () {
                          controller.requestOTPApi();
                        },
                        child: Text(keyResendCode.tr,
                            style: textStyleTitleMedium()
                                .copyWith(color: AppColors.appColor, fontWeight: FontWeight.w600)))
                    : Row(
                      children: [
                        Text(keyResendCode.tr,
                            style:
                            textStyleTitleMedium().copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
                        Text(keyIN.tr,
                            style:
                                textStyleTitleSmall().copyWith(color: AppColors.primaryTextColor)),
                      ],
                    ),
            controller.start.value == 0
                ? SizedBox()
                : Text(
                    controller.secondsStr.value,
                    style: textStyleTitleMedium()
                        .copyWith(color: AppColors.appColor, fontWeight: FontWeight.w600),
                  ).paddingOnly(left: 2.w)
          ],
        ),
      );
}
