import 'package:impact_zone/export.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({super.key});

  final _createNewPasswordFormKey = GlobalKey<FormState>();

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
                          keyResetPassword.tr,
                          style: textStyleDisplayMedium(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          keyResetPasswordDesc.tr,
                          style: textStyleTitleLarge().copyWith(fontWeight: FontWeight.w400),
                        ).paddingSymmetric(vertical: 10.h),
                      ),
                      _form(),
                      _resetPasswordButton(),
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
      key: _createNewPasswordFormKey,
      child: Column(
        children: [
          Obx(
            () => TextFieldWidget(
              textController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              label: keyNewPassword.tr,
              obscureText: controller.viewPassword.value,
              validate: (value) =>
                  PasswordFormValidator.validateNewPassword(value ?? ''),
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
                  imageHeight: 12.h,
                ).paddingSymmetric(vertical: 12.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          ),
          Obx(
            () => TextFieldWidget(
              textController: controller.confirmPasswordTextController,
              focusNode: controller.confirmPasswordFocusNode,
              label: keyConfirmPassword.tr,
              obscureText: controller.viewConfirmPassword.value,
              prefixIcon: AssetImageWidget(
                AppImages.iconsPassword,
                imageHeight: 12.h,
              ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
              validate: (value) =>
                  PasswordFormValidator.validateConfirmPassword(
                      value: value ?? '',
                      password: controller.passwordTextController.text.trim()),
              maxLength: 16,
              suffixIcon: GetInkWell(
                onTap: () => controller.viewConfirmPassword.value =
                    !controller.viewConfirmPassword.value,
                child: AssetImageWidget(
                  controller.viewConfirmPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 12.h,
                ).paddingSymmetric(vertical: 12.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          )
        ],
      ));

  _resetPasswordButton() => CustomButtonWidget(
        onPressed: () {
          if (_createNewPasswordFormKey.currentState!.validate()) {
            controller.resetPasswordApi();
          }
        },
        isLoading: controller.resetPasswordLoading,
        buttonText: keyResetPassword.tr,
      ).paddingOnly(top: 10.h);

}
