import '../export.dart';

class TopBannerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isHomeScreen;
  final String title;

  const TopBannerWidget({
    super.key,
    required this.scaffoldKey,
    this.isHomeScreen = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AssetImageWidget(
          AppImages.iconsHomeBg,
          imageHeight: isHomeScreen?140.h:80.h,
          imageWidth: Get.width,
          imageFitType: BoxFit.cover,
          radiusBottomLeft: 15.r,
          radiusBottomRight: 15.r,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: AssetImageWidget(
                    AppImages.iconsMenu,
                    imageHeight: 20.h,
                  ),
                ),
                Text(title,style:textStyleBodyLarge().copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22)),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.routeNotificationScreen);
                  },
                  child: AssetImageWidget(
                    AppImages.iconsNotification,
                    imageHeight: 20.h,
                  ),
                ),
              ],
            ),
            isHomeScreen
                ? Row(
              children: [
                AssetImageWidget(
                  AppImages.iconsProfileImage,
                  imageHeight: 42.h,
                ).paddingOnly(right: 8.w),
                Obx(
                      () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        keyWelcome.tr,
                        style: textStyleBodyMedium()
                            .copyWith(color: Colors.white),
                      ).paddingOnly(bottom: 2.h),
                      Text(
                        '${Get.find<DashboardController>().userData.value.firstName} ${Get.find<DashboardController>().userData.value.lastName}',
                        style: textStyleHeadlineMedium().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingOnly(top: 15.h)
                : const SizedBox.shrink(),
          ],
        ).paddingOnly(top: 40.h, left: 12.h, right: 12.h),
      ],
    );
  }
}
