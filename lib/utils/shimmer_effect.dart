import 'package:impact_zone/export.dart';

class ShimmerEffect {

  static shimmerAppointmentListContent({bool resource= false}) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
        decoration: BoxDecoration(
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
                    shape: BoxShape.circle, color: AppColors.blueBgColor),
                child: AssetImageWidget(
                  AppImages.iconsAppointment,
                  imageHeight: 22.h,
                ).paddingAll(8.h),
              ).paddingOnly(right: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20.h,
                    width: Get.width*0.6,
                    color: Colors.white,
                  ).paddingOnly(bottom: 5.h),
                  Container(
                    height: 20.h,
                    width: Get.width*0.6,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.h),
            decoration: BoxDecoration(
              color: AppColors.blueBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ).paddingOnly(top: 15.h, bottom: 15.h),
          resource ? Container(
            height: 25.h,
            width: Get.width,
            color: Colors.white,
          ): SizedBox()
        ],
      ),
    ),
  );
  
  static shimmerMemberListContent() => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Row(
      children: [
        Container(
          height: 30.h,
          width: 30.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueBgColor),
        ).paddingOnly(right: 8.h),
        Expanded(
          child: Container(
            color: Colors.white,
            height: 20.h,
            width: Get.width,
          ),
        ),
      ],
    ),
  );

}
