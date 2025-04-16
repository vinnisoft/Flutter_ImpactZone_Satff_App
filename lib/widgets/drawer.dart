import 'package:impact_zone/export.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 140.h,
              child: DrawerHeader(
                padding: EdgeInsets.only(bottom: 8.h, left: 12.h, right: 12.h),
                decoration: BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    AssetImageWidget(
                      AppImages.iconsProfileImage,
                      imageHeight: 45.h,
                      imageWidth: 45.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Text(
                        '${Get.find<DashboardController>().userData.value.firstName ?? ''}${Get.find<DashboardController>().userData.value.lastName ?? ''}',
                        style: textStyleHeadlineMedium()
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                _drawerItem(
                    onPress: () {
                      Get.back();
                      Get.toNamed(AppRoutes.routeMembersScreen);
                    },
                    icon: AppImages.iconsDrawerMembers,
                    label: keyMembers.tr),
                _drawerItem(
                    onPress: () {},
                    icon: AppImages.iconsClassSchedule,
                    label: keyClassSchedule.tr),
                _drawerItem(
                    onPress: () {},
                    icon: AppImages.iconsTraining,
                    label: keyTrainingNutrition.tr),
                _drawerItem(
                    onPress: () {
                      Get.toNamed(AppRoutes.routePosScreen);
                    },
                    icon: AppImages.iconsPOS,
                    label: keyPOS.tr),
                _drawerItem(
                    onPress: () {
                      Get.back();
                      Get.toNamed(AppRoutes.routeReportScreen);
                    },
                    icon: AppImages.iconsReport,
                    label: keyReports.tr),
                _drawerItem(
                    onPress: () {},
                    icon: AppImages.iconsLogOut,
                    label: keyLogout.tr),
              ],
            ).paddingSymmetric(horizontal: 16.h, vertical: 10.h),
          ],
        ),
      ),
    );
  }

  _drawerItem({onPress, icon, label}) => InkWell(
        onTap: onPress,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.h),
            decoration: BoxDecoration(
              // color: AppColors.appColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                AssetImageWidget(
                  icon,
                  color: Colors.black,
                  imageHeight: 18.h,
                  imageWidth: 18.h,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: textStyleLabelLarge(),
                  ),
                )
              ],
            )),
      );
}
