import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:impact_zone/app_values/text_styles.dart';

import '../app_values/app_images.dart';
import 'custom_asset_image_widget.dart';

topBanner({String title=""}) => Stack(
    children: [
      AssetImageWidget(
        AppImages.iconsHomeBg,
        imageHeight: 90.h,
        imageWidth: Get.width,
        imageFitType: BoxFit.cover,
        radiusBottomLeft: 15.r,
        radiusBottomRight: 15.r,
      ),
      Padding(
        padding:  EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child:AssetImageWidget(
                  AppImages.iconsBack,
                  imageHeight: 20.h,
                )
            ),
            Text(title,style: textStyleHeadlineLarge().copyWith(color: Colors.white)),
            AssetImageWidget(
              AppImages.iconsNotification,
              imageHeight: 20.h,
            ),
          ],
        ).paddingOnly(top: 20.h, left: 12.h, right: 12.h),
      )
    ]
);