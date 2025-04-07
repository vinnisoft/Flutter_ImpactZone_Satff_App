import 'package:impact_zone/export.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonBgColor;
  final Color? textColor;
  final Color? outlineColor;
  final double? buttonRadius;
  final double? minWidth;
  final double? minHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Function()? onPressed;
  final Widget? widget;
  final Widget? iconWidget;
  final bool isOutlined;
  final RxBool? isLoading;
  final RxBool? isEnable;

  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    this.buttonBgColor,
    this.buttonTextStyle,
    this.textColor,
    this.buttonRadius,
    required this.onPressed,
    this.minWidth,
    this.minHeight,
    this.verticalPadding,
    this.horizontalPadding,
    this.widget,
    this.iconWidget,
    this.isOutlined = false,
    this.isLoading,
    this.outlineColor,
    this.isEnable,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: (isLoading?.value ?? false) == true
            ? Center(
            child: Container(
              height: 40.h,
              width: 40.w,
              margin: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 8.h,
                  horizontal: horizontalPadding ?? 20.w),
              child: SizedBox(
                  height: 40.h,
                  child: const CircularProgressIndicator(
                      color: AppColors.appColor)
                      .paddingSymmetric(horizontal: 5.w, vertical: 7.h)),
            ))
            : GestureDetector(
          onTap: isEnable?.value ?? RxBool(true).value ? onPressed : (){},
          child: Container(
              height: minHeight,
              width: minWidth ?? Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(buttonRadius ?? 5.r),
                  color: isEnable?.value ?? RxBool(true).value ? isOutlined ? Colors.transparent :  (buttonBgColor ?? AppColors.appColor) : AppColors.appColor.withOpacity(0.6),
                  border: isEnable?.value ?? RxBool(true).value
                      ? isOutlined
                      ? Border.all(
                    color: outlineColor ?? AppColors.appColor,
                    width: 1.w,
                  )
                      : Border.all(color: AppColors.appColor, width: 1.w) : null),
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 9.h,
                  horizontal: horizontalPadding ?? 20.w),
              child: widget ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      iconWidget ?? const SizedBox(),
                      Text(buttonText,
                          style: buttonTextStyle ??
                              textStyleHeadlineSmall().copyWith(
                                  color: isOutlined ? outlineColor ?? AppColors.appColor : Colors.white,)),
                    ],
                  )),
        )));
  }
}
