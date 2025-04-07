import 'package:impact_zone/export.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => Stack(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: PageView(
                  onPageChanged: (value) {
                    controller.onSwipePage(value);
                  },
                  controller: controller.pageController,
                  children: controller.pages,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _indicatorWidget(),
                  _nextSkipButton(),
                ],
              ).paddingSymmetric(horizontal: 15.h)
            ],
          ),
        ));
  }

  Widget _indicatorWidget() => Expanded(
        child: Container(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.pages.length,
            effect: ExpandingDotsEffect(
              dotHeight: 7.h,
              dotWidth: 7.w,
              spacing: 4.w,
              expansionFactor: 3.6,
              activeDotColor: Colors.white,
              dotColor: Colors.white12
            ),
          ),
        ).paddingOnly(top: Get.height * 0.5),
      );

  Widget _nextSkipButton() => Row(
        children: [
          Expanded(
            child: CustomButtonWidget(
                onPressed: () {
                  controller.movePageAction();
                },
                buttonText: controller.selectedPageIndex.value ==
                        controller.pages.length - 1
                    ? keyGetStarted.tr
                    : keyNext.tr,
                buttonRadius: 12.r),
          ),
          SizedBox(
            width: controller.selectedPageIndex.value ==
                controller.pages.length - 1
                ?  0.w : 20.w,
          ),
          controller.selectedPageIndex.value ==
              controller.pages.length - 1
              ?  SizedBox() : Expanded(
            child: CustomButtonWidget(
                onPressed: () {
                  controller.moveToLoginScreen();
                },
                isOutlined: true,
                outlineColor: Colors.white,
                buttonText: keySkip.tr,
                buttonRadius: 12.r),
          ),
        ],
      ).paddingOnly(bottom: 17.h);
}
