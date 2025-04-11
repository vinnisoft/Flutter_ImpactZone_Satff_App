import 'package:impact_zone/export.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  ForgotPasswordScreen({super.key});

  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GetInkWell(
            onTap: () {
              Get.back();
            },
            child: AssetImageWidget(
              AppImages.iconsBack,
              imageHeight: 16.h,
            ).paddingSymmetric(horizontal: 14.w),
          ),
        ),
        body:Stack(
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
                  padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 5.h),
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
                          keyForgotPassword.tr,
                          style: textStyleDisplayMedium(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          keyForgotPasswordDesc.tr,
                          style: textStyleTitleLarge().copyWith(fontWeight: FontWeight.w400),
                        ).paddingSymmetric(vertical: 10.h),
                      ),
                      _form(),
                      _sendOtpButton(),
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

  _form() => Form(
      key: _forgotPasswordFormKey,
      child: TextFieldWidget(
        textController: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        label: keyEmail.tr,
        prefixIcon: AssetImageWidget(
          AppImages.iconsEmail,
          imageHeight: 12.h,
        ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),

        validate: (value) => EmailValidator.validateEmail(value ?? ''),
      ).paddingSymmetric(vertical: 12.h));

  _sendOtpButton() => CustomButtonWidget(
        onPressed: () {
          if (_forgotPasswordFormKey.currentState!.validate()) {
            controller.requestOTPApi();
          }
        },
        isLoading: controller.isOtpRequested,
        buttonText: keyContinue.tr,
      ).paddingSymmetric(vertical: 10.h);
}
