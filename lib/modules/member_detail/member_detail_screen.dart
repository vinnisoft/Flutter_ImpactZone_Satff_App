import 'package:impact_zone/export.dart';

class MemberDetailScreen extends GetView<MemberDetailController> {
  const MemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        appBarTitleText: keyMembers.tr,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: controller.isMemberDetailLoading.value
              ? _shimmerEffect()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NetworkImageWidget(
                      imageUrl: baseUrl+controller.memberData.value.image.toString() ?? '',
                      imageHeight: 80.h,
                      imageWidth: 80.h,
                      radiusAll: 8.r,
                    ),
                    Text(
                      '${controller.memberData.value.firstName} ${controller.memberData.value.lastName}',
                      style: textStyleDisplaySmall(),
                    ).paddingSymmetric(vertical: 5.h),
                    _status(),
                    _location(),
                    _email(),
                    _phoneNumber(),
                    _billingHistory(),
                    _posHistory()
                  ],
                ).paddingSymmetric(vertical: 20.h, horizontal: 16.h),
        ),
      ),
    );
  }

  _status() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            AppImages.iconsCrown,
            imageHeight: 15.h,
            imageWidth: 15.h,
          ).paddingOnly(right: 8.h),
          Text(
            'Frozen',
            style: textStyleTitleMedium().copyWith(
                color: AppColors.yellowBgColor, fontWeight: FontWeight.w600),
          )
        ],
      ).paddingOnly(bottom: 10.h);

  _location() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            AppImages.iconsLocation,
            imageHeight: 16.h,
            imageWidth: 16.h,
          ).paddingOnly(right: 8.h),
          Text(
            '${controller.memberData.value.city ?? ''}, ${controller.memberData.value.state ?? ''}',
            style: textStyleBodyLarge(),
          )
        ],
      );

  _email() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            AppImages.iconsSms,
            imageHeight: 16.h,
            imageWidth: 16.h,
          ).paddingOnly(right: 8.h),
          Text(
            controller.memberData.value.email ?? '',
            style: textStyleBodyLarge(),
          )
        ],
      ).paddingSymmetric(vertical: 5.h);

  _phoneNumber() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            AppImages.iconsCall,
            imageHeight: 16.h,
            imageWidth: 16.h,
          ).paddingOnly(right: 8.h),
          Text(
            controller.memberData.value.primaryPhone ?? '',
            style: textStyleBodyLarge(),
          )
        ],
      );

  _billingHistory() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(keyBillingHistory.tr, style: textStyleDisplaySmall()),
              InkWell(
                onTap: () {},
                child: Text(keyViewAll.tr,
                    style: textStyleBodySmall().copyWith(
                        color: AppColors.primaryTextColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryTextColor)),
              ),
            ],
          ).paddingSymmetric(vertical: 15.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                ]),
            child: (controller.memberData.value.billingHistory?.length ?? 0) <=
                    0
                ? Container(
                    alignment: Alignment.center,
                    height: 100.h,
                    width: Get.width,
                    child: Text('No Billing available ',
                        style: textStyleBodyLarge()),
                  )
                : ListView.separated(
                    itemCount: (controller
                                    .memberData.value.billingHistory?.length ??
                                0) >
                            2
                        ? 2
                        : controller.memberData.value.billingHistory?.length ??
                            0,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 15.h),
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.textFieldBorderColor,
                              width: 1.w),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  controller.memberData.value
                                          .billingHistory?[index].name ??
                                      '',
                                  style: textStyleLabelMedium()),
                              Text(
                                  controller
                                              .memberData
                                              .value
                                              .billingHistory?[index]
                                              .createdAt !=
                                          null
                                      ? DateFormat("MMM dd, yyyy").format(
                                          DateTime.parse(controller
                                              .memberData
                                              .value
                                              .billingHistory![index]
                                              .createdAt!))
                                      : '',
                                  style: textStyleBodySmall())
                            ],
                          ),
                          Text(
                              '${controller.memberData.value.billingHistory?[index].netPrice != null ? controller.memberData.value.billingHistory![index].netPrice : ''}',
                              style: textStyleDisplayMedium()),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      );

  _posHistory() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(keyPOSHistory.tr, style: textStyleDisplaySmall()),
              InkWell(
                onTap: () {},
                child: Text(keyViewAll.tr,
                    style: textStyleBodySmall().copyWith(
                        color: AppColors.primaryTextColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryTextColor)),
              ),
            ],
          ).paddingSymmetric(vertical: 15.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                ]),
            child: (controller.memberData.value.posHistory?.length ?? 0) <= 0
                ? Container(
                    alignment: Alignment.center,
                    height: 100.h,
                    width: Get.width,
                    child: Text('No POS History available ',
                        style: textStyleBodyLarge()),
                  )
                : ListView.separated(
                    itemCount:
                        (controller.memberData.value.posHistory?.length ?? 0) >
                                4
                            ? 4
                            : (controller.memberData.value.posHistory?.length ??
                                0),
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                      height: 0.5.h,
                      width: Get.width,
                      color: AppColors.textFieldBorderColor,
                    ).paddingSymmetric(vertical: 12.h, horizontal: 2.h),
                    itemBuilder: (BuildContext context, int index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            controller.memberData.value.posHistory?[index]
                                    .service ??
                                '',
                            style: textStyleLabelMedium()),
                        Text(
                            controller.memberData.value.posHistory?[index]
                                        .createdAt !=
                                    null
                                ? DateFormat("MMM dd, yyyy").format(
                                    DateTime.parse(controller.memberData.value
                                        .posHistory![index].createdAt!))
                                : '',
                            style: textStyleBodyLarge()),
                      ],
                    ),
                  ),
          )
        ],
      );

  _shimmerEffect() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
            ),
            Container(
              color: Colors.white,
              height: 25.h,
              width: Get.width * 0.6,
            ).paddingSymmetric(vertical: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  AppImages.iconsCrown,
                  imageHeight: 15.h,
                  imageWidth: 15.h,
                ).paddingOnly(right: 8.h),
                Container(
                  color: Colors.white,
                  height: 18.h,
                  width: Get.width * 0.4,
                ),
              ],
            ).paddingOnly(bottom: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  AppImages.iconsLocation,
                  imageHeight: 16.h,
                  imageWidth: 16.h,
                ).paddingOnly(right: 8.h),
                Container(
                  color: Colors.white,
                  height: 18.h,
                  width: Get.width * 0.4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  AppImages.iconsSms,
                  imageHeight: 16.h,
                  imageWidth: 16.h,
                ).paddingOnly(right: 8.h),
                Container(
                  color: Colors.white,
                  height: 18.h,
                  width: Get.width * 0.4,
                ),
              ],
            ).paddingSymmetric(vertical: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  AppImages.iconsCall,
                  imageHeight: 16.h,
                  imageWidth: 16.h,
                ).paddingOnly(right: 8.h),
                Container(
                  color: Colors.white,
                  height: 18.h,
                  width: Get.width * 0.4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(keyBillingHistory.tr, style: textStyleDisplaySmall()),
                InkWell(
                  onTap: () {},
                  child: Text(keyViewAll.tr,
                      style: textStyleBodySmall().copyWith(
                          color: AppColors.primaryTextColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryTextColor)),
                ),
              ],
            ).paddingSymmetric(vertical: 15.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                  ]),
              child: ListView.separated(
                itemCount: 2,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 15.h),
                itemBuilder: (BuildContext context, int index) => Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.textFieldBorderColor, width: 1.w),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              // controller.memberData.value.billingHistory?[index]
                              //         .name ??
                              '20 mins Private',
                              style: textStyleLabelMedium()),
                          Text(
                              // controller.memberData.value.billingHistory?[index].name ??
                              'safgsadf',
                              style: textStyleBodySmall())
                        ],
                      ),
                      Text(
                          // controller.memberData.value.billingHistory?[index].netPrice ??
                          '\$49',
                          style: textStyleDisplayMedium()),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(keyPOSHistory.tr, style: textStyleDisplaySmall()),
                InkWell(
                  onTap: () {},
                  child: Text(keyViewAll.tr,
                      style: textStyleBodySmall().copyWith(
                          color: AppColors.primaryTextColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryTextColor)),
                ),
              ],
            ).paddingSymmetric(vertical: 15.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                  ]),
              child: ListView.separated(
                // itemCount: (controller.memberData.value.posHistory?.length ?? 0) > 4 ? 4: controller.memberData.value.posHistory?.length ?? 0,
                itemCount: 4,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  height: 0.5.h,
                  width: Get.width,
                  color: AppColors.textFieldBorderColor,
                ).paddingSymmetric(vertical: 12.h, horizontal: 2.h),
                itemBuilder: (BuildContext context, int index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        // controller.memberData.value.billingHistory?[index]
                        //         .name ??
                        'Protien Shake',
                        style: textStyleLabelMedium()),
                    Text(
                        // controller.memberData.value.billingHistory?[index].netPrice ??
                        'Nov',
                        style: textStyleBodyLarge()),
                  ],
                ),
              ),
            )
          ],
        ).paddingSymmetric(vertical: 20.h, horizontal: 16.h),
      );
}
