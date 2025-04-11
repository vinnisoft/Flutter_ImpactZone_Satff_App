import 'package:impact_zone/export.dart';

class AppointmentListWidget extends StatelessWidget {
  final String appointmentImage;
  final String appointmentHeading;
  final String appointmentType;
  final String appointmentDate;
  final String appointmentStartTime;
  final String appointmentEndTime;
  final String? resource;

  const AppointmentListWidget({
    super.key,
    required this.appointmentImage,
    required this.appointmentHeading,
    required this.appointmentType,
    required this.appointmentDate,
    required this.appointmentStartTime,
    required this.appointmentEndTime,
    this.resource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, spreadRadius: 2, blurRadius: 10)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blueBgColor),
                child: AssetImageWidget(
                  appointmentImage,
                  imageHeight: 22.h,
                ).paddingAll(8.h),
              ).paddingOnly(right: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   appointmentHeading,
                    style: textStyleLabelMedium()
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    appointmentType,
                    style: textStyleTitleSmall(),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 2.h, horizontal: 15.h),
            decoration: BoxDecoration(
              color: AppColors.blueBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    AssetImageWidget(
                      AppImages.iconsDate,
                      imageHeight: 15.h,
                    ).paddingOnly(right: 6.h),
                    Text(
                      appointmentDate,
                      style: textStyleBodyMedium(),
                    )
                  ],
                ),
                Container(
                  color: AppColors.secondaryTextColor,
                  height: 20.h,
                  width: 1.h,
                ),
                Row(
                  children: [
                    AssetImageWidget(
                      AppImages.iconsTime,
                      imageHeight: 15.h,
                    ).paddingOnly(right: 6.h),
                    Text(
                      '$appointmentStartTime - $appointmentEndTime',
                      style: textStyleBodyMedium(),
                    )
                  ],
                ),
              ],
            ),
          ).paddingOnly(top: 15.h),
          resource != null? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                keyResource.tr,
                style: textStyleLabelMedium(),
              ).paddingOnly(right: 10.h),
              Expanded(
                child: Text(
                  resource ?? '',
                  textAlign:  TextAlign.end,
                  style: textStyleTitleSmall(),
                ),
              )
            ],
          ).paddingOnly(top: 15.h, bottom: 5.h) : SizedBox()
        ],
      ),
    );
  }
}
