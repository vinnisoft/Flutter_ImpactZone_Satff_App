import 'package:impact_zone/export.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                          keyLetsGetStarted.tr,
                          style: textStyleDisplayMedium(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          keyLetsGetStartedDesc.tr,
                          style: textStyleTitleLarge().copyWith(fontWeight: FontWeight.w400),
                        ).paddingSymmetric(vertical: 10.h),
                      ),
                      _form(),
                      _forgotPassword(),
                      _loginButton(),
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
      key: _loginFormKey,
      child: Column(
        children: [
          TextFieldWidget(
            textController: controller.emailTextController,
            focusNode: controller.emailFocusNode,
            prefixIcon: AssetImageWidget(
               AppImages.iconsEmail,
              imageHeight: 12.h,
            ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
            label: keyEmail.tr,
            validate: (value) => EmailValidator.validateEmail(value ?? ''),
          ).paddingSymmetric(vertical: 8.h),
          Obx(
            () => TextFieldWidget(
              textController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              label: keyPassword.tr,
              obscureText: controller.viewPassword.value,
              validate: (value) =>
                  PasswordFormValidator.validatePassword(value ?? ''),
              maxLength: 16,
              prefixIcon: AssetImageWidget(
                AppImages.iconsPassword,
                imageHeight: 12.h,
              ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
              suffixIcon: GetInkWell(
                onTap: () => controller.viewPassword.value =
                    !controller.viewPassword.value,
                child: AssetImageWidget(
                  controller.viewPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 10.h,
                ).paddingSymmetric(vertical: 12.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 8.h),
          )
        ],
      ));

  _forgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: GetInkWell(
          onTap: () {
            Get.toNamed(AppRoutes.routeForgotPassword);
          },
          child: Text("${keyForgotPassword.tr}?",
              style: textStyleTitleSmall().copyWith(color: AppColors.appColor)),
        ),
      ).paddingOnly(top: 2.h, bottom: 14.h);

  _loginButton() => CustomButtonWidget(
        onPressed: () {
          if (_loginFormKey.currentState!.validate()) {
            controller.loginApi();
          }
        },
        isLoading: controller.loginLoading,
        buttonText: keySignIn.tr,
      ).paddingSymmetric(vertical: 10.h);
}
