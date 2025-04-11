import 'package:impact_zone/export.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
