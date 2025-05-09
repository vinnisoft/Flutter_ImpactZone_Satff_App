import '../../export.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
   ChangePasswordScreen({super.key});
  final _createNewPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyChangePassword.tr,
        actionWidget: [
          AssetImageWidget(
            AppImages.iconsNotification,
            imageHeight: 20.h,
          ),
        ],
      ),
      body: ListView(
        children: [


          Obx(
          ()=> controller.isPasswordLoading.value?ShimmerEffect.passwordShimmerLoader():Container(
              padding: EdgeInsets.all(20.h),
              margin: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                  ]),
              child: Column(
                children: [
                  _form(),
                  PrimaryBottomButton(callBack: (){
                    controller.changePasswordApi();
                  }, title: keySaveChanges.tr).paddingOnly(top: 20.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  _form() => Form(
      key: _createNewPasswordFormKey,
      child: Column(
        children: [
          Obx(
                () => TextFieldWidget(
              textController: controller.oldPasswordTextController,
              focusNode: controller.oldPasswordFocusNode,
              label: keyOldPassword.tr,
              obscureText: controller.viewOldPassword.value,
              maxLength: 16,
              prefixIcon: AssetImageWidget(
                AppImages.iconsPassword,
                imageHeight: 12.h,
              ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
              suffixIcon: GetInkWell(
                onTap: () => controller.viewOldPassword.value =
                !controller.viewOldPassword.value,
                child: AssetImageWidget(
                  controller.viewOldPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 12.h,
                ).paddingSymmetric(vertical: 12.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          ),
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
}
