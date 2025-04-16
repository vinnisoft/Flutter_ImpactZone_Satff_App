import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/app_values/app_colors.dart';
import 'package:impact_zone/app_values/app_images.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/checkout/checkout_controller.dart';

import '../../translation/local_keys.dart';
import '../../widgets/top_banner.dart';

class CheckoutScreen extends GetView<CheckOutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBanner(title: keyCheckout.tr),
        Padding(
          padding: const EdgeInsets.all(16),
          child:  GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: controller.checkOutTypeList.map((option) {
                return InkWell(
                  onTap: (){
                    if(option['title']=="Card on File"){
                      Get.toNamed(AppRoutes.routePosCardOnFileScreen);
                      return;
                    }
                    Get.toNamed(AppRoutes.routePosCheckoutDetailsScreen);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 137,
                        width: 137,
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          border: Border.all(
                            color: Color(0xFF1B1E36),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            option['icon'].toString(),
                            height: 40,
                            width: 40,
                            color: Color(0xFF1B1E36),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        option['title'].toString(),
                        style: TextStyle(
                          color: Color(0xFF1B1E36),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

            Column(
              children: [
                Container(
                height: 137,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.containerGreyColor)
                  ),
                  child: Image.asset(AppImages.iconsPayLaterIcon),
                ).paddingSymmetric(horizontal: 40,vertical: 5.h),
                Text(
                 "Pay Later",
                  style: TextStyle(
                    color: Color(0xFF1B1E36),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ).paddingOnly(bottom: 20)
        
          ],
        ),
      ),
    );
  }
}
