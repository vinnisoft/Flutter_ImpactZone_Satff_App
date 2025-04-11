import 'package:impact_zone/export.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ).paddingOnly(bottom: 30.h),
        ),
    );
  }

}
