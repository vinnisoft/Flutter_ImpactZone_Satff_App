

import 'package:impact_zone/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final List<Widget>? actionWidget;
  final Color? bgColor;
  final Color? backIconColor;
  final bool? isBackIconVisible;
  final bool? isAuthentication;
  final Function? onTap;

  CustomAppBar({
    Key? key,
    this.appBarTitleText,
    this.onTap,
    this.actionWidget,
    this.isBackIconVisible = true,
    this.isAuthentication = false,
    this.backIconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.h,
      leading: (isBackIconVisible ?? true) ? _backIcon() : SizedBox(),
      centerTitle: true,
      title: appBarTitleText != "" || appBarTitleText != null
          ? Text(
        appBarTitleText ?? "",
        textAlign: TextAlign.center,
        style: textStyleHeadlineMedium().copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ).paddingOnly(top: 10.h, bottom: 10.h) : Container(height: 0, width: 0,),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r)
      ),
      backgroundColor: bgColor ?? AppColors.appColor,
      actions:  actionWidget ?? [],
      
    );
  }

  _backIcon() {
    return GetInkWell(
      child: AssetImageWidget(
        AppImages.iconsBack,
        color: backIconColor ?? null,
        imageHeight: 15.h,
      ).paddingSymmetric(vertical: 14.h, horizontal: 15.w),
      onTap: () {
        if (onTap == null) {
          Get.back(result: true);
        } else {
          onTap!();
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
