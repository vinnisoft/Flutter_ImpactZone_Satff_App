import 'package:impact_zone/export.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyReports.tr,actionWidget: [
        AssetImageWidget(AppImages.iconsNotification,
        imageHeight: 20.h,
        ),
      ],),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
