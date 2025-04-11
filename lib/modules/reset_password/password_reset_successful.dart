import 'package:impact_zone/export.dart';

class PasswordResetSuccessful extends StatelessWidget{
  const PasswordResetSuccessful({super.key});

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
                      AssetImageWidget(
                        AppImages.iconsPasswordChanged,
                        imageHeight: 80.h,
                      ).paddingSymmetric(vertical: 10.h),
                      Text(
                        keyPasswordChanged.tr,
                        style: textStyleDisplayMedium(),
                      ).paddingOnly(top: 30.h),
                      Text(
                        keyPasswordChangedDesc.tr,
                        textAlign: TextAlign.center,
                        style: textStyleTitleLarge().copyWith(fontWeight: FontWeight.w400),
                      ).paddingSymmetric(vertical: 10.h),
                      _backToSignInButton(),
                    ],
                  ).paddingSymmetric(horizontal: 40.w, vertical: 30.h),
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

  _backToSignInButton() => CustomButtonWidget(
    onPressed: () {
      Get.offAllNamed(AppRoutes.routeLogin);
    },
    buttonText: keyBackToSignIn.tr,
  ).paddingOnly(top: 15.h);
}
