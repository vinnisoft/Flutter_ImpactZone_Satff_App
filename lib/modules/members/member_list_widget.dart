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
            imageHeight: 35.h,
            imageWidth: 35.h,
            radiusAll:30 ,
          ),
        ).paddingOnly(right: 8.h),
        Expanded(
          child: Text(
              memberName,
              style:textStyleHeadlineLarge().copyWith(
                fontWeight: FontWeight.w700,)
              )
        ),
      ],
    );
  }
}
