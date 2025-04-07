import 'package:impact_zone/export.dart';

class OnBoardingWidget extends StatelessWidget {
  final String imageUrl;
  final String headingText;
  final String bodyText;

  const OnBoardingWidget({
    super.key,
    required this.imageUrl,
    required this.headingText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageUrl),
              fit: BoxFit.cover)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _heading(),
                _title(),
              ],
            ).paddingSymmetric(vertical: Get.height *0.1, horizontal: 15.h)));
  }

  Widget _heading() => Text(
        headingText.tr,
        style: textStyleDisplayLarge()
            .copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      );

  Widget _title() => Text(
        bodyText.tr,
        style: textStyleLabelLarge().copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.onboardingSubheading),
        textAlign: TextAlign.center,
      ).paddingOnly(top: 15.h, bottom: 18.h);
}
