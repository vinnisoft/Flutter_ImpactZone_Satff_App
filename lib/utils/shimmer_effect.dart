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



  static shimmerTaskListContent({bool resource= false,bool showCompleted=false}) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blueBgColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: AssetImageWidget(
            AppImages.iconsTask,
            imageHeight: 20.h,
          ).paddingAll(10.h),
        ).paddingOnly(right: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  Row(
  children: [
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Container(
  height: 20.h,
  width: Get.width*0.4,
  color: Colors.white,
  ).paddingOnly(bottom: 5.h),
  Container(
  height: 20.h,
  width: Get.width*0.4,
  color: Colors.white,
  ),
  ],
  ),
    SizedBox(width: 30.w,),
    if(showCompleted)Container(
      decoration: BoxDecoration(
        color: AppColors.blueBgColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: AssetImageWidget(
        AppImages.iconsTask,
        imageHeight: 20.h,
      ).paddingAll(10.h),
    ).paddingOnly(right: 8.h),
  ],
  ),
          ],
        )
      ],
    ),
  );





  static Widget shimmerTaskDetailsContent({
    bool resource = false,
    bool showCompleted = false,
  }) =>
      Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top card with icon and title/name
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              width: Get.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon container
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.blueBgColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: AssetImageWidget(
                      AppImages.iconsTask,
                      imageHeight: 20.h,
                    ).paddingAll(10.h),
                  ).paddingOnly(right: 10.w),

                  // Title & name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16.h,
                          width: Get.width * 0.4,
                          color: Colors.white,
                        ).paddingOnly(bottom: 5.h),
                        Container(
                          height: 16.h,
                          width: Get.width * 0.3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  // Optional: Completed badge shimmer
                  if (showCompleted)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.blueBgColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: AssetImageWidget(
                        AppImages.iconsTask,
                        imageHeight: 20.h,
                      ).paddingAll(10.h),
                    ).paddingOnly(left: 10.w),
                ],
              ),
            ),

            // Second card with task details shimmer
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description title
                  Container(
                    height: 18.h,
                    width: Get.width * 0.3,
                    color: Colors.white,
                  ).paddingOnly(bottom: 10.h),

                  // Description content
                  Container(
                    height: 14.h,
                    width: Get.width * 0.7,
                    color: Colors.white,
                  ).paddingOnly(bottom: 15.h),

                  Divider(color: Colors.grey.shade200),

                  // Assigned By
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 16.h,
                        width: Get.width * 0.3,
                        color: Colors.white,
                      ),
                      Container(
                        height: 16.h,
                        width: Get.width * 0.2,
                        color: Colors.white,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10.h),

                  Divider(color: Colors.grey.shade200),

                  // Due Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 16.h,
                        width: Get.width * 0.3,
                        color: Colors.white,
                      ),
                      Container(
                        height: 16.h,
                        width: Get.width * 0.2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );




}
