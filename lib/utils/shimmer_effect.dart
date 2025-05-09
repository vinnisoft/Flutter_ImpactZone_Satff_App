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



  static Widget profileShimmer({bool resource= false,bool showCompleted=false}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image Placeholder
            Container(
              height: 80.h,
              width: 80.h,
              margin: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),

            // Profile Details Card Placeholder
            Container(
              margin: EdgeInsets.all(20.h),
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: 16.h, width: 80.w, color: Colors.white),
                          Container(height: 16.h, width: 120.w, color: Colors.white),
                        ],
                      ),
                      Divider(color: Colors.grey.shade200).paddingSymmetric(vertical: 10.h),
                    ],
                  );
                }),
              ),
            ),

            // Password Section Placeholder
            Container(
              margin: EdgeInsets.all(20.h),
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 18.h, width: 120.w, color: Colors.white).paddingOnly(bottom: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 16.h, width: 100.w, color: Colors.white),
                      Container(height: 16.h, width: 100.w, color: Colors.white),
                    ],
                  )
                ],
              ),
            )
          ],
        ).paddingOnly(bottom: 30.h),
      ),
    );
  }




  static Widget inventoryCategoryShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderGreyColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12.h,
                    width: 100.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 12.h,
                    width: 60.w,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 24.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ],
        ),
      ),
    );
  }



  static Widget passwordShimmerLoader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.h),
          margin: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
            ],
          ),
          child: Column(
            children: [
              _shimmerTextField(),
              _shimmerTextField(),
              _shimmerTextField(),
              _shimmerButton().paddingOnly(top: 20.h),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _shimmerTextField() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 56.h,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            // Prefix icon placeholder
            Container(
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            SizedBox(width: 12.w),
            // Text line placeholder
            Expanded(
              child: Container(
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Suffix icon placeholder (eye icon)
            Container(
              height: 20.h,
              width: 20.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ],
        ),
      ),
    );
  }


 static  Widget _shimmerButton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }






  static Widget eventShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: List.generate(8, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12.h,
                width: 80.w,
                color: Colors.white,
              ),
              SizedBox(height: 8.h),
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        })
      ),
    );
  }


}
