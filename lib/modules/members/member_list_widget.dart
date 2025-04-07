import 'package:impact_zone/export.dart';

class MemberListWidget extends StatelessWidget {
  final String memberImage;
  final String memberName;

  const MemberListWidget({super.key,
    required this.memberImage,
    required this.memberName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueBgColor),
          child: NetworkImageWidget(
            imageUrl: memberImage,
            imageHeight: 30.h,
            imageWidth: 30.h,
          ),
        ).paddingOnly(right: 8.h),
        Expanded(
          child: Text(
              memberName,
              style: textStyleTitleMedium()),
        ),
      ],
    );
  }
}
