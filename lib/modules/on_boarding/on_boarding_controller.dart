import 'package:impact_zone/export.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  List<OnBoardingWidget> pages = [
    OnBoardingWidget(
      imageUrl: AppImages.imagesOnBoarding1,
      headingText: keyOnboardingHeading1.tr,
      bodyText: keyOnboardingDesc1.tr,
    ),
    OnBoardingWidget(
      imageUrl: AppImages.imagesOnBoarding2,
      headingText: keyOnboardingHeading2.tr,
      bodyText: keyOnboardingDesc2.tr,
    ),
    OnBoardingWidget(
      imageUrl: AppImages.imagesOnBoarding3,
      headingText: keyOnboardingHeading3.tr,
      bodyText: keyOnboardingDesc3.tr,
    )
  ];
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }

  movePageAction() {
    if (selectedPageIndex.value < pages.length - 1) {
      selectedPageIndex.value++;
      pageController.animateToPage(selectedPageIndex.value,
          curve: Curves.decelerate,
          duration: const Duration(
              milliseconds: 500)); // for animated jump. Requires a cu
    } else {
       moveToLoginScreen();
    }
  }

  moveToLoginScreen() {
    Get.find<LocalStorage>().firstLaunch(true);
    Get.offAllNamed(AppRoutes.routeLogin);
  }

  onSwipePage(index) {
    selectedPageIndex.value = index;
    update();
  }

  @override
  void refresh() {
    super.refresh();
  }
}
