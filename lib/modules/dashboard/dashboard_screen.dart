import 'package:impact_zone/export.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.screens[controller.selectedTab.value]),
        bottomNavigationBar: _bottomAppBar());
  }

  _bottomAppBar() => Obx(
        () => Container(
          padding: EdgeInsets.only(top: 4.h, bottom: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18.r),
                topLeft: Radius.circular(18.r),
              ),
            boxShadow: [BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 2
            )]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.r),
              topLeft: Radius.circular(18.r),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.selectedTab.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.selectedTab.value = index;
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    break;
                }
              },
              selectedLabelStyle: textStyleBodySmall().copyWith(fontSize: 0.sp),
              backgroundColor: Colors.white,
              selectedItemColor: AppColors.appColor,
              unselectedItemColor: AppColors.primaryTextColor,
              unselectedLabelStyle: textStyleBodySmall().copyWith(fontSize: 0.sp),
              items: [
                _navBarItem(
                  icon: AppImages.iconsHomeUnselected,
                  activeIcon: AppImages.iconsHomeSelected,
                ),
                _navBarItem(
                  icon: AppImages.iconsCalendarUnselected,
                  activeIcon: AppImages.iconsCalendarSelected,
                ),
                _navBarItem(
                  icon: AppImages.iconsChatUnselected,
                  activeIcon: AppImages.iconsChatSelected,
                ),
                _navBarItem(
                  icon: AppImages.iconsProfileUnselected,
                  activeIcon: AppImages.iconsProfileSelected,
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navBarItem({icon, activeIcon}) =>
      BottomNavigationBarItem(
        icon: Image.asset(
          icon,
          height: 22.h,
        ),
        label: '',
        activeIcon: Image.asset(
          activeIcon,
          height: 22.h,
        ),
      );
}
